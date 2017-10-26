package com.etc.dao;

import java.util.ArrayList;
import java.util.List;

import com.etc.cms.util.BaseDao;
import com.etc.entity.OrderMes;

public class OrderMesDao {
	/**
	 * ��ѯ��������ϸ��Ϣ
	 * @return
	 */
	public static List<OrderMes> getAllOrderMes(){
		String sql="select * from X_OrderMes";
		return (List<OrderMes>)BaseDao.select(sql, OrderMes.class, null);
	}
	/**
	 * ���Ӷ�����ϸҳ
	 * @param om
	 * @return
	 */
	public static boolean addOrderMes(OrderMes om){
		String sql="insert into X_OrderMes values(null,?,?,?)";
		return BaseDao.execute(sql, om.getGOODID(),om.getBUYCOUNT(),om.getORDERID())>0;
	}
}
