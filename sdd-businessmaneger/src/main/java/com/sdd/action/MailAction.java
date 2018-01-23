package com.sdd.action;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sdd.pojo.po.Mail;
import com.sdd.service.IMailService;

@Controller
@RequestMapping(value="/user")
public class MailAction {

	@Resource(name="mailServiceImpl")
	IMailService ims;
	
	@RequestMapping
	public String sendMail(Mail mail){
		ims.saveMail(mail);
		return "0";
		
	}
}
