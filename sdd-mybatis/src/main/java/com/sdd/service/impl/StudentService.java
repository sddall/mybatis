package com.sdd.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sdd.mapper.IStudentMapper;
import com.sdd.pojo.po.Student;
import com.sdd.service.IStudentService;
import com.sdd.tools.DBUtil;

public class StudentService implements IStudentService {
	SqlSessionFactory ssf;
	public StudentService() {
		ssf=DBUtil.findSqlSessionFactory();
	}

	@Override
	public void addStudent(Student stu) {
		SqlSession ss=ssf.openSession();
		try {
			ss.insert("com.sdd.mapper.IStudentMapper.addStudent",stu);
			ss.commit();
		} catch (Exception e) {
			e.printStackTrace();
			ss.rollback();
		}finally{
			ss.close();
		}
	}

	@Override
	public void removeStudentById(Integer id) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateStudentById(Integer id) {
		// TODO Auto-generated method stub

	}

	@Override
	public Student selectOneById(Integer id) {
		SqlSession ss=ssf.openSession();
		Student stu=ss.selectOne("com.sdd.mapper.IStudentMapper.selectStudentById",id);
		return stu;
	}

	@Override
	public List<Student> selectStudent(Student stu) {
		SqlSession ss=ssf.openSession();
		return ss.selectList("com.sdd.mapper.IStudentMapper.selectStudent",stu);
		
	}
	
}
