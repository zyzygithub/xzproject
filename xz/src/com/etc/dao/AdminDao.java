package com.etc.dao;

import java.util.ArrayList;
import java.util.List;

import com.etc.cms.util.BaseDao;
import com.etc.entity.Admin;

import sun.applet.Main;
/**
 * ����Ա��dao��
 * @author Administrator
 *
 */
public class AdminDao {
	/**
	 *  ��ѯ���еĹ���Ա��Ϣ
	 * @return
	 */
	public static List<Admin> getAdmin(){
		return (List<Admin>)BaseDao.select("select * from x_admin", Admin.class, null);
	}
	/**
	 * ������
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
