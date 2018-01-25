package com.sdd.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mysql.jdbc.interceptors.SessionAssociationInterceptor;
import com.sdd.pojo.po.Mail;
import com.sdd.service.IMailService;

@Controller
@RequestMapping(value="/user")
public class MailAction {

	@Resource(name="mailServiceImpl")
	IMailService ims;
	
	@Autowired
	Mail mail;
	
	@RequestMapping(value="/sendMail.do")
	@ResponseBody
	public String sendMail(Mail mail){
		ims.saveMail(mail);
		return "0";
		
	}
	@RequestMapping(value="/mailReceive")
	//@ResponseBody
	public String mailReceive(Integer receiver, HttpSession session){
		mail.setReceiver(receiver);
		mail.setIsdelete(0);
		List<Mail> list=ims.findAllMail(mail);
		if(list.size()==0){
			return "noMail";
		}else{
			session.setAttribute("mails", list);
			return "mailReceiver";
		}
	}
	@RequestMapping(value="/mailInfo")
	public String mailInfo(Integer eid,Integer receiver, HttpSession session){
		ims.updateReadInfo(eid);
		Mail mail=ims.findReadMail(eid);
		session.setAttribute("readMail",mail);
		return "mailInfo";
	}
	@RequestMapping(value="mailDelete.do")
	@ResponseBody
	public String mailDelete(Integer eid){
		mail.setIsdelete(1);
		mail.setEid(eid);
		ims.updateEmail(mail);
		return "0";
		
	}
	@RequestMapping(value="mailGarage")
	public String mailGarage(Integer receiver, HttpSession session){
		mail.setIsdelete(1);
		mail.setReceiver(receiver);
		List<Mail> list=ims.findAllMail(mail);
		if(list.size()==0){
			return "noGarage";
		}else{
			session.setAttribute("garage", list);
			return "mailGarage";
		}
		
	}
	@RequestMapping(value="mailRestore.do")
	@ResponseBody
	public String mailRestore(Integer eid){
		mail.setIsdelete(0);
		mail.setEid(eid);
		ims.updateEmail(mail);
		return "0";
		
	}
	@RequestMapping(value="comDelete.do")
	@ResponseBody
	public String comDelete(Integer eid){
		mail.setEid(eid);
		ims.deleteEmail(mail);
		return "0";
		
	}
}
