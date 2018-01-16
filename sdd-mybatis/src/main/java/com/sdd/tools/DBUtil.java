package com.sdd.tools;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
public class DBUtil {
	static SqlSessionFactory ssf;
	static{
		String resource="mybatis-config.xml";
		InputStream is=null;
		try {
			is= Resources.getResourceAsStream(resource);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ssf=new SqlSessionFactoryBuilder().build(is);
	}
	public static SqlSessionFactory findSqlSessionFactory(){
		return ssf;
	}
}
