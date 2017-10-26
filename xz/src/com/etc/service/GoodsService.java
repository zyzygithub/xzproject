package com.etc.service;

import java.util.List;

import com.etc.cms.util.GoodsDetails;
import com.etc.cms.util.PageData;
import com.etc.dao.GoodsDao;
import com.etc.entity.Goods;

public class GoodsService {

	GoodsDao goodsDao = new GoodsDao();

	public List<GoodsDetails> getGD(int goodId) {
		return goodsDao.getGD(goodId);
	}

	public List<Goods> getHostGoods(String typename) {
		return goodsDao.getHostGoods(typename);
	}

	public int addToSC(int goodId, int goodCount, String userName) {
		return goodsDao.addToSC(goodId, goodCount, userName);
	}
	
	public PageData<GoodsDetails> getGoodsByType(int page,String typeName,int priceDown,int priceUp){
		return goodsDao.getGoodsByType(page,typeName,priceDown,priceUp);
	}
	
	public PageData<GoodsDetails> searchGoods(int page,String key,int priceDown,int priceUp){
		return goodsDao.searchGoods(page,key,priceDown,priceUp);
	}

}
