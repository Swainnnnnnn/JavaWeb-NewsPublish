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
import com.rainsia.news.dao.NewsDao;
import com.rainsia.news.dao.RSProcessor;
import com.rainsia.news.entity.News;

public class NewsDaoImpl extends BaseDao implements NewsDao {
	public int newsnum;

	public List<News> getAllNews() {
		final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

		// 获取所有新闻
		String sql = "select news.id as id, tilte, content, user.display_name as author, date from news, user where news.author_id = user.id order by news.id";

		RSProcessor newsProcessor = new RSProcessor() {

			public Object process(ResultSet rs) throws SQLException {
				List<News> listNews = new ArrayList<News>();

				while (rs != null && rs.next()) {
					int id = rs.getInt("id");
					String title = rs.getString("title");
					String content = rs.getString("content");
					String author = rs.getString("author");
					Date date = rs.getDate("date");
					String strDate = sdf.format(date);

					News news = new News(id, title, content, author, strDate);
					listNews.add(news);
				}
				return listNews;
			}

		};

		Object result = executeQuery(newsProcessor, sql, null);

		return (List<News>) result;
	}

	public List<News> getAllNewsOnlyTitle() {
		String sql = "select id, title from news order by id";

		RSProcessor newsProcessor = new RSProcessor() {

			public Object process(ResultSet rs) throws SQLException {
				List<News> listNews = new ArrayList<News>();
				while (rs != null && rs.next()) {
					int id = rs.getInt("id");
					String title = rs.getString("title");

					News news = new News(id, title);
					listNews.add(news);
				}
				return listNews;
			}

		};

		Object result = executeQuery(newsProcessor, sql, null);

		return (List<News>) result;
	}

	public List<News> getAllNewsWithTitleAndDate() {
		final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

		String sql = "select id,content, title, date from news order by id";

		RSProcessor newsProcessor = new RSProcessor() {

			public Object process(ResultSet rs) throws SQLException {
				List<News> listNews = new ArrayList<News>();
				while (rs != null && rs.next()) {
					int id = rs.getInt("id");
					String title = rs.getString("title");
					String content = rs.getString("content");
					Date date = rs.getDate("date");
					String strDate = sdf.format(date);

					News news = new News(id, content, title, strDate);
					listNews.add(news);
				}
				return listNews;
			}

		};

		Object result = executeQuery(newsProcessor, sql, null);

		return (List<News>) result;
	}

	public News getNewsById(int id) {
		final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

		// 获取所有新闻
		String sql = "select news.id as id, title, content, user.display_name as author, date from news, user where news.author_id = user.id and news.id = ?";
		Object[] params = { id };

		RSProcessor newsProcessor = new RSProcessor() {

			public Object process(ResultSet rs) throws SQLException {
				News news = null;
				if (rs != null && rs.next()) {
					int id = rs.getInt("id");
					String title = rs.getString("title");
					String content = rs.getString("content");
					String author = rs.getString("author");
					Date date = rs.getDate("date");
					String strDate = sdf.format(date);

					news = new News(id, title, content, author, strDate);
				}
				return news;
			}

		};

		Object result = executeQuery(newsProcessor, sql, params);

		return (News) result;
	}

	public News getNewsByContent(String content) {
		final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

		// 获取所有新闻
		String sql = "select id,title,content,author,date from news where content=?";
		Object[] params = { content };

		RSProcessor newsProcessor = new RSProcessor() {

			public Object process(ResultSet rs) throws SQLException {
				News news = null;
				if (rs != null && rs.next()) {
					int id = rs.getInt("id");
					String title = rs.getString("title");
				    String content = rs.getString("content"); 
					String author = rs.getString("author");
					Date date = rs.getDate("date");
					String strDate = sdf.format(date);

					news = new News(id,content, title, author, strDate);
				}
				return news;
			}

		};

		Object result = executeQuery(newsProcessor, sql, params);

		return (News) result;
	}

	public int addNews(News news, int userId) {
		String sql = "insert into news (title, content, date, author_id) values(?, ?, now(), ?)";
		Object[] params = { news.getTitle(), news.getContent(), userId };

		return this.executeUpdate(sql, params);
	}

