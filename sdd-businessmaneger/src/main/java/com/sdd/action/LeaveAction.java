package com.sdd.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sdd.pojo.po.Leave;
import com.sdd.pojo.po.User;
import com.sdd.service.ILeaveService;
import com.sdd.service.IUserService;

@Controller
@RequestMapping(value="/user")
public class LeaveAction {
	
	@Autowired
	ILeaveService ils;
	@Autowired
	User user;
	@Autowired
	IUserService ium;
	@Autowired
	Leave leave;
	
	@RequestMapping(value="/leave")
	public String leaveAction(HttpSession session){
		user=(User) session.getAttribute("sessionUser");
		if(user!=null){
			if(user.getIsadmin()==1){
				List<Leave> all=ils.findAllLeave(user.getIsadmin());
				session.setAttribute("allLeave", all);
				return "leaveManage";
			}else{
				System.out.println(user.getUsername());
				List<Leave> self=ils.findSelfLeave(user.getUsername());
				session.setAttribute("selfLeave", self);
				return "leave";
			}
		}else{
			return "login";
		}	
	}
	@RequestMapping(value="/leaveEdit")
	public String leaveEdit(HttpSession session){
		List<User> admins =ium.findAdmin();
		session.setAttribute("admins", admins);
		return "leaveEdit";
	}
	@RequestMapping(value="/leaveApply.do")
	@ResponseBody
	public String leaveApply(Leave leave){
		//0表示未审批,1表示审批通过,2表示审批未通过
		leave.setApproval(0);
		ils.insertLeave(leave);
		return "0";
	}
	@RequestMapping(value="/isApplied")
	@ResponseBody
	public String updateLeave(Integer lid,Integer approval,HttpSession session){
		leave.setLid(lid);
		leave.setApproval(approval);
		ils.updateLeave(leave);
		return "0";
		
	}
}
