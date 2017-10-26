package com.etc.dao;

import java.util.ArrayList;
import java.util.List;

import com.etc.cms.util.BaseDao;
import com.etc.cms.util.PageData;
import com.etc.entity.Account_Message;






public class Account_MessageDao {
	public static List<Account_Message> getAllMessage(){
		String sql="select * from X_Message";
		return (List<Account_Message>)BaseDao.select(sql, Account_Message.class, null);
	}
	public PageData<Account_Message> getMessageByPage(String start, String length, String pename) {
		String sql = "select * from X_Message where  GOODID=?";
		return BaseDao.getOraclePage(sql, start, length, Account_Message.class, "%"
				+ pename + "%");
	}
	public static void main(String[] args) {
		List<Account_Message> list = new ArrayList();
		list = getAllMessage();
		for (Account_Message Message : list) {
			System.out.println(Message);
		}
	}
}
