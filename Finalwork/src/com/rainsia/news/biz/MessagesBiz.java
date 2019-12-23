package com.rainsia.news.biz;

import java.util.List;

import com.rainsia.news.entity.Messages;

public interface MessagesBiz {
	List<Messages> getAllMessages();
	
	Messages getMessagesById(int id);
	
	boolean addMessages(Messages messages, int userId);
	
	boolean delMessages(int id);
}
