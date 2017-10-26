package com.etc.service;

import com.etc.cms.util.MessageDetails;
import com.etc.cms.util.PageData;
import com.etc.dao.MessageDao;

public class MessageService {
	MessageDao md = new MessageDao();
	
	public PageData<MessageDetails> getMsgByGoodId(int goodId,int page) {
		return md.getMsgByGoodId(goodId,page);
	}
	
	public void sendGoodMessage(int goodId,String userName,String messageContent) {
		md.sendGoodMessage(goodId,userName,messageContent);
	}
}
