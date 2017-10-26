package com.etc.service;

import java.util.List;

import com.etc.cms.util.BaseDao;
import com.etc.dao.OrderDao;
import com.etc.entity.Order;

public class OrderService {
	static OrderDao od=new OrderDao();
	/**
	 * 增加订单
	 */
	public static boolean addOrder(Order o){
		return od.addOrder(o);
	}
	/**
	 * 查找最新的订单
	 * @return
	 */
	public static List<Order> getAllOrderMax(){
		return od.getAllOrderMax();
	}
	public static Object getGPid(int id){
		
		return od.getGPid(id);
	}
}
