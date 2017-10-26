package com.etc.dao;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import com.etc.cms.util.BaseDao;
import com.etc.entity.Order;

public class OrderDao {
	/**
	 * ��ѯ����
	 * @return
	 */
	public static List<Order> getAllOrder(){
		String sql="select * from X_Order";
		return (List<Order>)BaseDao.select(sql, Order.class, null);
	}
	/**
	 * ���Ӷ���
	 */
	public static boolean addOrder(Order o){
		String sql="insert into x_order values(null,?,?,?,sysdate,?,?,'����δ��ʼ')";
		return BaseDao.execute(sql, o.getUSERID(),o.getSENDPOSITION(),o.getRECEIVEPOSITION(),o.getORDERREMARK(),o.getORDERSTATE())>0;
	}
	/**
	 * �������µĶ���
	 * @return
	 */
	public static List<Order> getAllOrderMax(){
		String sql="select * from x_order where orderid=(select max(orderId) from x_order)";
		return (List<Order>)BaseDao.select(sql, Order.class, null);
	}
	public static Object getGPid(int id){
		String sql="select min(gpid) from X_GOODPOSITION where GPUSERID=?";
		return BaseDao.getFirst(sql, id);
	}

	
}
