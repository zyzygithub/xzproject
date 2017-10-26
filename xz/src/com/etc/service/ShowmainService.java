package com.etc.service;

import java.util.ArrayList;
import java.util.List;

import com.etc.cms.util.PageData;
import com.etc.dao.TypesDao;
import com.etc.entity.Types;


public class ShowmainService {

	
/**
 * 分页信息带模糊查找
 * @param page
 * @param pageSize
 * @param pename
 * @return
 */
	public List<Types> getAllTypes() {
		List<Types> list = new ArrayList<Types>();
		list = TypesDao.getAllTypes();
		return list;
		
	}
	public List<Types> getAllTypemes(String typename) {
		List<Types> list = new ArrayList<Types>();
		list = TypesDao.getAllTypemes(typename);
		return list;
		
	}
	
	

}
