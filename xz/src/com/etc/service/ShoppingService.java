package com.etc.service;

import java.util.List;

import com.etc.cms.util.BaseDao;
import com.etc.dao.LikeDao;
import com.etc.dao.ShoppingCartDao;
import com.etc.dao.UserDao;
import com.etc.entity.Like;
import com.etc.entity.ShoppingCart;
import com.etc.entity.User;




public class ShoppingService {
	
	static ShoppingCartDao sd = new ShoppingCartDao();
	
	/**
	 * �����û�������ѯ���û��Ĺ��ﳵ������
	 * @param userid
	 * @return
	 */
	public static  int getCartCount(String userName) {
	return	sd.CartUser(userName);
	}
	/**
	 * ������ͼ��ѯ���ﳵ������б���Ϣ
	 * @param args
	 */
public List<ShoppingCart> getcart (String name)
{
return sd.getAllShoppingCart(name);
}
/*
 * 
 * ɾ����ǰ�û���ѡ���ﳵ�л���	
 */
public void del(int goodid,String username)
	{
		sd.dele(goodid, username);
		
	}
	
/**
 * �޸Ĺ��ﳵ������
 * @param goodscount
 * @param scid
 * @return
 */
public static boolean updateShoppingCart(int goodscount, int scid) {
	
	return sd.updateShoppingCart(goodscount, scid);
}	

/**
 * ��չ��ﳵ
 * @param userid
 * @return
 */
public boolean delAllShoppingCart(int  userid){
	return sd.delAllShoppingCart(userid);
}
	
	
	public static Object getSelerName(int id){
		return sd.getSelerName(id);
	}
	
	
}

