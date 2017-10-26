package com.etc.dao;

import java.util.ArrayList;
import java.util.List;

import com.etc.cms.util.BaseDao;
import com.etc.cms.util.PageData;
import com.etc.controller.x_messageservlet;
import com.etc.entity.X_MESSAGEALL;
import com.etc.service.X_messageall_service;

public class X_messageallDao {
	public static PageData<X_MESSAGEALL> getMessage(String messagestate,int page,int pageSize,String username) {
		
		String sql = "select * from X_MESSAGEALL where messagestate=? and USERNAME=? order by MESSAGEDATE desc";
		return (PageData<X_MESSAGEALL>) BaseDao.OraclegetPage(sql, page, pageSize,X_MESSAGEALL.class,messagestate,username);
	}

	

	public PageData<X_MESSAGEALL> getAllMessageByPage(int page, int pageSize,String USERNAME, String GOODTITLE,String username) {
		System.out.println(username);
		return (PageData<X_MESSAGEALL>) BaseDao.OraclegetPage(
				"select * from X_MESSAGEALL where USERNAME=? AND (USERNAME like ? OR GOODTITLE LIKE ?)   order by MESSAGEDATE desc", page, pageSize,
				X_MESSAGEALL.class,username, "%" + USERNAME + "%", "%" + GOODTITLE+ "%");
	}
	//增删改通用
	public boolean addMessage(int GOODID,int FROMID,int TOID,String content){
		String sql= "insert into X_MESSAGE values(null,?,?,sysdate,'未读',?,?)";
		return BaseDao.execute(sql, GOODID,FROMID,TOID,content)>0;
		
	}
	public boolean updateMessage(int messageid){
		String sql ="update X_MESSAGE set MESSAGESTATE='已读'where messageid=?";
		return BaseDao.execute(sql, messageid)>0;
	}
	public boolean deleteMessage(int messageid){
		String sql= "delete X_MESSAGEALL where messageid=?";
		return BaseDao.execute(sql, messageid)>0;
	}
	
	public static void main(String[] args) {
		X_messageall_service xms=new X_messageall_service();
		PageData<X_MESSAGEALL> pd=xms.getAllMESSAGEByPage(1,10,"","","admin"); 
	for (X_MESSAGEALL xml : pd.getData()) {
		System.out.println(xml);
	}
	}


}
