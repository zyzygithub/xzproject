package com.etc.service;

import java.util.List;

import com.etc.cms.util.BaseDao;
import com.etc.dao.OrderMesDao;
import com.etc.entity.OrderMes;

public class OrderMesService {
	static OrderMesDao omd=new OrderMesDao();
	/**
	 * ���Ӷ�����ϸҳ
	 * @param om
	 * @return
	 */
	public static boolean addOrderMes(OrderMes om){
		return omd.addOrderMes(om);
	}
	/**
	 * ��ѯ��������ϸ��Ϣ
	 * @return
	 */
	public static List<OrderMes> getAllOrderMes(){
		return omd.getAllOrderMes();
	}
}
