package com.rainsia.news.biz.impl;

import java.util.List;

import com.rainsia.news.biz.NewsBiz;
import com.rainsia.news.dao.NewsDao;
import com.rainsia.news.dao.impl.NewsDaoImpl;
import com.rainsia.news.entity.News;

public class NewsBizImpl implements NewsBiz {
	
	private NewsDao newsDao = new NewsDaoImpl(); 

	public List<News> getAllNews() {
		List<News> listNews = newsDao.getAllNewsWithTitleAndDate();
		return listNews;
	}

	public News getNewsById(int id) {
		News news = newsDao.getNewsById(id);
		return news;
	}
	
	public News getNewsByContent(String content) {
		News news = newsDao.getNewsByContent(content);
		return news;		
	}

	public List<News> query(String word,String or,String ti,String co)
/*	public List<News> query(String word)*/ {
		List<News> listNews = newsDao.query(word,or,ti,co);
		return listNews;
	}
	
	public boolean addNews(News news, int userId) {
		int result = newsDao.addNews(news, userId);
		if(result == 1) {
			return true;
		}
		return false;
	}

	
	public int getTotalCount() {
		return getTotalCount();
	}
	
	public List<News> queryNewsByPage(int currentPage){
		List<News> listNews = newsDao.queryNewsByPage(currentPage);
		return listNews;
	}
	
	//删除新闻
	public boolean deleteNewsById(int delid) {
		int result = newsDao.deleteNews(delid);
		if(result == 1) {
			return true;
		}
		return false;
	}
	
	//得到当前共有新闻总数
	public int getNewsNum() {
		return newsDao.getNewsNum();
	}
	//修改id
	public boolean updateNews(int upid) {
		int result = newsDao.updateNewsID(upid);
		if(result == 1) {
			return true;
		}
		return false; 
	}
	
	//得到当前新闻的作者id
	public int getNewsAuthorId(News news) {
		return newsDao.getUserIdByAuthor(news);
	}
	
	//编辑更新新闻
	public boolean updateEditNews(int newsid,String newtitle,String newcontent) {
		int result1 = newsDao.EditNewsTitle(newsid, newtitle);
		int result2 = newsDao.EditNewsContent(newsid, newcontent);
		if(result1 == 1 || result2 == 1) return true;
		else return false;
	}

}
