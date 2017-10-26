package com.etc.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.etc.cms.util.BaseDao;
import com.etc.cms.util.LikeMes;
import com.etc.entity.Comment;
import com.etc.entity.Like;


import oracle.jdbc.internal.OracleTypes;
import com.etc.cms.util.PageData;


public class LikeDao {
	public static List<Like> getAllLike(){
		String sql="select * from X_Like";
		return (List<Like>)BaseDao.select(sql, Like.class, null);
	}
	/**
	 * �����û������õ��ض��û����ղ�����
	 * @param userName
	 * @return
	 */
	public int likeUser(String userName) {
		System.out.println(userName+","+userName.length());
		Connection conn=BaseDao.getConn();
		String sql="{call X_USERLIKE(?,?)}";
		CallableStatement cstmt=null;
		
		int count = 0;
		try {
			cstmt = conn.prepareCall(sql);
			cstmt.setString(1, userName);
			cstmt.registerOutParameter(2, OracleTypes.INTEGER);
			cstmt.executeQuery();
			//���û��ղص���Ʒ����
			count = cstmt.getInt(2);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
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
	
	/**
	 * �����û������õ��ض��û����ղ���Ϣ ����
	 * @param userName
	 * @return
	 */
	
	public static PageData<LikeMes> getlikebyUsername(int page,int pagesize,String userName) {
		String sql = "select * from X_VIEW_GETLIKE_BY_USERNAME where USERNAME =?";
		return BaseDao.OraclegetPage(sql, page, pagesize, LikeMes.class,userName);
			
		
	}
	/**
	 * ����likeidɾ�����õ��ղ�
	 * @param id
	 * @return
	 */
	public static boolean deleteone(int id) {
		String sql = "delete from X_LIKE where LIKEID = ?";
		 
			int i = BaseDao.execute(sql, id);
			return i>0;
		
	}
	public static boolean clear(String username) {
		Connection conn=BaseDao.getConn();
		String sql="{call CLEAR_LIKE(?)}";
		CallableStatement cstmt=null;
		
		int i = 0;
		try {
			cstmt = conn.prepareCall(sql);
			cstmt.setString(1, username);
			
			 i = cstmt.executeUpdate();
			 System.out.println(i);
		
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
		try {
			cstmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
		
		return true;			
	}
	//�û��ղ���Ʒ����(�ƽ�)
	public int[] likeGood(int goodId,String userName) {
		Connection conn=BaseDao.getConn();
		String sql="{call X_LIKEGOOD(?,?,?,?)}";
		CallableStatement cstmt=null;
		int[] in= new int[2];
		try {
			cstmt = conn.prepareCall(sql);
			cstmt.setInt(1, goodId);
			cstmt.setString(2, userName);
			cstmt.registerOutParameter(3, OracleTypes.INTEGER);
			cstmt.registerOutParameter(4, OracleTypes.INTEGER);
			cstmt.executeQuery();
			//����Ʒ���ղص���Ŀ
			in[0]=cstmt.getInt(3);
			//in[1]Ϊ0ʱ��ʾȡ���ղأ�Ϊ1ʱ��ʾ�ղ���Ʒ
			in[1]=cstmt.getInt(4);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
		try {
			cstmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}	
		return in;
	}
	/**
	 * ֻ�������ض����û����ղ�
	 * @param goodid
	 * @param username
	 * @return
	 */
	public static int[] addLike(String username,int goodid) {
		Connection conn=BaseDao.getConn();
		String sql="{call X_ADDLIKE(?,?,?,?)}";
		CallableStatement cstmt=null;
		int[] in= new int[2];
		try {
			cstmt = conn.prepareCall(sql);
			cstmt.setInt(2, goodid);
			cstmt.setString(1, username);
			cstmt.registerOutParameter(3, OracleTypes.INTEGER);
			cstmt.registerOutParameter(4, OracleTypes.INTEGER);
			cstmt.executeQuery();
			//����Ʒ���ղص���Ŀ
			in[0]=cstmt.getInt(3);
			//in[1]Ϊ0ʱ��ʾȡ���ղأ�Ϊ1ʱ��ʾ�ղ���Ʒ
			in[1]=cstmt.getInt(4);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
		try {
			cstmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}	
		return in;		
	}
	
	
	
	
	public static void main(String[] args) {
	
		
		addLike("admin",1);
	
	}
	
	
	
	
}
