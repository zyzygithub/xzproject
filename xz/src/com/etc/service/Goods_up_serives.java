package com.etc.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import com.etc.cms.util.BaseDao;
import com.etc.cms.util.PageData;

public class Goods_up_serives {

	public boolean addgoods(String goodsname, String smalltype, int count, int price,int oldprice,String remark,String imgurl,String username) {
		// TODO Auto-generated method stub
		boolean b=false;
		
		BaseDao bd=new BaseDao();
		Connection conn= bd.getConn();
		//得到上架时间
		
		
		Date d=new Date();
		long s=d.getTime();
		java.sql.Date datesql=new java.sql.Date(s);
		//得到用户标号
		//System.out.println(datesql);
		int selerid=-1;
		try {
			PreparedStatement pstmid=conn.prepareStatement("select USERID from X_USER WHERE USERNAME=?");
			pstmid.setString(1, username);
			ResultSet rs=pstmid.executeQuery();
			while(rs.next()) {
				selerid=rs.getInt(1);
			}
			rs.close();
			pstmid.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//得到编号
		int typeid=-1;
		try {
			PreparedStatement goodid=conn.prepareStatement("select TYPEID from X_TYPES WHERE TYPEMESNAME=?");
			goodid.setString(1, smalltype);
			ResultSet rs=goodid.executeQuery();
			while(rs.next()) {
				typeid=rs.getInt(1);
			}
			rs.close();
			goodid.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
		//System.out.println(selerid+","+datesql);
		
	//System.out.println(selerid+","+goodsname+","+typeid+","+price+","+remark+","+imgurl+","+count+","+datesql);
		int i=bd.execute("insert into X_GOODS(GOODSELER,GOODTITLE,GOODTYPE,GOODPRICE,GOODREMARK,GOODPIC,GOODCLICK,GOODCOUNT,GOODUP,GOODSTATE,ORIGINALPRICE) values(?,?,?,?,?,?,0,?,?,'待审核',?)", 
				selerid,goodsname,typeid,price,remark,imgurl,count,datesql,oldprice);
		if(i>0) {
			b=true;
		}else {
			b=false;
		}
		
		return b;
	}
	
/*	public static void main(String[] args) {
	Goods_up_serives gup=new Goods_up_serives();
		boolean b=gup.addgoods("TG14", "漫画", 1, 50,"传阅啊", "1","阿萨德16");
		//System.out.println(b);
		String lem="insert into X_GOODS(GOODSELER,GOODTITLE,GOODTYPE,GOODPRICE,GOODREMARK,GOODPIC,GOODCLICK,GOODCOUNT,GOODUP,GOODSTATE) values(16,\"tg14\",21,30,\"传阅啊\",\"11\",0,3,\"2014-14-10\",\"上架\")";
		System.out.println(lem.length());
	}
	*/
	
	

}
