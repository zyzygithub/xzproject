package com.etc.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.etc.cms.util.BaseDao;
import com.etc.cms.util.MessageDetails;
import com.etc.cms.util.PageData;
import com.etc.entity.Message;


public class MessageDao {
	public static List<Message> getAllMessage(){
		String sql="select * from X_Message";
		return (List<Message>)BaseDao.select(sql, Message.class, null);
	}
	public PageData<MessageDetails> getMsgByGoodId(int goodId,int page) {
		return BaseDao.OraclegetPage("select * from X_VIEW_GETMESSAGE WHERE GOODID=? AND MESSAGETYPE=1 ", page, 5, MessageDetails.class, goodId);
	}
	
	public void sendGoodMessage(int goodId,String userName,String messageContent) {
		Connection conn=BaseDao.getConn();
		String sql="{call X_SENDGOODMESSAGE(?,?,?)}";
		CallableStatement cstmt=null;
		try {
			cstmt=conn.prepareCall(sql);
			cstmt.setInt(1, goodId);
			cstmt.setString(2, userName);
			cstmt.setString(3, messageContent);
			cstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				cstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
