package com.sdd.service;

import java.util.List;

import com.sdd.pojo.po.Leave;
import com.sdd.pojo.po.User;

public interface IUserService {
	User findUserById(User user);
	void saveUser(User user);
	List<User> findAll();
	List<User> findAdmin();
}
