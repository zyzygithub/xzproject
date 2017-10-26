package com.etc.service;

import java.util.List;

import com.etc.cms.util.BaseDao;
import com.etc.dao.View_ShoppingCartDao;
import com.etc.entity.Message;
import com.etc.entity.View_ShoppingCart;

public class View_ShoppingCart_service {
	static View_ShoppingCartDao vs=new View_ShoppingCartDao();
	/**
	 * ͨ���û�id��ѯ���ﳵ������ͼ
	 * @param id
	 * @return
	 */
	public static List<View_ShoppingCart> getView_ShoppingCartByUserId(int id){
		return vs.getView_ShoppingCartByUserId(id);
	}
	/**
	 * ͨ�����ﳵ���id��ѯ���ﳵ������ͼ
	 * @param id
	 * @return
	 */
	public static List<View_ShoppingCart> getView_ShoppingCartByScId(int id){
		return vs.getView_ShoppingCartByScId(id);
	}
	/**
	 * ɾ�����ﳵ
	 * @param id
	 * @return
	 */
	public boolean delShoppingCartByScid(int id){
		return vs.delShoppingCartByScid(id);
	}
	/**
	 * ���Ŀ��
	 * @param count
	 * @param id
	 * @return
	 */
	public static boolean updateGoodsByGoodId(int count,int id){
		
		return vs.updateGoodsByGoodId(count, id);
	}
	/**
	 * ����֮���Ǯ
	 * @param money
	 * @param id
	 * @return
	 */
	public static boolean updateUserBalanceByUserid(int money,int id) {
		return vs.updateUserBalanceByUserid(money, id);
	}
	/**
	 * ������������ҷ���Ϣ
	 * @param mes
	 * @return
	 */
	public boolean addMes(Message mes){
		return vs.addMes(mes);
	}
	/**
	 * ͨ���û�id����Ʒ��Ų��ҹ��ﳵ
	 * @param userid
	 * @param goodid
	 * @return
	 */
	public static List<View_ShoppingCart> getSC(int userid,int goodid){
		
		return vs.getSC(userid, goodid);
	}
	/**
	 * ͨ�����ﳵid�޸Ĺ��ﳵ�������
	 * @param count
	 * @param scid
	 * @return
	 */
	public static boolean updateScCount(int count,int scid){
		
		return vs.updateScCount(count, scid);
	}
	/**
	 * ��ӹ��ﳵ
	 * @param goodsid
	 * @param goodscount
	 * @param userid
	 * @return
	 */
	public static boolean addShoppingCart(int goodsid,int goodscount,int userid){
		
		return vs.addShoppingCart(goodsid, goodscount, userid);
	}
	/**
	 * ����ָ���û������¹��ﳵID
	 * @param args
	 */
	public static Object getSCid(int id){
		
		return vs.getSCid(id);
	}

}
