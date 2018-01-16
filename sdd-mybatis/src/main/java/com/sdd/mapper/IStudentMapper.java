package com.sdd.mapper;
import com.sdd.pojo.po.Student;

public interface IStudentMapper {
	void addStudent(Student stu);
	void removeStudentById(Integer id);
	void updateStudentById(Integer id);
	Student selectOneById(Integer id);
	
}
