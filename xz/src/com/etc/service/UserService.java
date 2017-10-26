package com.etc.service;

import java.util.List;

import com.etc.cms.util.BaseDao;
import com.etc.dao.UserDao;
import com.etc.entity.User;

public class UserService {
	static UserDao ud =new UserDao();

	/**
	 * ͨ���û���Ϊ�û���ֵ
	 * @param p_userCd
	 * @param p_balance
	 * @return
	 */
	public  boolean UpdateBalanceByName(String p_userName,double p_balance){
		return ud.UpdateBalanceByName(p_userName,p_balance);
	}
	
	
	/**
	 * ����USERNAME��ѯ�û�
	 * @param p_userCd
	 * @return
	 */
	public  List<User> getUserByName(String p_userName){
		return ud.getUserByName(p_userName);
	}
	
	
	
	
	/**
	 * �����û�����ѯ���
	 * @param p_phone
	 * @return
	 */
	public  List<User> getBalanceByName(String p_userName){
		return ud.getBalanceByName(p_userName);
	}
	
	
	/**
	 * �ж��Ƿ����ע��  �û���Ψһ
	 */

	public boolean isUser(String username) {
		List<User> list = ud.getOneUser(username);
		if (list.size() != 0) {
			return true; //���������û���
		}
		return false;
		
	}
	/**
	 * �򵥵�ע���û�
	 * @param username
	 * @param userpsw
	 * @return
	 */
	public Boolean addOneUser(User user) {
		return ud.addOneUser(user);
	}
	/**
	 * �ж��Ƿ�����ȷ���û�
	 */

	
	public boolean isPass(String username,String password) {
		List<User> list = ud.Userpass(username, password);
		if (list.size() == 0) {//û������û�
			return false;
		}
		return true;//������ȷ
		
	}
	
	
	/**
	 * �����û�����ѯ���ض����û���Ϣ
	 * @param username
	 * @return
	 */
	public List<User> getOneUser(String username) {
		return ud.getOneUser(username);
	}
	
	
	/**
	 * �����û����޸��ֻ��ź��Ա�
	 * @param p_userName
	 * @param p_UserPhone
	 * @param p_UserSex
	 * @return
	 */
	public  boolean updateInfoByName(String p_userName,String p_UserPhone,String p_UserSex,String p_userQuestion,String p_userAnswer){
		return ud.updateInfoByName(p_userName, p_UserPhone,p_UserSex,p_userQuestion,p_userAnswer);
	}
	
	
	/**
	 * �ж�ԭʼ�����Ƿ���ȷ
	 * @param p_userName
	 * @param p_oldPwd
	 * @return
	 */
	public boolean checkOldPwd(String p_userName,String p_oldPwd) {
		return ud.checkOldPwd(p_userName, p_oldPwd);		
	}
	
	/**
	 * �����û����޸�����
	 * @param p_userName
	 * @param p_UserPwd
	 * @return
	 */
	public boolean updatePwdByName(String p_userName,String p_UserPwd){
		return ud.updatePwdByName(p_userName, p_UserPwd);
	}
	/**
	 * �����û����õ������ղ��������֣�������Ʒ��
	 * @param userName
	 * @return
	 */
	
	 public static int[] getOnePeople(String userName){
		 return ud.selectOnePeople(userName);
	 }
	/* public static void main(String[] args) {
		int a[]=new int[3];
		 a = getOnePeople("admin");
		 System.out.println(a[0]+a[1]+a[2]);
	}*/
	 
	 /**
		 * �ж��Ƿ����ע�� ���֤Ψһ
		 * ���ߣ�����
		 */

		public boolean isUsercd(String usercd) {
			List<User> list = ud.getOneUserBycd(usercd);
			if (list.size() != 0) {
				return true; //�����������֤
			}
			return false;
			
		}
		/* �ж��û����Ƿ�״̬Ϊ����
		 * @param txtsearch
		 * @return
		 * ���ߣ�����
		 */
		public boolean UserIsOk(String username) {
			List<User> users = ud.getOneUser(username);
			for (User user : users) {
				if (user.getUSERSTATE().equals("����")) {
					return false;//����û��ǽ���״̬��
				} 
			}
			return true;//����û�������״̬��
		}
	
	
	
}
