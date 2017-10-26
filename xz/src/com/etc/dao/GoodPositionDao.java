package com.etc.dao;

import java.util.ArrayList;
import java.util.List;

import com.etc.cms.util.BaseDao;
import com.etc.entity.GoodPosition;

/**
 * GoodPosition 
 * @author Administrator
 *
 */
public class GoodPositionDao {
	/**
	 * ��ѯ���е�ַ
	 * @return
	 */
	public  List<GoodPosition> getAllGoodPosition(){
		String sql="select * from X_GoodPosition";
		return (List<GoodPosition>)BaseDao.select(sql, GoodPosition.class, null);
	}
	/**
	 * ͨ���û�id���ҵ�ַ
	 * @param id
	 * @return
	 */
	public static List<GoodPosition> getAllGoodPositionById(int id){
		String sql="select * from X_GoodPosition where GPUSERID=?";
		return (List<GoodPosition>)BaseDao.select(sql, GoodPosition.class, id);
	}
	/**
	 * ���ӵ�ַ
	 * @param gp
	 * @return
	 */
	public static boolean addGoodPositionById(GoodPosition gp){
		String sql="insert into X_GoodPosition  values(null,?,?,?,?)";
		return BaseDao.execute(sql, gp.getGPUSERID(),gp.getGPPOSITOIN(),gp.getGPPHONE(),gp.getGPNAME())>0;
	}
	/**
	 * ͨ����ַidɾ����ַ��Ϣ
	 * @param id
	 * @return
	 */
	public boolean delGoodPositionById(int id){
		String sql="delete from X_GoodPosition where GPID=?";
		return BaseDao.execute(sql, id)>0;
	}
	
	/*public static void main(String[] args) {
		List<GoodPosition> list = new ArrayList<>();
		list = getAllGoodPositionById(1);
		for (GoodPosition GoodPosition : list) {
			System.out.println(GoodPosition);
		}
	}*/
}
