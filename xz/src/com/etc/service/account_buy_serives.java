package com.etc.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.etc.cms.util.BaseDao;
import com.etc.cms.util.PageData;

import com.etc.entity.Admin;
import com.etc.entity.PERSONGOODS_IN;
import com.etc.entity.PERSONGOODS_OUT;
import com.etc.entity.User;

public class account_buy_serives {

	
	public PageData get_waitDelivery(String user,
	int page,
	int pagesize,
	String blurry,
	String order,
	String state,
	String inorout){
		//PSERSONGOOD_IN_DAO pid =new PSERSONGOOD_IN_DAO();
		
		BaseDao bd=new BaseDao();
		PageData pd=null;
		if(user.equals("")) {
			if(inorout.equals("in")) {
			if(order.equals("asc")) {
				
		pd=bd.getorcalePage("select * from PERSONGOODS_IN where  ORDERSTATE=? and (ORDERID like ? or BUYCOUNT like ? or USERREALNAME like ? or GPPOSITOIN like ? or GPPHONE like ? or GOODTITLE like ? or GOODPRICE like ? or GOODREMARK like ? or GOODPIC like ? or TYPENAME like ? or TYPEMESNAME like ? or ORDERSTATE like ? or SENDPOSITION like ? or ORDERDATE like ? or ORDERREMARK like ? OR to_char(ORDERDATE,'yyyy-MM-dd') like ?)ORDER BY ORDERDATE asc", 
				page, pagesize,PERSONGOODS_IN.class,state,"%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%");
			}if(order.equals("desc")) {

				pd=bd.getorcalePage("select * from PERSONGOODS_IN where  ORDERSTATE=? and (ORDERID like ? or BUYCOUNT like ? or USERREALNAME like ? or GPPOSITOIN like ? or GPPHONE like ? or GOODTITLE like ? or GOODPRICE like ? or GOODREMARK like ? or GOODPIC like ? or TYPENAME like ? or TYPEMESNAME like ? or ORDERSTATE like ? or SENDPOSITION like ? or ORDERDATE like ? or ORDERREMARK like ? OR to_char(ORDERDATE,'yyyy-MM-dd') like ?)ORDER BY ORDERDATE asc", 
						page, pagesize,PERSONGOODS_IN.class,state,"%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%");
			}
		}else if(inorout.equals("out")){
			if(order.equals("asc")) {
				
				pd=bd.getorcalePage("select * from PERSONGOODS_OUT where  ORDERSTATE=? and (ORDERID like ? or BUYCOUNT like ? or USERREALNAME like ? or GPPOSITOIN like ? or GPPHONE like ? or GOODTITLE like ? or GOODPRICE like ? or GOODREMARK like ? or GOODPIC like ? or TYPENAME like ? or TYPEMESNAME like ? or ORDERSTATE like ? or RECEIVEPOSITION like ? or ORDERDATE like ? or ORDERREMARK like ? OR to_char(ORDERDATE,'yyyy-MM-dd') like ?)ORDER BY ORDERDATE asc", 
						page, pagesize,PERSONGOODS_OUT.class,state,"%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%");
					}if(order.equals("desc")) {

						pd=bd.getorcalePage("select * from PERSONGOODS_OUT where  ORDERSTATE=? and (ORDERID like ? or BUYCOUNT like ? or USERREALNAME like ? or GPPOSITOIN like ? or GPPHONE like ? or GOODTITLE like ? or GOODPRICE like ? or GOODREMARK like ? or GOODPIC like ? or TYPENAME like ? or TYPEMESNAME like ? or ORDERSTATE like ? or RECEIVEPOSITION like ? or ORDERDATE like ? or ORDERREMARK like ? OR to_char(ORDERDATE,'yyyy-MM-dd') like ?)ORDER BY ORDERDATE asc", 
								page, pagesize,PERSONGOODS_OUT.class,state,"%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%");
					}
		}
		}else {
			//带着名字的输入in
			if(inorout.equals("in")) {
			if(order.equals("asc")) {
			pd=bd.getorcalePage("select * from PERSONGOODS_IN where USERNAME=? and ORDERSTATE=? and (ORDERID like ? or BUYCOUNT like ? or USERREALNAME like ? or GPPOSITOIN like ? or GPPHONE like ? or GOODTITLE like ? or GOODPRICE like ? or GOODREMARK like ? or GOODPIC like ? or TYPENAME like ? or TYPEMESNAME like ? or ORDERSTATE like ? or SENDPOSITION like ? or ORDERDATE like ? or ORDERREMARK like ? or to_char(ORDERDATE,'yyyy-MM-dd') like ?)ORDER BY ORDERDATE asc ", 
					page, pagesize,PERSONGOODS_IN.class,user,state,"%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%");
			}if(order.equals("desc")) {

				pd=bd.getorcalePage("select * from PERSONGOODS_IN where USERNAME=? and ORDERSTATE=?  and (ORDERID like ? or BUYCOUNT like ? or USERREALNAME like ? or GPPOSITOIN like ? or GPPHONE like ? or GOODTITLE like ? or GOODPRICE like ? or GOODREMARK like ? or GOODPIC like ? or TYPENAME like ? or TYPEMESNAME like ? or ORDERSTATE like ? or SENDPOSITION like ? or ORDERDATE like ? or ORDERREMARK like ? or to_char(ORDERDATE,'yyyy-MM-dd') like ?)ORDER BY ORDERDATE desc ", 
						page, pagesize,PERSONGOODS_IN.class,user,state,"%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%");
			}
		    }
			//带着名字的输入OUT
			else if(inorout.equals("out")){
			if(order.equals("asc")) {
				pd=bd.getorcalePage("select * from PERSONGOODS_OUT where USERNAME=? and ORDERSTATE=? and (ORDERID like ? or BUYCOUNT like ? or USERREALNAME like ? or GPPOSITOIN like ? or GPPHONE like ? or GOODTITLE like ? or GOODPRICE like ? or GOODREMARK like ? or GOODPIC like ? or TYPENAME like ? or TYPEMESNAME like ? or ORDERSTATE like ? or USERID like ? or ORDERDATE like ? or ORDERREMARK like ? or to_char(ORDERDATE,'yyyy-MM-dd') like ?)ORDER BY ORDERDATE asc ", 
						page, pagesize,PERSONGOODS_OUT.class,user,state,"%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%");
				}if(order.equals("desc")) {

					pd=bd.getorcalePage("select * from PERSONGOODS_OUT where USERNAME=? and ORDERSTATE=?  and (ORDERID like ? or BUYCOUNT like ? or USERREALNAME like ? or GPPOSITOIN like ? or GPPHONE like ? or GOODTITLE like ? or GOODPRICE like ? or GOODREMARK like ? or GOODPIC like ? or TYPENAME like ? or TYPEMESNAME like ? or ORDERSTATE like ? or USERID like ? or ORDERDATE like ? or ORDERREMARK like ? or to_char(ORDERDATE,'yyyy-MM-dd') like ?)ORDER BY ORDERDATE desc ", 
							page, pagesize,PERSONGOODS_OUT.class,user,state,"%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%");
				}
		}	
			
			
			
	}
		
		//将得到的编号转换成用户名
		int sendid=0;
		String sendname="";
          if(inorout.equals("in")) {
			
			List<PERSONGOODS_IN> list=pd.getData();
			for (PERSONGOODS_IN persongoods_IN : list) {
				sendid=Integer.parseInt((String)persongoods_IN.getSENDPOSITION());
				
				
				List<User> users=(List<User>)bd.select("select X_USER.USERNAME FROM X_USER,X_GOODPOSITION WHERE X_GOODPOSITION.GPID=? AND X_USER.USERID=X_GOODPOSITION.GPUSERID",User.class, sendid);
				for (User user2 : users) {
					sendname=user2.getUSERNAME();
				}
				
				persongoods_IN.setSENDPOSITION(sendname);
				
			}
		}else if(inorout.equals("out")){
		

			List<PERSONGOODS_OUT> list=pd.getData();
			for (PERSONGOODS_OUT persongoods_OUT : list) {
				sendid=Integer.parseInt((String)persongoods_OUT.getUSERID());
				
				
				List<User> users=(List<User>)bd.select("select X_USER.USERNAME FROM X_USER WHERE USERID=? ",User.class, sendid);
				for (User user2 : users) {
					sendname=user2.getUSERNAME();
				}
				
				persongoods_OUT.setUSERID(sendname);
				
			}
		}
		
		return pd;
		
	}
	

	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
     account_buy_serives abs=new account_buy_serives();
PageData<PERSONGOODS_OUT> pd=abs.get_waitDelivery("yyy",1,10,"","asc","已完成","out");
for (PERSONGOODS_OUT admin : pd.getData()) {
	
}
	}



