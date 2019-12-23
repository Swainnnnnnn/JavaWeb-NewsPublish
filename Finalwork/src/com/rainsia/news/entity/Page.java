package com.rainsia.news.entity;

import java.util.List;

public class Page {

	private int currentPage;
	
	private int pageSize;
	
	private int totalCount;
	
	private int totalPage;
	
	private List<News> listNews;
	
	public Page() {

	}

	public Page(int currentPage, int pageSize, int totalCount, int totalPage, List<News> listNews) {
		this.currentPage = currentPage;
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		this.totalPage = totalPage;
		this.listNews = listNews;
	}


	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
		this.totalPage = this.totalCount%this.pageSize==0?this.totalCount/this.pageSize:totalCount/this.pageSize+1;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getTotalPage() {
		return totalPage;
	}

//	public void setTotalPage(int totalPage) {
//		this.totalPage = totalPage;
//	}

	public List<News> getListNews() {
		return listNews;
	}

	public void setListNews(List<News> listNews) {
		this.listNews = listNews;
	}
}
