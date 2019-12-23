package com.rainsia.news.dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.rainsia.news.dao.BaseDao;
import com.rainsia.news.dao.MessagesDao;
import com.rainsia.news.dao.RSProcessor;
import com.rainsia.news.entity.Messages;

public class MessagesDaoImpl extends BaseDao implements MessagesDao {
	
	public List<Messages> getAllMessages() {
		final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		
		//获取所有留言
		String sql = "select messages.id as id, messages.title, messages.content, user.display_name as author, messages.date from messages, user where messages.author_id = user.id order by messages.id";
		
		RSProcessor messagesProcessor = new RSProcessor() {

			public Object process(ResultSet rs) throws SQLException {
				List<Messages> listMessages = new ArrayList<Messages>();
				
				while(rs != null && rs.next()) {
					int id = rs.getInt("id");
					String title = rs.getString("messages.title");
					String content = rs.getString("messages.content");
					String author = rs.getString("author");
					Date date = rs.getDate("messages.date");
					String strDate = sdf.format(date);
					
					Messages messages = new Messages(id, title, content, author, strDate);
					listMessages.add(messages);
				}
				return listMessages;
			}
			
		};
		
		Object result = executeQuery(messagesProcessor, sql, null);
		
		return (List<Messages>)result;
	}

	public List<Messages> getAllMessagesOnlyTitle() {
		String sql = "select messages.id, messages.title from messages order by messages.id";
		
		RSProcessor messagesProcessor = new RSProcessor() {

			public Object process(ResultSet rs) throws SQLException {
				List<Messages> listMessages = new ArrayList<Messages>();
				while(rs != null && rs.next()) {
					int id = rs.getInt("messages.id");
					String title = rs.getString("messages.title");
					
					Messages messages = new Messages(id, title);
					listMessages.add(messages);
				}
				return listMessages;
			}
			
		};
		
		Object result = executeQuery(messagesProcessor, sql, null);
		
		return (List<Messages>)result;
	}
	
	public List<Messages> getAllMessagesWithTitleAndDate() {
		final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		
		String sql = "select messages.id, messages.title, messages.date from messages order by messages.id";
		
		RSProcessor messagesProcessor = new RSProcessor() {

			public Object process(ResultSet rs) throws SQLException {
				List<Messages> listMessages = new ArrayList<Messages>();
				while(rs != null && rs.next()) {
					int id = rs.getInt("messages.id");
					String title = rs.getString("messages.title");
					Date date = rs.getDate("messages.date");
					String strDate = sdf.format(date);
					
					Messages messages = new Messages(id, title, strDate);
					listMessages.add(messages);
				}
				return listMessages;
			}
			
		};
		
		Object result = executeQuery(messagesProcessor, sql, null);
		
		return (List<Messages>)result;
	}

	public Messages getMessagesById(int id) {
		final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		
		//获取所有新闻
		String sql = "select messages.id, messages.title, messages.content, user.display_name as author, messages.date from messages, user where messages.author_id = user.id and messages.id = ?";
		Object[] params = {id};
		
		RSProcessor messagesProcessor = new RSProcessor() {

			public Object process(ResultSet rs) throws SQLException {
				Messages messages = null;
				if(rs != null && rs.next()) {
					int id = rs.getInt("messages.id");
					String title = rs.getString("messages.title");
					String content = rs.getString("messages.content");
					String author = rs.getString("author");
					Date date = rs.getDate("messages.date");
					String strDate = sdf.format(date);
					
					messages = new Messages(id, title, content, author, strDate);
				}
				return messages;
			}
			
		};
		
		Object result = executeQuery(messagesProcessor, sql, params);
		
		return (Messages)result;
	}

	public int addMessages(Messages messages, int userId) {
		String sql = "insert into messages (title, content, date, author_id) values(?, ?, now(), ?)";
		Object[] params = {messages.getTitle(), messages.getContent(), userId};
		
		return this.executeUpdate(sql, params);
	}
	public int delMessages(int id) {
		String sql = "delete from messages where id = ?";
		Object[] params = {id};
		return this.executeUpdate(sql, params);
	}
}
