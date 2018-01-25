package com.sdd.mapper;

import java.util.List;

import org.springframework.stereotype.Component;

import com.sdd.pojo.po.Leave;

@Component
public interface ILeaveMapper {
	List<Leave> findAllLeave(Integer admin);
	List<Leave> findSelfLeave(String username);
	int insertLeave(Leave leave);
	int updateLeave(Leave leave);
}
