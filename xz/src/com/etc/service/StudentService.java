package com.etc.service;

import java.util.List;

import com.etc.dao.StudentDao;
import com.etc.dao.UserDao;
import com.etc.entity.Student;
import com.etc.entity.User;



public class StudentService {
	
	/**
	 * �ж��Ƿ����ע��  �Ǹ�Уѧ���ſ���ע��
	 */

	static StudentDao sd = new StudentDao();
	public  boolean isStudent(String name,String xuehao,String school) {
		List<Student> list = sd.isStudent(name, xuehao, school);
		if (list.size() == 0) {
			return false; //ѧУû�и���
		}
		return true;		
	}
	
	
	
	
}

