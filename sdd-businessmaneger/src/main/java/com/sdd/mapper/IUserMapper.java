package com.sdd.mapper;

import java.util.List;

import com.sdd.pojo.po.User;

public interface IUserMapper {
	User findUserById(User user);
	void updateUser(User user);
	List<User> findAll();
	List<User> findAdmin();
	int insertUser(User user);
}
