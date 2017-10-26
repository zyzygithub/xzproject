package com.etc.service;

import java.util.List;


import com.etc.cms.util.PageData;
import com.etc.dao.X_messageallDao;
import com.etc.entity.X_MESSAGEALL;

public class X_messageall_service {
	X_messageallDao xm =new X_messageallDao();
	
	public PageData<X_MESSAGEALL> getMessage(String messagestate,int page,int pageSize ,String username){
		
		PageData<X_MESSAGEALL> pd=xm.getMessage(messagestate,page, pageSize,username);
	
				return pd;
	}
	public PageData<X_MESSAGEALL> getAllMESSAGEByPage(int page,int pageSize,String USERNAME, String MESSAGECONTENT,String username) {
		return xm.getAllMessageByPage(page, pageSize,USERNAME,MESSAGECONTENT,username);
	}
	public boolean addMessage(int GOODID,int FROMID,int TOID,String content){
		return xm.addMessage(GOODID, FROMID, TOID, content);
	}
	public boolean update(int messageid){
		return xm.updateMessage(messageid);
	}
	public boolean deleteMessage(int messageid){
		return xm.deleteMessage(messageid);
	}

	

}