	// 查询
	public List<News> query(String word,String or,String ti,String co){
		final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
//		String sql ="select * from news where title like ? ";
		String sql = null;
		Object[] params;//定义
		
		if(or!=null){
			sql = "select news.id as id, title, content, user.display_name as author, date from news, user where news.author_id=user.id and (title like ? or content like ? or display_name like ?) order by date desc";
			params = new Object[3];
			word="%"+word+"%";
			params[0] = word;//初始化
			params[1] = word;
			params[2] = word;
		}else if(ti!=null){
			sql = "select news.id as id, title, content, user.display_name as author, date from news, user where news.author_id=user.id and title like ?";	
			params = new Object[1];
			word="%"+word+"%";
			params[0] = word;//初始化
		}else if(co!=null){
			sql = "select news.id as id, title, content, user.display_name as author, date from news, user where news.author_id=user.id and content like ? ";
			params = new Object[1];
			word="%"+word+"%";
			params[0] = word;//初始化
		}else{
			sql = "select news.id as id, title, content, user.display_name as author, date from news, user where news.author_id=user.id and (title like ? or content like ? or display_name like ?)";
			params = new Object[3];
			word="%"+word+"%";
			params[0] = word;//初始化
			params[1] = word;
			params[2] = word;
		}

		RSProcessor newsProcessor = new RSProcessor() {

			public Object process(ResultSet rs) throws SQLException {
				List<News> listNews = new ArrayList<News>();
				while (rs != null && rs.next()) {
					int id = rs.getInt("id");
					String title = rs.getString("title");
					String content = rs.getString("content");
					String author = rs.getString("author");
					Date date = rs.getDate("date");
					String strDate = sdf.format(date);

					News news = new News(id, title, content, author, strDate);
					listNews.add(news);
				}
				return listNews;
			}
		};
		Object result = executeQuery(newsProcessor, sql, params);

		return (List<News>) result;
	}

	// 查询总数
	public int getTotalCount() {
		String sql = "select count(1) from news ";

		int count = -1;
		RSProcessor newsProcessor = new RSProcessor() {

			public Object process(ResultSet rs) throws SQLException {
				int count = -1;
				if (rs.next()) {
					count = rs.getInt(1);
				}
				return count;
			}
		};
		Object result = executeQuery(newsProcessor, sql, null);

		return (int) result;
	}

	public List<News> queryNewsByPage(int currentPage) {
		final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

		String sql = "select news.id as id, title, content, user.display_name as author, date from news,user limit ?,2";

		Object[] params = { currentPage * 2 };
//		String sql = "select news.id as id, title, content, user.display_name as author, date from news, user where title like ? or content like ? or display_name like ?";
//
//		word="%"+word+"%";
//		Object[] params = {word,word,word};

		RSProcessor newsProcessor = new RSProcessor() {

			public Object process(ResultSet rs) throws SQLException {
				List<News> listNews = new ArrayList<News>();
				while (rs != null && rs.next()) {
					int id = rs.getInt("id");
					String title = rs.getString("title");
					String content = rs.getString("content");
					String author = rs.getString("author");
					Date date = rs.getDate("date");
					String strDate = sdf.format(date);

					News news = new News(id, title, content, author, strDate);
					listNews.add(news);
				}
				return listNews;
			}
		};
		Object result = executeQuery(newsProcessor, sql, params);

		return (List<News>) result;
	}

	/*
	 * 获取现在新闻的数目 更新id目录
	 */
	public int getNewsNum() {
//		List<News> listnews = this.getAllNews();
//		this.newsnum = listnews.size();
		this.newsnum = this.newsCount();
		return this.newsnum;
	}

	// 删除新闻
	public int deleteNews(int delid) {
		String sql = "delete from news where id = ?";
		Object[] params = { delid };

		return this.executeUpdate(sql, params);
	}

	// 编辑修改新闻id
	public int updateNewsID(int delnewsid) {// 直接给个newsid就可以
		String sql = "update news set id=id-1 where id>?";
		Object[] params = { delnewsid };

		return this.executeUpdate(sql, params);
	}

	// 编辑更新新闻标题
	public int EditNewsTitle(int newsid, String newtitle) {
		String sql = "update news set title=? where id=?";
		Object[] params = { newtitle, newsid };

		return this.executeUpdate(sql, params);
	}

	// 编辑更新新闻内容
	public int EditNewsContent(int newsid, String newcontent) {
		String sql = "update news set content=? where id=?";
		Object[] params = { newcontent, newsid };

		return this.executeUpdate(sql, params);
	}

	// 通过新闻获取作者id
	public int getUserIdByAuthor(News news) {
		String atname = news.getAuthor();

		return this.getUserIdByAuthor(news);
	}

}
