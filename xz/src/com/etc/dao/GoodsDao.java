package com.etc.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.etc.cms.util.BaseDao;
import com.etc.cms.util.GoodsDetails;
import com.etc.cms.util.GoodsSeller;
import com.etc.cms.util.PageData;
import com.etc.entity.Goods;

import oracle.jdbc.OracleTypes;

public class GoodsDao {
	//����ID��ȡ��Ʒ����
	public List<GoodsDetails> getGD(int goodId) {
		int n=BaseDao.execute("update X_GOODS set GOODCLICK=GOODCLICK+1 WHERE GOODID=?", goodId);
		return (List<GoodsDetails>) BaseDao.select("select * from X_VIEW_GOODSDETAILS where GOODID=? AND GOODSTATE='�ϼ�'", GoodsDetails.class, goodId);
	}
	//��ȡ���µ�6����Ʒ��¼
	public List<Goods> getHostGoods(String typename){
		return (List<Goods>) BaseDao.select("SELECT TEMP.* from (SELECT ROWNUM R,X_VIEW_GOODSDETAILS.* FROM X_VIEW_GOODSDETAILS WHERE GOODSTATE='�ϼ�' AND GOODCOUNT>0 AND TYPENAME=? ORDER BY GOODID DESC)TEMP WHERE TEMP.R<=6", Goods.class,typename);
	}
	//����TYPENAME��ȡ��Ʒ
	public PageData<GoodsDetails> getGoodsByType(int page,String typeName,int priceDown,int priceUp){
		return BaseDao.OraclegetPage("SELECT * from X_VIEW_GOODSDETAILS WHERE TYPENAME=? AND GOODSTATE='�ϼ�' AND GOODCOUNT>0 AND  GOODPRICE >=? AND GOODPRICE<=? ORDER BY GOODCLICK desc", page, 10, GoodsDetails.class, typeName,priceDown,priceUp);
	}
	//��ҳ�����Լ���������
	public PageData<GoodsDetails> searchGoods(int page,String key,int priceDown,int priceUp){
		return BaseDao.OraclegetPage("SELECT * from X_VIEW_GOODSDETAILS WHERE GOODSTATE='�ϼ�' AND GOODCOUNT>0 AND (GOODTITLE LIKE ? OR GOODREMARK LIKE ?) AND GOODPRICE >=? AND GOODPRICE<=? ORDER BY GOODCLICK DESC", page, 10, GoodsDetails.class, '%'+key+'%','%'+key+'%',priceDown,priceUp);
	}
	
	//����Ʒ���빺�ﳵ
	public int addToSC(int goodId,int goodCount,String userName) {
		Connection conn=BaseDao.getConn();
		String sql="{call X_ADD_TO_SC(?,?,?,?)}";
		CallableStatement cstmt=null;
		int count=0;
		try {
			cstmt=conn.prepareCall(sql);
			cstmt.setInt(1, goodId);
			cstmt.setInt(2, goodCount);
			cstmt.setString(3, userName);
			cstmt.registerOutParameter(4, OracleTypes.INTEGER);
			cstmt.execute();
			count=cstmt.getInt(4);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				cstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}return count;
	}
	
	/**
	 * �õ��������з����� �ϼ�Ϊ״̬�� ��Ʒ
	 * ��������
	 * @param page
	 * @param pageSize
	 * @param taname
	 * @return
	 */
	public static PageData<GoodsSeller> getsalegood(int page,int pageSize,String taname) {
		String sql = "SELECT  X_GOODS.GOODID,X_GOODS.GOODTITLE,X_GOODS.GOODREMARK,X_GOODS.GOODPRICE,X_GOODS.ORIGINALPRICE,X_GOODS.GOODPIC,X_GOODS.GOODCLICK,X_USER.USERNAME FROM X_GOODS INNER JOIN X_USER ON X_GOODS.GOODSELER = X_USER.USERID WHERE X_USER.USERNAME = ?";
		return BaseDao.OraclegetPage(sql, page, pageSize, GoodsSeller.class, taname);
		
	}
	
	/**
	 * �õ�����������������ƷΪ �ѷ���״̬�� 
	 * ��������
	 * @param page
	 * @param pageSize
	 * @param taname
	 * @return
	 */
	public static PageData<GoodsSeller> getoutgoos(int page,int pageSize,int id) {
		String sql = "select x_goods.GOODid, x_goods.GOODTITLE from x_goods "
				+ " where x_goods.goodid in "
				+ "(select x_ordermes.goodid from x_ordermes where x_ordermes.goodid in "
				+ "(select x_goods.goodid from X_goods where GOODSELER=?))";
		return BaseDao.OraclegetPage(sql, page, pageSize, GoodsSeller.class, id);
		
	}
	public static void main(String[] args) {
		
	}
	
	
}
