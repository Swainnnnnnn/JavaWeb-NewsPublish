package com.rainsia.news.entity;


public class Messages {

	private int id;
	private String title;
	private String content;
	private String author;
	
	private String createDate;
	
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Messages() {
		
	}
	
	public Messages(int id, String title) {
		this.id = id;
		this.title = title;
	}
	
	public Messages(String title, String content) {
		this.title = title;
		this.content = content;
	}
	
	public Messages(int id, String title, String date) {
		this.id = id;
		this.title = title;
		this.createDate = date;
	}
	
	public Messages(int id, String title, String content, String author, String createDate) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.author = author;
		this.createDate = createDate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

}
