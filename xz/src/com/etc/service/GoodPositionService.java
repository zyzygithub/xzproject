package com.etc.service;

import java.util.List;

import com.etc.cms.util.BaseDao;
import com.etc.dao.GoodPositionDao;
import com.etc.entity.GoodPosition;

public class GoodPositionService {
	 static GoodPositionDao gd=new GoodPositionDao();
	 /**
	  * 查询所有地址
	  * @return
	  */
	public  List<GoodPosition> getAllGoodPosition(){
		return gd.getAllGoodPosition();
	}
	/**
	 * 通过用户id查找地址
	 * @param id
	 * @return
	 */
	public static List<GoodPosition> getAllGoodPositionById(int id){
		return gd.getAllGoodPositionById(id);
	}
	/**
	 * 增加地址
	 * @param gp
	 * @return
	 */
	public static boolean addGoodPositionById(GoodPosition gp){
		return gd.addGoodPositionById(gp);
	}
	/**
	 * 通过地址id删除地址信息
	 * @param id
	 * @return
	 */
	public boolean delGoodPositionById(int id){
		return gd.delGoodPositionById(id);
	}
}
