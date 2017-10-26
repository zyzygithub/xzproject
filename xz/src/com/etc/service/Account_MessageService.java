package com.etc.service;

import java.util.List;

import com.etc.cms.util.PageData;
import com.etc.dao.Account_MessageDao;
import com.etc.entity.Account_Message;



public class Account_MessageService {
	Account_MessageDao amd = new Account_MessageDao();

	public List<Account_Message> getAllMessage() {

		return amd.getAllMessage();

	}

	public PageData<Account_Message> getAccount_MessageByPage(String start,
			String length, String pename) {
		return amd.getMessageByPage(start, length, pename);
	}
}
