package com.sdd.service;

import java.util.List;

import com.sdd.pojo.po.Leave;

public interface ILeaveService {

	List<Leave> findAllLeave(Integer admin);

	List<Leave> findSelfLeave(String username);

	int insertLeave(Leave leave);

	int updateLeave(Leave leave);

}
