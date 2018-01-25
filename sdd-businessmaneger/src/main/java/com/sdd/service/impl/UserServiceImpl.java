package com.sdd.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.sdd.mapper.IUserMapper;
import com.sdd.pojo.po.User;
import com.sdd.service.IUserService;

@Component
public class UserServiceImpl implements IUserService {
	@Autowired
	IUserMapper ium;

	@Override
	@Transactional
	public User findUserById(User user) {
		return ium.findUserById(user);
		
	}

	@Override
	@Transactional
	public void updateUser(User user) {
		ium.updateUser(user);
		
	}

	@Override
	@Transactional
	public List<User> findAll() {
		return ium.findAll();
		
	}

	@Override
	@Transactional
	public List<User> findAdmin() {
		return ium.findAdmin();
	}

	@Override
	@Transactional
	public int insertUser(User user) {
		ium.insertUser(user);
		return 0;
	}

}
