package com.etc.service;

import java.util.List;

import com.etc.cms.util.BaseDao;
import com.etc.dao.View_ShoppingCartDao;
import com.etc.entity.Message;
import com.etc.entity.View_ShoppingCart;

public class View_ShoppingCart_service {
	static View_ShoppingCartDao vs=new View_ShoppingCartDao();
	/**
	 * 通过用户id查询购物车订单视图
	 * @param id
	 * @return
	 */
	public static List<View_ShoppingCart> getView_ShoppingCartByUserId(int id){
		return vs.getView_ShoppingCartByUserId(id);
	}
	/**
	 * 通过购物车编号id查询购物车订单视图
	 * @param id
	 * @return
	 */
	public static List<View_ShoppingCart> getView_ShoppingCartByScId(int id){
		return vs.getView_ShoppingCartByScId(id);
	}
	/**
	 * 删除购物车
	 * @param id
	 * @return
	 */
	public boolean delShoppingCartByScid(int id){
		return vs.delShoppingCartByScid(id);
	}
	/**
	 * 更改库存
	 * @param count
	 * @param id
	 * @return
	 */
	public static boolean updateGoodsByGoodId(int count,int id){
		
		return vs.updateGoodsByGoodId(count, id);
	}
	/**
	 * 购买之后扣钱
	 * @param money
	 * @param id
	 * @return
	 */
	public static boolean updateUserBalanceByUserid(int money,int id) {
		return vs.updateUserBalanceByUserid(money, id);
	}
	/**
	 * 订单结算给卖家发消息
	 * @param mes
	 * @return
	 */
	public boolean addMes(Message mes){
		return vs.addMes(mes);
	}
	/**
	 * 通过用户id和商品编号查找购物车
	 * @param userid
	 * @param goodid
	 * @return
	 */
	public static List<View_ShoppingCart> getSC(int userid,int goodid){
		
		return vs.getSC(userid, goodid);
	}
	/**
	 * 通过购物车id修改购物车里的数量
	 * @param count
	 * @param scid
	 * @return
	 */
	public static boolean updateScCount(int count,int scid){
		
		return vs.updateScCount(count, scid);
	}
	/**
	 * 添加购物车
	 * @param goodsid
	 * @param goodscount
	 * @param userid
	 * @return
	 */
	public static boolean addShoppingCart(int goodsid,int goodscount,int userid){
		
		return vs.addShoppingCart(goodsid, goodscount, userid);
	}
	/**
	 * 查找指定用户的最新购物车ID
	 * @param args
	 */
	public static Object getSCid(int id){
		
		return vs.getSCid(id);
	}

}
