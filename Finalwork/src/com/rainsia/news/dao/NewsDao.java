package com.rainsia.news.dao;

import java.util.List;

import com.rainsia.news.entity.News;

public interface NewsDao{
	//获取所有新闻
	public List<News> getAllNews();	
	
	public List<News> getAllNewsOnlyTitle();
	
	public List<News> getAllNewsWithTitleAndDate();
	
	public News getNewsById(int id);
	public News getNewsByContent(String content);

/*	public List<News> query(String word);*/
	public List<News> query(String word,String or,String ti,String co);
	
	public int getTotalCount();

	public List<News> queryNewsByPage(int currentPage);
	
	/*获取现在新闻的数目 
	 * 更新id目录
	 */
    public int getNewsNum();
    
	//添加新闻
	public int addNews(News news, int userId);
	
	//删除新闻
	public int deleteNews(int delid);
	
	/*编辑修改新闻ID 
	delnewsid 是被删除的那条新闻的id*/
	public int updateNewsID(int delnewsid);
	
	//编辑更新新闻
	public int EditNewsTitle(int newsid,String newtitle);
	
	//编辑更新新闻内容
	public int EditNewsContent(int newsid,String newcontent);
	
	//通过作者姓名获取作者id
	public int getUserIdByAuthor(News news);
}