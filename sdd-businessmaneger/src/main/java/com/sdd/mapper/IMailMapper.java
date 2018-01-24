package com.sdd.mapper;

import java.util.List;

import com.sdd.pojo.po.Mail;

public interface IMailMapper {
	int saveMail(Mail mail);
	List<Mail> findAllMail(Mail email);
	int updateReadInfo(Integer eid);
	Mail findReadMail(Integer eid);
	int updateEmail(Mail mail);
}
