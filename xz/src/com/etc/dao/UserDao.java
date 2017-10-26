package com.etc.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.etc.cms.util.BaseDao;
import com.etc.entity.User;
import com.sun.org.apache.bcel.internal.generic.Select;

import oracle.jdbc.OracleTypes;

public class UserDao {
	
	/**
	 * ����USERNAME��ѯ�û�
	 * @param p_phone
	 * @return
	 */
	public static  List<User> getUserByName(String p_userName){
		String sql="select * from X_User where USERNAME=?";
		return (List<User>)BaseDao.select(sql, User.class, p_userName);
	}
	
	
	/**
	 * ͨ���û�����Ϊ�û���ֵ
	 * @param p_phone
	 * @param p_balance
	 * @return
	 */
	public  boolean UpdateBalanceByName(String p_userName,double p_balance){
		String sql="update X_User set USERBALANCE=USERBALANCE+? where USERNAME=?";
		return BaseDao.execute(sql, p_balance, p_userName)>0;
	}
	
	/**
	 * �����û�����ѯ���
	 * @param p_phone
	 * @return
	 */
	public  List<User> getBalanceByName(String p_userName){
		String sql="select USERBALANCE from X_User where USERNAME=?";
		return (List<User>)BaseDao.select(sql, User.class, p_userName);
	}
	
	
	/**
	 *��ѯ���е��û�
	 * @return
	 */
	public static List<User> getAllUser(){
		String sql="select * from X_User";
		return (List<User>)BaseDao.select(sql, User.class, null);
	}
	/**
	 * �����û�����ѯ���ض����û���Ϣ
	 * @param username
	 * @return
	 */
	public static List<User> getOneUser(String username) {
		String sql="select * from X_User where USERNAME=?";
		return (List<User>)BaseDao.select(sql, User.class, username);
	}
	/**
	 * ��ע��һ���û�
	 * @param args
	 */
	public  Boolean addOneUser(User user) {
		String sql="insert into X_USER VALUES(null,?,?,?,null,?,null,0,null,null,'����')";
		
		int a= BaseDao.execute(sql, user.getUSERNAME(),user.getUSERPWD(),user.getUSERREALNAME(),user.getUSERCD());
		return a>0;
	}

	/* �ж��û��������Ƿ�ƥ��   ���ڵ�¼
	 * @param txtsearch
	 * @return
	 */
	public List<User> Userpass(String username,String userpsw) {
		String sql = "select * from X_USER where USERNAME =? and USERPWD = ?";
		List<User>	list =  (List<User>) BaseDao.select(sql, User.class,username,userpsw);		
		return list;		
	}
	
	
	/**
	 * �����û����޸��ֻ��ź��Ա�
	 * @param p_userName
	 * @param p_UserPhone
	 * @param p_UserSex
	 * @return
	 */
	public boolean updateInfoByName(String p_userName,String p_UserPhone,String p_UserSex,String p_userQuestion,String p_userAnswer){
		String sql="update X_User set USERPHONE=?,USERSEX=?,USERQUESTION=?,USERANSWER=? where USERNAME=?";
		return BaseDao.execute(sql, p_UserPhone, p_UserSex,p_userQuestion,p_userAnswer,p_userName)>0;
	}
	
	
	/**
	 * �ж�ԭʼ�����Ƿ���ȷ
	 * @param p_userName
	 * @param p_oldPwd
	 * @return
	 */
	public boolean checkOldPwd(String p_userName,String p_oldPwd) {
		String sql = "select USERPWD from X_USER where USERNAME =?";
		List<User>	list =  (List<User>) BaseDao.select(sql, User.class,p_userName);
		boolean flag=list.get(0).getUSERPWD().equals(p_oldPwd);
		return flag;		
	}
	
	
	/**
	 * �����û����޸�����
	 * @param p_userName
	 * @param p_UserPwd
	 * @return
	 */
	public boolean updatePwdByName(String p_userName,String p_UserPwd){
		String sql="update X_User set USERPWD=? where USERNAME=?";
		return BaseDao.execute(sql, p_UserPwd, p_userName)>0;
	}
	/**
	 * �����û�����ѯ���û��������ĵ�������Ϣ
	 * @param args
	 */
		public static int[] selectOnePeople(String userName) {
			Connection conn=BaseDao.getConn();
			String sql="{call X_WYmes(?,?,?,?)}";
			CallableStatement cstmt=null;
			int sellcount=0;
			int pingfen=0;
			int collectioncount=0;
			int[] one= new int[3];
			try {
				cstmt=conn.prepareCall(sql);
				cstmt.setString(1, userName);
				cstmt.registerOutParameter(2, OracleTypes.INTEGER);
				cstmt.registerOutParameter(3, OracleTypes.INTEGER);
				cstmt.registerOutParameter(4, OracleTypes.INTEGER);
				
				
				cstmt.executeQuery();
				sellcount=cstmt.getInt(2);
				one[0]=sellcount;
				pingfen=cstmt.getInt(3);
				one[1]=pingfen;
				collectioncount=cstmt.getInt(4);
				one[2]=collectioncount;
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
			return one;
			
		}
	
		/**
		 * �����û�CD��ѯ���ض����û���Ϣ
		 * @param username
		 * @return
		 * ���ߣ�����
		 */
		public List<User> getOneUserBycd(String usercd) {
			String sql="select * from X_User where USERCD=?";
			return (List<User>)BaseDao.select(sql, User.class, usercd);
		}
	
	public static void main(String[] args) {
		int[] one= new int[3];
		 one = selectOnePeople("admin");
		 System.out.println("����"+one[0]);
		 System.out.println("��"+one[1]);
		 System.out.println("�ղ�"+one[2]);
		
	}
}
