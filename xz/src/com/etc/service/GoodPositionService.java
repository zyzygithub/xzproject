package com.etc.service;

import java.util.List;

import com.etc.cms.util.BaseDao;
import com.etc.dao.GoodPositionDao;
import com.etc.entity.GoodPosition;

public class GoodPositionService {
	 static GoodPositionDao gd=new GoodPositionDao();
	 /**
	  * ��ѯ���е�ַ
	  * @return
	  */
	public  List<GoodPosition> getAllGoodPosition(){
		return gd.getAllGoodPosition();
	}
	/**
	 * ͨ���û�id���ҵ�ַ
	 * @param id
	 * @return
	 */
	public static List<GoodPosition> getAllGoodPositionById(int id){
		return gd.getAllGoodPositionById(id);
	}
	/**
	 * ���ӵ�ַ
	 * @param gp
	 * @return
	 */
	public static boolean addGoodPositionById(GoodPosition gp){
		return gd.addGoodPositionById(gp);
	}
	/**
	 * ͨ����ַidɾ����ַ��Ϣ
	 * @param id
	 * @return
	 */
	public boolean delGoodPositionById(int id){
		return gd.delGoodPositionById(id);
	}
}
