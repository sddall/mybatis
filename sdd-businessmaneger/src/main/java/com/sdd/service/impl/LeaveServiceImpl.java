package com.sdd.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.sdd.mapper.ILeaveMapper;
import com.sdd.pojo.po.Leave;
import com.sdd.service.ILeaveService;

@Component
public class LeaveServiceImpl implements ILeaveService {
	@Autowired
	ILeaveMapper ilm;

	@Override
	@Transactional
	public List<Leave> findSelfLeave(String username) {
		// TODO Auto-generated method stub
		return ilm.findSelfLeave(username);
	}

	@Override
	@Transactional
	public int insertLeave(Leave leave) {
		// TODO Auto-generated method stub
		return ilm.insertLeave(leave);
	}

	@Override
	public List<Leave> findAllLeave(Integer admin) {
		return ilm.findAllLeave(admin);
		 
	}

	@Override
	public int updateLeave(Leave leave) {
		return ilm.updateLeave(leave);
		
	}

}
