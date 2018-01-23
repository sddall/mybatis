package com.sdd.pojo.po;

import java.io.File;

import org.springframework.web.multipart.MultipartFile;

public class Mail {
	private String receiver;
	private String title;
	private String contextArea;
	private Integer eid;
	private MultipartFile otherFile;
	private String filePath;
	private String sendTime;
	private String writer;
	private String isread;
	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getIsread() {
		return isread;
	}

	public void setIsread(String isread) {
		this.isread = isread;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContextArea() {
		return contextArea;
	}

	public void setContextArea(String contextArea) {
		this.contextArea = contextArea;
	}

	public Integer getEid() {
		return eid;
	}

	public void setEid(Integer eid) {
		this.eid = eid;
	}

	
	public MultipartFile getOtherFile() {
		return otherFile;
	}

	public void setOtherFile(MultipartFile otherFile) {
		this.otherFile = otherFile;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	
	public String getSendTime() {
		return sendTime;
	}

	public void setSendTime(String sendTime) {
		this.sendTime = sendTime;
	}

	

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Mail() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
