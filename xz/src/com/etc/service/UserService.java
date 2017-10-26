package com.etc.service;

import java.util.List;

import com.etc.cms.util.BaseDao;
import com.etc.dao.UserDao;
import com.etc.entity.User;

public class UserService {
	static UserDao ud =new UserDao();

	/**
	 * 通过用户名为用户充值
	 * @param p_userCd
	 * @param p_balance
	 * @return
	 */
	public  boolean UpdateBalanceByName(String p_userName,double p_balance){
		return ud.UpdateBalanceByName(p_userName,p_balance);
	}
	
	
	/**
	 * 根据USERNAME查询用户
	 * @param p_userCd
	 * @return
	 */
	public  List<User> getUserByName(String p_userName){
		return ud.getUserByName(p_userName);
	}
	
	
	
	
	/**
	 * 根据用户名查询余额
	 * @param p_phone
	 * @return
	 */
	public  List<User> getBalanceByName(String p_userName){
		return ud.getBalanceByName(p_userName);
	}
	
	
	/**
	 * 判断是否可以注册  用户名唯一
	 */

	public boolean isUser(String username) {
		List<User> list = ud.getOneUser(username);
		if (list.size() != 0) {
			return true; //有重名的用户名
		}
		return false;
		
	}
	/**
	 * 简单的注册用户
	 * @param username
	 * @param userpsw
	 * @return
	 */
	public Boolean addOneUser(User user) {
		return ud.addOneUser(user);
	}
	/**
	 * 判断是否是正确的用户
	 */

	
	public boolean isPass(String username,String password) {
		List<User> list = ud.Userpass(username, password);
		if (list.size() == 0) {//没有这个用户
			return false;
		}
		return true;//密码正确
		
	}
	
	
	/**
	 * 根据用户名查询到特定的用户信息
	 * @param username
	 * @return
	 */
	public List<User> getOneUser(String username) {
		return ud.getOneUser(username);
	}
	
	
	/**
	 * 根据用户名修改手机号和性别
	 * @param p_userName
	 * @param p_UserPhone
	 * @param p_UserSex
	 * @return
	 */
	public  boolean updateInfoByName(String p_userName,String p_UserPhone,String p_UserSex,String p_userQuestion,String p_userAnswer){
		return ud.updateInfoByName(p_userName, p_UserPhone,p_UserSex,p_userQuestion,p_userAnswer);
	}
	
	
	/**
	 * 判断原始密码是否正确
	 * @param p_userName
	 * @param p_oldPwd
	 * @return
	 */
	public boolean checkOldPwd(String p_userName,String p_oldPwd) {
		return ud.checkOldPwd(p_userName, p_oldPwd);		
	}
	
	/**
	 * 根据用户名修改密码
	 * @param p_userName
	 * @param p_UserPwd
	 * @return
	 */
	public boolean updatePwdByName(String p_userName,String p_UserPwd){
		return ud.updatePwdByName(p_userName, p_UserPwd);
	}
	/**
	 * 根据用户名得到他的收藏数，评分，出售商品数
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
		 * 判断是否可以注册 身份证唯一
		 * 作者：张媛
		 */

		public boolean isUsercd(String usercd) {
			List<User> list = ud.getOneUserBycd(usercd);
			if (list.size() != 0) {
				return true; //有重名的身份证
			}
			return false;
			
		}
		/* 判断用户名是否状态为正常
		 * @param txtsearch
		 * @return
		 * 作者：张媛
		 */
		public boolean UserIsOk(String username) {
			List<User> users = ud.getOneUser(username);
			for (User user : users) {
				if (user.getUSERSTATE().equals("禁用")) {
					return false;//这个用户是禁用状态的
				} 
			}
			return true;//这个用户是正常状态的
		}
	
	
	
}
