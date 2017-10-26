package com.etc.dao;

import java.util.ArrayList;
import java.util.List;

import com.etc.cms.util.BaseDao;
import com.etc.cms.util.PageData;
import com.etc.entity.Comment;
import com.etc.entity.USER_COMMENT;

/**
 * 评价表的dao类
 * @author Administrator
 *
 */
public class CommentDao {
	public static List<Comment> getAllComment(){
		String sql="select * from X_comment";
		return (List<Comment>)BaseDao.select(sql, Comment.class, null);
	}
	
	
	
	
	
	
	

	/**
	 * 根据卖家姓名查询评价 别人给我评价
	 * @param page
	 * @param pagesize
	 * @param p_userName
	 * @return
	 */
	public PageData<USER_COMMENT> getCommentBySeler(int page,int pagesize,int p_userId,String p_searchval){
		String sql = "select X_USER.USERNAME,X_COMMENT.COMMENTCONTENT,X_COMMENT.COMMENTSCORE,X_COMMENT.COMMENTDATE from X_COMMENT inner join  X_USER on X_COMMENT.BUYER = X_USER.USERID where X_COMMENT.SELER =? and (X_USER.USERNAME like ? or X_COMMENT.COMMENTCONTENT like ?)";
		return BaseDao.OraclegetPage(sql, page, pagesize, USER_COMMENT.class,p_userId,"%"+p_searchval+"%","%"+p_searchval+"%");
	}
	
	
	/**
	 * 根据卖家姓名查询评价 我给别人评价
	 * @param page
	 * @param pagesize
	 * @param p_userName
	 * @return
	 */
	public PageData<USER_COMMENT> getCommentByBuyer(int page,int pagesize,int p_userId,String p_searchval){
		String sql = "select X_USER.USERNAME,X_COMMENT.COMMENTCONTENT,X_COMMENT.COMMENTSCORE,X_COMMENT.COMMENTDATE from X_COMMENT inner join  X_USER on X_COMMENT.SELER = X_USER.USERID where X_COMMENT.BUYER =? and (X_USER.USERNAME like ? or X_COMMENT.COMMENTCONTENT like ?)";
		return BaseDao.OraclegetPage(sql, page, pagesize, USER_COMMENT.class,p_userId,"%"+p_searchval+"%","%"+p_searchval+"%");
	}
	
	
	
	
	
	

	
	
	public static void main(String[] args) {
		/*List<Comment> list = new ArrayList<>();
		list = getAllComment();
		for (Comment comment : list) {
			System.out.println(comment);
		}*/
		
		
		
		/*PageData<USER_COMMENT> commentToMe = getCommentByScore(1, 5, 1,4);
		
		for (USER_COMMENT user_comment : commentToMe.getData()) {
			System.out.println(user_comment);
		}*/
	}
}
