package com.rainsia.news.dao;

import java.util.Vector;

import com.rainsia.news.entity.User;

public interface UserDao {
	//查找用户
	public int countUserByName(String name);
	public User findUserByName(String name);
	public Vector<User> findUsersByName(String name);
	//添加用户
	public int insert(User user);
	
	//修改密码
	public int resetPassword(User user,String newPassword);
	
	//设置密保
	public int protectPassword(User user,String pwdanswer1,String pwdanswer2);
}
