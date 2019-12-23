package com.rainsia.news.biz;

import java.util.List;

import com.rainsia.news.entity.News;

public interface NewsBiz {
	List<News> getAllNews();
	
	News getNewsById(int id);
	News getNewsByContent(String content);
	
	boolean addNews(News news, int userId);
	
	//删除新闻
	boolean deleteNewsById(int delid);
	
	//得到当前共有新闻总数
	public int getNewsNum();
	
	//修改id
	public boolean updateNews(int upid);
	
	//得到当前新闻的作者id
	public int getNewsAuthorId(News news);
	
	//编辑更新新闻
	public boolean updateEditNews(int newsid,String newtitle,String newcontent);
	
/*	public List<News> query(String word);*/
	public List<News> query(String word,String or,String ti,String co);
	
	public int getTotalCount();
	
	public List<News> queryNewsByPage(int currentPage);
}
