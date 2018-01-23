package com.sdd.service.impl;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

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
	public int saveMail(Mail mail){
		
		if (!mail.getOtherFile().isEmpty()) {
			String filePath = "D:/Service/" + mail.getOtherFile().getOriginalFilename();
			mail.setFilePath(filePath);
			File file = new File(filePath);
			if (!file.exists()) {
				file.mkdirs();
			}
			try {
				mail.getOtherFile().transferTo(file);
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String sendTime=sdf.format(date);
		mail.setSendTime(sendTime);
		mail.setIsread("0");
		return imm.saveMail(mail);
		
	}

}
