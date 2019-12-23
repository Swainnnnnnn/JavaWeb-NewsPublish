package com.rainsia.news.biz;

import com.rainsia.news.entity.User;

public interface UserLoginBiz {
	public User login(String username, String password);
}
