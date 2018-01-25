package com.sdd.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sdd.pojo.po.Mail;
import com.sdd.pojo.po.User;
import com.sdd.service.IUserService;

@Controller
@RequestMapping(value = "/user")
public class UserAction {
	@Resource(name="userServiceImpl")
	IUserService us;

	@RequestMapping(value = "/tologin.do")
	public String tologin() {
		return "login";
	}

	@RequestMapping(value = "/login.do")
	@ResponseBody
	public String dologin(User user,HttpSession session) {
		if (user != null) {
			User findUser = us.findUserById(user);
			if (findUser != null) {
				if (findUser.getPassword().equals(user.getPassword())) {
					session.setAttribute("sessionUser",findUser);
					return "1";
				} else {
					return "0";
				}
			} else {
				return "0";
			}
		}else {
			return "0";
		}

	}
	@RequestMapping(value="/toindex.do")
	public String index(){
		return "index";
	}
	@RequestMapping(value="/loginOut")
	public String loginOut() {
		return "login";
	}
	@RequestMapping(value="/forward")
	public String selfInfo(){
		return "selfInfo";
	}
	@RequestMapping(value="/edit.do")
	@ResponseBody
	public String editor(User user,HttpSession session){
		if(user!=null ){
			us.updateUser(user);
			session.setAttribute("sessionUser",user);
			return "0";
		}
		return "1";
		
	}
	@RequestMapping(value="/toEdit.do")
	public String toEdit(){
		return "selfInfo";
	}
	@RequestMapping(value="/mailWrite")
	public String mailWrite(HttpSession session){
		session.setAttribute("menberList",us.findAll());
		return "mailWrite";
	}
	@RequestMapping(value="/singleAccountData")
	public String singleData(){
		return "singleAccount";
	}
	@RequestMapping(value="/singleAcount")
	@ResponseBody
	public String singleAcount(User user,HttpSession session){
		us.updateUser(user);
		User user2=us.findUserById(user);
		session.setAttribute("sessionUser",user2);
		return "0";
	}
	@RequestMapping(value="/allAccountData")
	public String allAccount(HttpSession session){
		User user=(User) session.getAttribute("sessionUser");
		int isadmin=user.getIsadmin();
		if(isadmin==0){
			return "notadmin";
		}else if(isadmin==1){
			session.setAttribute("memberList", us.findAll());
			return "accountManage";
		}else{
			return "login";
		}
	}
	@RequestMapping(value="toAddAccount")
	public String toAddAccount(){
		return "addAccount";
	}
	@RequestMapping(value="/addAccount")	
	public String addAccount(User user){
		user.setIsadmin(0);
		us.insertUser(user);
		return "forward:/user/allAccountData";
		
	}
}
