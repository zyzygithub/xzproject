package com.etc.service;

import java.util.ArrayList;
import java.util.List;

import com.etc.cms.util.BaseDao;
import com.etc.cms.util.LikeMes;
import com.etc.cms.util.PageData;
import com.etc.dao.LikeDao;
import com.etc.dao.UserDao;
import com.etc.entity.Like;
import com.etc.entity.User;




public class LikeService_bk {
	
	static LikeDao ld = new LikeDao();
	/**
	 * �����û�������ѯ���û����ղ�����
	 * @param userid
	 * @return
	 */
	public static int getLikeCount(String userName) {
	return	ld.likeUser(userName);	
	}
	/**
	 * �õ��ض��û����ղ���Ϣ  ��ҳ
	 * @param page
	 * @param pagesize
	 * @param userName
	 * @return
	 */
	
	public static PageData<LikeMes> getlikebyUsername(int page,int pagesize,String userName) {
		PageData<LikeMes> likepd  = ld.getlikebyUsername(page, pagesize, userName);
		return likepd;
	}
	/**
	 * �����ղص�idɾ����Ӧ�ղ�
	 * @param id
	 * @return
	 */
	public static boolean deleteone(int id) {
		return ld.deleteone(id);
	}
	/**
	 * �����û���ɾ������û������ղ�
	 * @param id
	 * @return
	 */
	public static boolean clear(String username) {
		
		return ld.clear(username);
		
	}
	
	
	
	
	
	
	
}

