package com.sdd.service;

import com.sdd.pojo.po.Student;

public interface IStudentService {
	void addStudent(Student stu);
	void removeStudentById(Integer id);
	void updateStudentById(Integer id);
	Student selectOneById(Integer id);
}
