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




public class LikeService {
	
	static LikeDao ld = new LikeDao();
	/**
	 * 根据用户名来查询到用户的收藏数量
	 * @param userid
	 * @return
	 */
	public static int getLikeCount(String userName) {
	return	ld.likeUser(userName);	
	}
	/**
	 * 得到特定用户的收藏信息  分页
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
	 * 根据收藏的id删除对应收藏
	 * @param id
	 * @return
	 */
	public static boolean deleteone(int id) {
		return ld.deleteone(id);
	}
	/**
	 * 根据用户名删除这个用户所有收藏
	 * @param id
	 * @return
	 */
	public static boolean clear(String username) {
		
		return ld.clear(username);
		
	}
	 public int[] likeGood(int goodId,String userName){
		 return ld.likeGood(goodId,userName);
	 }
	 
	 /**
		 * 只是增加特定的用户username的收藏
		 * @param id
		 * @param username
		 * @return
		 */
		public static int[] addLike(String username,int goodid) {
			return ld.addLike(username, goodid);
		}
	
	
	
	
	
	public static void main(String[] args) {
		PageData<LikeMes> pd = new 	PageData<LikeMes>();
		pd = getlikebyUsername(1,2,"admin");
		for (LikeMes LikeMes : pd.getData()) {
			
		}
		
	}
	
	
	
	 
	
}

