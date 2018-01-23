package com.sdd.service.impl;

import java.util.List;

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
	public void saveUser(User user) {
		ium.saveUser(user);
		
	}

	@Override
	public List<User> findAll() {
		return ium.findAll();
		
	}

}
