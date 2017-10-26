package com.etc.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.etc.cms.util.BaseDao;
import com.etc.entity.ShoppingCart;

import oracle.jdbc.internal.OracleTypes;

public class ShoppingCartDao {
	public static List<ShoppingCart> getAllShoppingCart(String name) {
		/*
		 * 
		 * ��ѯ���ﳵ��Ҫ����Ϣ
		 */
		String sql = "select * from X_VIEW_SHOPPINGCART where username=?";
		return (List<ShoppingCart>) BaseDao.select(sql, ShoppingCart.class, name);
		// System.out.println((List<ShoppingCart>)BaseDao.select(sql,
		// ShoppingCart.class, null));
	}

	/**
	 * ��ӵ����ﳵ
	 * 
	 * @throws SQLException
	 */
	public static void add(int goodId, int goodCount, String username) {
		Connection conn = BaseDao.getConn();
		CallableStatement csmt;
		try {
			csmt = conn.prepareCall("{call X_ADD_TO_SC(?,?,?,?)}");
			csmt.setInt(1, goodId);
			csmt.setInt(2, goodCount);
			csmt.setString(3, username);
			// ���ڶ�������ע��ΪΪ��ѯ���
			csmt.registerOutParameter(4, OracleTypes.INTEGER);
			// �����ǰ����Ҫдִ�к���
			csmt.execute();
			// ��ȡ�����out��ֵ
			int count = csmt.getInt(4);
			System.out.println(count);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// ���ô�����������ű�ţ�

	}

	/**
	 * �����û������õ��ض��û��Ĺ��ﳵ����
	 * 
	 * @param userName
	 * @return
	 */
	public int CartUser(String userName) {
		Connection conn = BaseDao.getConn();
		String sql = "{call X_USERCART(?,?)}";
		CallableStatement cstmt = null;

		int count = 0;
		try {
			cstmt = conn.prepareCall(sql);
			cstmt.setString(1, userName);
			cstmt.registerOutParameter(2, OracleTypes.INTEGER);
			cstmt.executeQuery();
			// ���û����ﳵ����Ʒ����
			count = cstmt.getInt(2);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				cstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return count;
	}

	public void dele(int goodid, String username) {
		BaseDao.execute("delete from X_VIEW_SHOPPINGCART where username=? and scid=?", username, goodid);
	}
	/**
	 * �޸Ĺ��ﳵ������
	 * @param goodscount
	 * @param scid
	 * @return
	 */
	public static boolean updateShoppingCart(int goodscount, int scid) {
		String sql = "update X_SHOPPINGCART set goodscount=? where scid=? ";
		return BaseDao.execute(sql,goodscount,scid) > 0;
	}
	/**
	 * ��չ��ﳵ
	 * @param userid
	 * @return
	 */
	public boolean delAllShoppingCart(int  userid){
		String sql="delete from X_SHOPPINGCART where userid=? ";
		return BaseDao.execute(sql, userid)>0;
	}
	/**
	 * ��ȡ����
	 * @param id
	 * @return
	 */
	public static Object getSelerName(int id){
		String sql="select username from x_user where userid=?";
		return BaseDao.getFirst(sql, id);
	}
	
	 

	
}
