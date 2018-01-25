package com.sdd.service.impl;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

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
			String filePath = "D:/mybatis_repository/sdd-businessmaneger/src/main/webapp/file/" + mail.getOtherFile().getOriginalFilename();
			mail.setFilePath("/file/"+mail.getOtherFile().getOriginalFilename());
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
		mail.setIsread(0);
		mail.setIsdelete(0);
		return imm.saveMail(mail);
		
	}
	@Override
	@Transactional
	public List<Mail> findAllMail(Mail mail) {
		return imm.findAllMail(mail);
	}
	@Override
	@Transactional
	public int updateReadInfo(Integer eid) {
		return imm.updateReadInfo(eid);
	}
	@Override
	@Transactional
	public Mail findReadMail(Integer eid) {
		
		return imm.findReadMail(eid);
	}
	@Override
	@Transactional
	public int updateEmail(Mail mail) {
		return imm.updateEmail(mail);
		
	}
	@Override
	public int deleteEmail(Mail mail) {
		// TODO Auto-generated method stub
		return imm.deleteEmail(mail);
	}
	

}
