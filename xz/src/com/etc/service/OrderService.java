package com.etc.service;

import java.util.List;

import com.etc.cms.util.BaseDao;
import com.etc.dao.OrderDao;
import com.etc.entity.Order;

public class OrderService {
	static OrderDao od=new OrderDao();
	/**
	 * ���Ӷ���
	 */
	public static boolean addOrder(Order o){
		return od.addOrder(o);
	}
	/**
	 * �������µĶ���
	 * @return
	 */
	public static List<Order> getAllOrderMax(){
		return od.getAllOrderMax();
	}
	public static Object getGPid(int id){
		
		return od.getGPid(id);
	}
}
