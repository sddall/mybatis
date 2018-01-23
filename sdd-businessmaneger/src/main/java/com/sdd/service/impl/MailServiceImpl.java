package com.sdd.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.sdd.mapper.IMailMapper;
import com.sdd.pojo.po.Mail;
import com.sdd.service.IMailService;

@Component
public class MailServiceImpl implements IMailService {
	@Autowired
	IMailMapper imm;
	@Override
	@Transactional
	public int saveMail(Mail mail) {
		return imm.saveMail(mail);
		
	}

}
