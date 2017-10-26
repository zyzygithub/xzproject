package com.etc.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.etc.cms.util.BaseDao;
import com.etc.cms.util.PageData;
import com.etc.entity.GOODS_GOODSTYPE;
import com.etc.entity.Goodsall;
import com.etc.entity.PERSONGOODS_IN;
import com.etc.entity.PERSONGOODS_OUT;
import com.google.gson.Gson;








public class account_goods_goodstypeserives {

	
	public PageData selectOracle(String user,
			int page,
			int pagesize,
			String blurry,
			String order,
			String upanddown) {
		BaseDao bd=new BaseDao();
		Connection conn= bd.getConn();
		PageData pd=null;
		try {
			conn.setAutoCommit(false);
			
			//先将username转换成id
		PreparedStatement pstmid=conn.prepareStatement("select USERID from X_USER WHERE USERNAME=?");
		pstmid.setString(1, user);
		ResultSet rs=pstmid.executeQuery();
		int selerid=-1;
		while(rs.next()) {
			selerid=rs.getInt(1);
		}
	
		if(upanddown.equals("up")) {
		if(order.equals("asc")) {
			
			pd=bd.getorcalePage("select * from GOODS_GOODSTYPE WHERE GOODSELER=? AND GOODSTATE='上架' AND(GOODID like ? or GOODTITLE like ? or TYPEMESNAME like ? or GOODPRICE like ? or GOODREMARK like ? or GOODCLICK like ? or GOODCOUNT like ? OR to_char(GOODUP,'yyyy-MM-dd') like ? ) ORDER BY GOODUP asc ",
					page, pagesize, GOODS_GOODSTYPE.class, 
					selerid,"%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%");
			}if(order.equals("desc")) {
				pd=bd.getorcalePage("select * from GOODS_GOODSTYPE WHERE GOODSELER=? AND GOODSTATE='上架'  AND(GOODID like ? or GOODTITLE like ? or TYPEMESNAME like ? or GOODPRICE like ? or GOODREMARK like ? or GOODCLICK like ? or OR to_char(GOODUP,'yyyy-MM-dd') like ? ) ORDER BY GOODUP desc ",
						page, pagesize, GOODS_GOODSTYPE.class, 
						selerid,"%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%");
				
				}
		
		}else if(upanddown.equals("down")) {
			if(order.equals("asc")) {
				pd=bd.getorcalePage("select * from GOODS_GOODSTYPE WHERE GOODSELER=? AND GOODSTATE='上架'  AND(GOODID like ? or GOODTITLE like ? or TYPEMESNAME like ? or GOODPRICE like ? or GOODREMARK like ? or GOODCLICK like ? or GOODCOUNT like ? ) ORDER BY GOODDOWN asc ",
						page, pagesize, GOODS_GOODSTYPE.class, 
						selerid,"%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%");
				}if(order.equals("desc")) {
					pd=bd.getorcalePage("select * from GOODS_GOODSTYPE WHERE GOODSELER=? AND GOODSTATE='上架' AND(GOODID like ? or GOODTITLE like ? or TYPEMESNAME like ? or GOODPRICE like ? or GOODREMARK like ? or GOODCLICK like ? or GOODCOUNT like ? ) ORDER BY GOODDOWN desc ",
							page, pagesize, GOODS_GOODSTYPE.class, 
							selerid,"%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%");
					
					}
			
			}
		else if(upanddown.equals("驳回")) {
			if(order.equals("asc")) {
				pd=bd.getorcalePage("select * from GOODS_GOODSTYPE WHERE GOODSELER=? AND GOODSTATE='驳回'  AND(GOODID like ? or GOODTITLE like ? or TYPEMESNAME like ? or GOODPRICE like ? or GOODREMARK like ? or GOODCLICK like ? or GOODCOUNT like ? ) ORDER BY GOODDOWN asc ",
						page, pagesize, GOODS_GOODSTYPE.class, 
						selerid,"%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%");
				}if(order.equals("desc")) {
					pd=bd.getorcalePage("select * from GOODS_GOODSTYPE WHERE GOODSELER=? AND GOODSTATE='驳回' AND(GOODID like ? or GOODTITLE like ? or TYPEMESNAME like ? or GOODPRICE like ? or GOODREMARK like ? or GOODCLICK like ? or GOODCOUNT like ? ) ORDER BY GOODDOWN desc ",
							page, pagesize, GOODS_GOODSTYPE.class, 
							selerid,"%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%");
					
					}
		}else if(upanddown.equals("待审核")) {
			if(order.equals("asc")) {
				pd=bd.getorcalePage("select * from GOODS_GOODSTYPE WHERE GOODSELER=? AND GOODSTATE='待审核'  AND(GOODID like ? or GOODTITLE like ? or TYPEMESNAME like ? or GOODPRICE like ? or GOODREMARK like ? or GOODCLICK like ? or GOODCOUNT like ? ) ORDER BY GOODDOWN asc ",
						page, pagesize, GOODS_GOODSTYPE.class, 
						selerid,"%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%");
				}if(order.equals("desc")) {
					pd=bd.getorcalePage("select * from GOODS_GOODSTYPE WHERE GOODSELER=? AND GOODSTATE='待审核' AND(GOODID like ? or GOODTITLE like ? or TYPEMESNAME like ? or GOODPRICE like ? or GOODREMARK like ? or GOODCLICK like ? or GOODCOUNT like ? ) ORDER BY GOODDOWN desc ",
							page, pagesize, GOODS_GOODSTYPE.class, 
							selerid,"%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%","%"+blurry+"%");
					
					}
		}
		
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return pd;
		
	}
	
	
	public static void main(String[] args) {
		account_goods_goodstypeserives agg=new account_goods_goodstypeserives();
		PageData<GOODS_GOODSTYPE> pd=agg.selectOracle("yyy", 1,15, "", "asc","待审核");
		for (GOODS_GOODSTYPE admin : pd.getData()) {
			
		}
	}


	public void downgoods(int goodid) {
		// TODO Auto-generated method stub
		BaseDao bd=new BaseDao();
		bd.execute("update X_GOODS set GOODSTATE='下架' where GOODID=?",goodid);
	}

//商品修改
	public boolean upda(int id, String name, double price, int count, String downdate, String text) {
		// TODO Auto-generated method stub
		BaseDao bd=new BaseDao();
		boolean b=false;
		if(downdate.equals("")) {
			//先将原价取出来，变成旧价格
			double oldprice=0;
		  
			List<Goodsall> list=(List<Goodsall> )bd.select("select * from X_GOODS WHERE GOODID=?", Goodsall.class, id);
			for (Goodsall Goodsall : list) {
				oldprice=Goodsall.getGOODPRICE();
			}
			//更改数据
		int i=	bd.execute("update X_GOODS set GOODTITLE=?,GOODPRICE=?,GOODCOUNT=?,GOODSTATE='待审核',GOODREMARK=? where GOODID=?", 
					name,price,count,text,id);
		if(i>0) {
			b=true;
		}
}else {

	//先将String的时间转化成sqldate
	 
	    try {
	    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
			Date date = sdf.parse(downdate);
			long datelong=date.getTime();
			
			java.sql.Date datesql=new java.sql.Date(datelong);
			
			
			double oldprice=0;
			
				List<Goodsall> list=(List<Goodsall> )bd.select("select * from X_GOODS WHERE GOODID=?", Goodsall.class, id);
				for (Goodsall Goodsall : list) {
					oldprice=Goodsall.getGOODPRICE();
				}
			int i=	bd.execute("update X_GOODS set GOODTITLE=?,GOODPRICE=?,GOODSTATE='待审核',GOODCOUNT=?,GOODREMARK=? where GOODID=?", 
					name,price,count,text,id);
			if(i>0) {
				b=true;
			}
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
	
	
}
		
		
		return b;
	}


	public boolean deleone(int id) {
		// TODO Auto-generated method stub
		BaseDao bd=new BaseDao();
		boolean b=false;
		int i=bd.execute("delete from X_GOODS WHERE GOODID=?",id);
		if(i>0) {
			b=true;
		}else {
			b=false;
		}
		
		return b;
	}
	
}
