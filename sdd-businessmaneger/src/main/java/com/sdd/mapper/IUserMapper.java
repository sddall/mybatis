package com.sdd.mapper;

import java.util.List;

import com.sdd.pojo.po.User;

public interface IUserMapper {
	User findUserById(User user);
	void saveUser(User user);
	List<User> findAll();
}
