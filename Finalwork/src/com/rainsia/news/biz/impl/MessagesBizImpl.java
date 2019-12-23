package com.rainsia.news.biz.impl;

import java.util.List;

import com.rainsia.news.biz.MessagesBiz;
import com.rainsia.news.dao.MessagesDao;
import com.rainsia.news.dao.impl.MessagesDaoImpl;
import com.rainsia.news.entity.Messages;

public class MessagesBizImpl implements MessagesBiz {
	
	private MessagesDao messagesDao = new MessagesDaoImpl(); 

	public List<Messages> getAllMessages() {
		List<Messages> listMessages = messagesDao.getAllMessages();
		return listMessages;
	}

	public Messages getMessagesById(int id) {
		Messages messages = messagesDao.getMessagesById(id);
		return messages;
	}

	public boolean addMessages(Messages messages, int userId) {
		int result = messagesDao.addMessages(messages, userId);
		if(result == 1) {
			return true;
		}
		return false;
	}

	public boolean delMessages(int id) {
		int result = messagesDao.delMessages(id);
		if(result == 1) {
			return true;
		}
		return false;
	}

}
