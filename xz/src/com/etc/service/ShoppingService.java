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
	 * 根据用户名来查询到用户的购物车总条数
	 * @param userid
	 * @return
	 */
	public static  int getCartCount(String userName) {
	return	sd.CartUser(userName);
	}
	/**
	 * 根据视图查询购物车所需的列表信息
	 * @param args
	 */
public List<ShoppingCart> getcart (String name)
{
return sd.getAllShoppingCart(name);
}
/*
 * 
 * 删除当前用户所选购物车中货物	
 */
public void del(int goodid,String username)
	{
		sd.dele(goodid, username);
		
	}
	
/**
 * 修改购物车的数量
 * @param goodscount
 * @param scid
 * @return
 */
public static boolean updateShoppingCart(int goodscount, int scid) {
	
	return sd.updateShoppingCart(goodscount, scid);
}	

/**
 * 清空购物车
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

