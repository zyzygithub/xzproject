package com.etc.dao;

import java.util.ArrayList;
import java.util.List;

import com.etc.cms.util.BaseDao;

import com.etc.entity.Student;
import com.etc.entity.User;


public class StudentDao {
	
	
	
	public static List<Student> isStudent(String name,String xuehao,String school) {
		String sql="select * from "+school+" where NAME =? and XUEHAO =?";
		//String sql1="select * from X_PTU";
		//return (List<Student>)BaseDao.select(sql1, Student.class, username,xuehao);
		return (List<Student>)BaseDao.select(sql, Student.class,name,xuehao);
	}
	public static void main(String[] args) {
		List<Student> list = isStudent("ÕÅæÂ","201411402136","X_PTU");
		for (Student Student : list) {
			System.out.println(Student);
		}
	}
}
