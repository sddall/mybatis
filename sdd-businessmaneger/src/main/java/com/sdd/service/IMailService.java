package com.sdd.service;



import java.util.List;

import com.sdd.pojo.po.Mail;

public interface IMailService {
	int saveMail(Mail mail);
	List<Mail> findAllMail(Mail mail);
	int updateReadInfo(Integer eid);
	Mail findReadMail(Integer eid);
	int updateEmail(Mail mail);
	int deleteEmail(Mail mail);
}
