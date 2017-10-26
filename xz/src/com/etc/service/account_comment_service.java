package com.etc.service;


import com.etc.cms.util.BaseDao;
import com.etc.cms.util.PageData;
import com.etc.dao.CommentDao;
import com.etc.entity.USER_COMMENT;

public class account_comment_service {

	CommentDao cd=new CommentDao();
	/**
	 * 根据卖家姓名查询评价 别人给我评价
	 * @param page
	 * @param pagesize
	 * @param p_userName
	 * @return
	 */
	public PageData<USER_COMMENT> getCommentBySeler(int page,int pagesize,int p_userId,String p_searchval){
		return cd.getCommentBySeler(page, pagesize, p_userId,p_searchval);
	}
	
	/**
	 * 根据买家姓名查询评价 我给别人的评价
	 * @param page
	 * @param pagesize
	 * @param p_userName
	 * @return
	 */
	public PageData<USER_COMMENT> getCommentByBuyer(int page,int pagesize,int p_userId,String p_searchval){
		return cd.getCommentByBuyer(page, pagesize, p_userId,p_searchval);
	}
	

	

	
	
}
