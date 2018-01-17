package com.sdd.test;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import com.sdd.pojo.po.Student;
import com.sdd.service.IStudentService;
import com.sdd.service.impl.StudentService;

public class FirstTest {
	IStudentService iss;
	@Before
	public void init(){
		iss=new StudentService();
	}

	@Test
	public void addStudentTest() {
		Student stu=new Student();
		stu.setName("Œ‚¡˘");
		stu.setPassword("123456");
		iss.addStudent(stu);
		System.out.println(stu.getId());
	}
	@Test
	public void removeStudentTest(){
		iss.removeStudentById(4);
	}
	@Test
	public void selectStudentById(){
		Student stu=iss.selectOneById(3);
	}
	@Test
	public void selectStudent(){
		Student stu=new Student();
		stu.setCid(2);
		List<Student> list=iss.selectStudent(stu);
	}
}
