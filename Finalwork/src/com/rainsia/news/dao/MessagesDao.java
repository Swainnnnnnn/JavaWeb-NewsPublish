package com.rainsia.news.dao;

import java.util.List;

import com.rainsia.news.entity.Messages;

public interface MessagesDao{
	//获取所有新闻
	public List<Messages> getAllMessages();	
	
	public List<Messages> getAllMessagesOnlyTitle();
	
	public List<Messages> getAllMessagesWithTitleAndDate();
	
	public Messages getMessagesById(int id);
	
	public int addMessages(Messages news, int userId);
	
	public int delMessages(int id);
}