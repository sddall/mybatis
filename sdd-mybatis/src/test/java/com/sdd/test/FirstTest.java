package com.sdd.test;

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
		Student stu=new Student(4,"ËïËÄ","123",15,"male",2);
		iss.addStudent(stu);
	}
	@Test
	public void removeStudentTest(){
		iss.removeStudentById(4);
	}

}
