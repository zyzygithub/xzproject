package com.etc.dao;

import java.util.ArrayList;
import java.util.List;

import com.etc.cms.util.BaseDao;
import com.etc.entity.Types;

public class TypesDao {
	
	public static List<Types> getTypes(){
		String sql="select TYPENAME from X_Types group by TYPENAME ";
		return (List<Types>)BaseDao.select(sql, Types.class, null);
	}
	
	
	public static List<Types> getAllTypes(){
		String sql="select TYPENAME from X_TYPES GROUP BY TYPENAME";
		return (List<Types>)BaseDao.select(sql, Types.class, null);
	}
	public static List<Types> getAllTypemes(String typename){
		String sql="SELECT * FROM X_TYPES WHERE TYPENAME=?";
		return (List<Types>)BaseDao.select(sql, Types.class, typename);
	}
	
	public static void main(String[] args) {
		List<Types> list = new ArrayList<Types>();
		list = getAllTypemes("电子产品");
		for (Types Types : list) {
			System.out.println(Types);
		}
	}
}