//去评价
	public void addevaluate(String username, int sendid, String date, int score, String text,int orderid) {
		// TODO Auto-generated method stub
		
		BaseDao bd=new BaseDao();
		Connection conn= bd.getConn();
		try {
			conn.setAutoCommit(false);
			
			//先将username转换成id
		PreparedStatement pstmid=conn.prepareStatement("select USERID from X_USER WHERE USERNAME=?");
		pstmid.setString(1, username);
		ResultSet rs=pstmid.executeQuery();
		int userid=-1;
		while(rs.next()) {
			userid=rs.getInt(1);
		}
		
		if(userid>0) {
			//先在comment添加记录
			rs.close();
			pstmid.close();
			
			PreparedStatement buyid=conn.prepareStatement("select * from PERSONGOODS_OUT WHERE ORDERID=?");
			buyid.setInt(1,orderid);
			ResultSet ss=buyid.executeQuery();
			String  buyername="";
			while(ss.next()) {
				buyername=ss.getString("USERNAME");
			}
			//System.out.println("userid:"+userid+"buyid:"+buyerid);
			buyid.close();
			ss.close();
			
			PreparedStatement buyer=conn.prepareStatement("select * from X_USER WHERE USERNAME=?");
			buyer.setString(1,buyername);
			ResultSet sss=buyer.executeQuery();
			int  buyerid=0;
			while(sss.next()) {
				buyerid=sss.getInt(1);
			}
			PreparedStatement pstmadd=conn.prepareStatement("insert into X_COMMENT(X_COMMENT.SELER,X_COMMENT.BUYER,X_COMMENT.COMMENTSCORE,X_COMMENT.COMMENTCONTENT,COMMENTDATE) values(?,?,?,?,?)");
			pstmadd.setInt(1, buyerid);
			pstmadd.setInt(2, userid);
			pstmadd.setInt(3, score);
			pstmadd.setString(4, text);
			
			Date d=new Date();
			long s=d.getTime();
			java.sql.Date datee=new java.sql.Date(s);
			
			pstmadd.setDate(5, datee);
			int a=pstmadd.executeUpdate();
			//然后修改订单状态
			PreparedStatement pstmchange=conn.prepareStatement("update X_ORDER set ORDERSTATE='已完成' WHERE ORDERID=?");
			pstmchange.setInt(1, orderid);
			int b=pstmchange.executeUpdate();
		//发一条消息
			PreparedStatement from=conn.prepareStatement("select * from PERSONGOODS_IN WHERE ORDERID=?");
			from.setInt(1,orderid);
			ResultSet ssss=from.executeQuery();
			int  fromid=0;
			while(ssss.next()) {
				fromid=ssss.getInt("GOODID");
			}

			from.close();
			ssss.close();
			PreparedStatement insert=conn.prepareStatement("insert into X_MESSAGE values(null,?,?,?,'未读',?,?,0)");
			
	        insert.setInt(1,fromid);
	        insert.setInt(2,userid);
	        insert.setDate(3, datee);
	        insert.setInt(4,buyerid);
	        insert.setString(5, "您收到了一条新评价");
	       insert.executeUpdate();
	        insert.close();
			
			
			
			
			if(a==1&&b==1) {
				conn.commit();
				pstmadd.close();
				pstmchange.close();
			}else {
				conn.rollback();
			}
		}
			
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}



//确认发货
	public boolean realsend(int orderid, String me, String he, String gdname) {
		// TODO Auto-generated method stub
		boolean b=false;
		BaseDao bd=new BaseDao();
		Connection conn= bd.getConn();
		//先插订单表
		try {
			//开启事务
			conn.setAutoCommit(false);
			
			
			int goodid=0;
		PreparedStatement order=conn.prepareStatement("select * from X_USER WHERE USERNAME=?");
			order.setString(1,he);
		ResultSet rs=order.executeQuery();
		while(rs.next()) {
			
			goodid=rs.getInt("USERID");
		}
		order.close();
		rs.close();
		
		
		PreparedStatement buyer=conn.prepareStatement("select * from X_USER WHERE USERNAME=?");
		buyer.setString(1,me);
		ResultSet sss=buyer.executeQuery();
		int  toid=0;
		while(sss.next()) {
			toid=sss.getInt(1);
		}
		buyer.close();
		sss.close();
		PreparedStatement from=conn.prepareStatement("select * from PERSONGOODS_OUT WHERE ORDERID=?");
		from.setInt(1,orderid);
		ResultSet ssss=from.executeQuery();
		int  fromid=0;
		while(ssss.next()) {
			fromid=ssss.getInt("GOODID");
		}
		from.close();
		ssss.close();
		
        //先去发送一条消息。
        Date d=new Date();
		long s=d.getTime();
		java.sql.Date datesql=new java.sql.Date(s);
        
		String msg="你的商品:"+gdname+",用户:"+me+"已发货";
		
	        
        PreparedStatement insert=conn.prepareStatement("insert into X_MESSAGE values(null,?,?,?,'未读',?,?,0)");
        insert.setInt(1,fromid);
        insert.setInt(2,toid);
        insert.setDate(3, datesql);
        insert.setInt(4,goodid);
        insert.setString(5, msg);
        int i=insert.executeUpdate();
        insert.close();
        //更改订单状态
        PreparedStatement upstate=conn.prepareStatement("update X_ORDER set ORDERSTATE='已发货' where ORDERID=?");
        upstate.setInt(1,orderid);
        int j=upstate.executeUpdate();
        upstate.close();
       // 16,1,26,你的商品:伊苏8港版已发货,2017-10-19
       // System.out.println(i+","+j);
        if(i==1 && j==1) {
        	b=true;
        	conn.commit();
        	conn.close();
        }else {
        	b=false;
        	conn.rollback();
        	conn.close();
        }
        
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return b;
	}



//确认收货
	public boolean affirm(int orderid, String me, String he, String gdname) {
		// TODO Auto-generated method stub
		boolean b=false;
		BaseDao bd=new BaseDao();
		Connection conn= bd.getConn();
		//先插订单表
		try {
			//开启事务
			conn.setAutoCommit(false);
			
			int goodid=0;
			PreparedStatement order=conn.prepareStatement("select * from X_USER WHERE USERNAME=?");
			order.setString(1,he);
		ResultSet rs=order.executeQuery();
		while(rs.next()) {
			
			goodid=rs.getInt("USERID");
		}
		order.close();
		rs.close();
		
		
		PreparedStatement buyer=conn.prepareStatement("select * from X_USER WHERE USERNAME=?");
		buyer.setString(1,me);
		ResultSet sss=buyer.executeQuery();
		int  toid=0;
		while(sss.next()) {
			toid=sss.getInt(1);
		}
		buyer.close();
		sss.close();
		PreparedStatement from=conn.prepareStatement("select * from PERSONGOODS_IN WHERE ORDERID=?");
		from.setInt(1,orderid);
		ResultSet ssss=from.executeQuery();
		int  fromid=0;
		while(ssss.next()) {
			fromid=ssss.getInt("GOODID");
		}
		from.close();
		ssss.close();
		
       
        
        //先去发送一条消息。
        Date d=new Date();
		long s=d.getTime();
		java.sql.Date datesql=new java.sql.Date(s);
        
		String msg="你的商品："+gdname+",用户:"+me+"已经收到了，谢谢！";
	
	        
        PreparedStatement insert=conn.prepareStatement("insert into X_MESSAGE values(null,?,?,?,'未读',?,?,0)");
        insert.setInt(1,fromid);
        insert.setInt(2,toid);
        insert.setDate(3, datesql);
        insert.setInt(4,goodid);
        insert.setString(5, msg);
        int i=insert.executeUpdate();
        insert.close();
        //更改订单状态
        PreparedStatement upstate=conn.prepareStatement("update X_ORDER set ORDERSTATE='待评价' where ORDERID=?");
        upstate.setInt(1,orderid);
        int j=upstate.executeUpdate();
        upstate.close();
       // 16,1,26,你的商品:伊苏8港版已发货,2017-10-19
       // System.out.println(i+","+j);
        if(i==1 && j==1) {
        	b=true;
        	conn.commit();
        	conn.close();
        }else {
        	b=false;
        	conn.rollback();
        	conn.close();
        }
        
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return b;
	}

}
