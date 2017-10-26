package com.etc.dao;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import com.etc.cms.util.BaseDao;
import com.etc.entity.Message;
import com.etc.entity.View_ShoppingCart;

public class View_ShoppingCartDao {
	/**
	 * 通过用户id查询购物车订单视图
	 * @param id
	 * @return
	 */
	public static List<View_ShoppingCart> getView_ShoppingCartByUserId(int id){
		String sql="select * from X_View_ShoppingCart where userid=?";
		return (List<View_ShoppingCart>)BaseDao.select(sql,View_ShoppingCart.class ,id);
	}
	/**
	 * 通过购物车编号id查询购物车订单视图
	 * @param id
	 * @return
	 */
	public static List<View_ShoppingCart> getView_ShoppingCartByScId(int id){
		String sql="select * from X_View_ShoppingCart where scid=?";
		return (List<View_ShoppingCart>)BaseDao.select(sql,View_ShoppingCart.class ,id);
	}
	/**
	 * 购买之后扣钱
	 * @param money
	 * @param id
	 * @return
	 */
	public static boolean updateUserBalanceByUserid(int money,int id) {
		String sql="update X_user set USERBALANCE=USERBALANCE-? where userid=?";
		return BaseDao.execute(sql,money,id)>0;
	}
	/**
	 * 删除购物车
	 * @param id
	 * @return
	 */
	public boolean delShoppingCartByScid(int id){
		String sql="delete from x_shoppingcart where scid=?";
		return BaseDao.execute(sql, id)>0;
	}
	/**
	 * 更改库存
	 * @param count
	 * @param id
	 * @return
	 */
	public static boolean updateGoodsByGoodId(int count,int id){
		String sql="update x_goods set GOODCOUNT=GOODCOUNT-? where goodid=? ";
		return BaseDao.execute(sql, count,id)>0;
	}
	/**
	 * 订单结算给卖家发消息
	 * @param mes
	 * @return
	 */
	public boolean addMes(Message mes){
		String sql="insert into x_message values(null,?,?,sysdate,'未读',?,?,0)";
		return BaseDao.execute(sql, mes.getGOODSID(),mes.getFROMID(),mes.getTOID(),mes.getMESSAGECONTENT())>0;
	}
	/**
	 * 通过用户id和商品编号查找购物车
	 * @param userid
	 * @param goodid
	 * @return
	 */
	public static List<View_ShoppingCart> getSC(int userid,int goodid){
		String sql="select * from X_View_ShoppingCart where userid=? and goodid=?";
		return (List<View_ShoppingCart>)BaseDao.select(sql,View_ShoppingCart.class,userid,goodid);
	}
	/**
	 * 通过购物车id修改购物车里的数量
	 * @param count
	 * @param scid
	 * @return
	 */
	public static boolean updateScCount(int count,int scid){
		String sql="update x_shoppingcart set goodscount=? where scid=?";
		return BaseDao.execute(sql, count,scid)>0;
	}
	/**
	 * 添加购物车
	 * @param goodsid
	 * @param goodscount
	 * @param userid
	 * @return
	 */
	public static boolean addShoppingCart(int goodsid,int goodscount,int userid){
		String sql="insert into x_shoppingcart values(null,?,?,?)";
		return BaseDao.execute(sql, goodsid,goodscount,userid)>0;
	}
	/**
	 * 查找指定用户的最新购物车ID
	 * @param args
	 */
	public static Object getSCid(int id){
		String sql="select max(scid) from (select * from X_shoppingcart  where userid=?)";
		return BaseDao.getFirst(sql, id);
	}
	

}
