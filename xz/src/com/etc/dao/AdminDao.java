package com.etc.dao;

import java.util.ArrayList;
import java.util.List;

import com.etc.cms.util.BaseDao;
import com.etc.entity.Admin;

import sun.applet.Main;
/**
 * 管理员的dao类
 * @author Administrator
 *
 */
public class AdminDao {
	/**
	 *  查询所有的管理员信息
	 * @return
	 */
	public static List<Admin> getAdmin(){
		return (List<Admin>)BaseDao.select("select * from x_admin", Admin.class, null);
	}
	/**
	 * 测试用
	 * @param args
	 */
	public static void main(String[] args) {
		List<Admin> list =new ArrayList();
		list=getAdmin();
		for (Admin admin : list) {
			System.out.println(admin);
		}
	}
}
