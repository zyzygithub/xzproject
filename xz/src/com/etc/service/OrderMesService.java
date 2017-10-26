package com.etc.service;

import java.util.List;

import com.etc.cms.util.BaseDao;
import com.etc.dao.OrderMesDao;
import com.etc.entity.OrderMes;

public class OrderMesService {
	static OrderMesDao omd=new OrderMesDao();
	/**
	 * 增加订单详细页
	 * @param om
	 * @return
	 */
	public static boolean addOrderMes(OrderMes om){
		return omd.addOrderMes(om);
	}
	/**
	 * 查询订单的详细信息
	 * @return
	 */
	public static List<OrderMes> getAllOrderMes(){
		return omd.getAllOrderMes();
	}
}
