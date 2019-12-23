package com.rainsia.news.biz.impl;

import com.rainsia.news.biz.UserLoginBiz;
import com.rainsia.news.dao.UserDao;
import com.rainsia.news.dao.impl.UserDaoImpl;
import com.rainsia.news.entity.User;

public class UserLoginBizImpl implements UserLoginBiz {
	
	private UserDao userDao = new UserDaoImpl();

	public User login(String username, String password) {
		User user = userDao.findUserByName(username);
		if(user != null && user.getPassword().equals(password)) {
			return user;
		}
		return null;
	}

}
