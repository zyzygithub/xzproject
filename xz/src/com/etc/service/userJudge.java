package com.etc.service;



import java.util.List;

import com.etc.cms.util.BaseDao;
import com.etc.entity.User;

public class userJudge {


	public boolean judge(String user) {
		// TODO Auto-generated method stub
		boolean b=false;
		BaseDao bd=new BaseDao();
		List<User> list=(List<User>)bd.select("select * FROM X_USER WHERE USERNAME=?",User.class,user);
		String state="";
		for (User user2 : list) {
			state=user2.getUSERSTATE();
			
		}
		if (state.equals("½ûÓÃ")) {
			b=false;
		}else {
			b=true;
		}
		
		return b;
	}

}
