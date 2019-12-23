package com.rainsia.news.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.rainsia.news.dao.BaseDao;
import com.rainsia.news.dao.RSProcessor;
import com.rainsia.news.dao.UserDao;
import com.rainsia.news.entity.User;

public class UserDaoImpl extends BaseDao implements UserDao {

	public int insert(User user) {
		String sql = "insert user (username, display_name, password, role_id) values(?,?,?,3)";
		Object[] params = {user.getName(), user.getDisplayName(), user.getPassword()};
		return this.executeUpdate(sql, params);
	}
    
	
	public int protectPassword(User user,String pwdanswer1,String pwdanswer2) {
		String sql = "update user set `pwdanswer1`= ? , `pwdanswer2`= ? where username = ?";
		return executeUpdate(sql, pwdanswer1, pwdanswer2,user.getName());
	}
	
	
	public int resetPassword(User user,String newPassword) {
		String sql = "update user set `password`= ? where username = ?";
		return executeUpdate(sql, newPassword, user.getName());
	}
	
	public int countUserByName(String name) {
		String sql = "select count(*) as user_count from user where username=?";
		Object[] params = {name};
		
		RSProcessor countUserByNameProcessor = new RSProcessor(){

			public Object process(ResultSet rs) throws SQLException {
				int count = 0;
				if(rs != null) {
					if(rs.next()) {
						count = rs.getInt("user_count");
					}
				}
				
				return new Integer(count);
			}

		};
		
		return (Integer)this.executeQuery(countUserByNameProcessor, sql, params);
	}
	
	public User findUserByName(String name) {
		String sql = "select * from user where username = ?";
		Object[] params = {name};

		RSProcessor getUserByNameProcessor = new RSProcessor(){

			public Object process(ResultSet rs) throws SQLException {
				User user = null;
				
				if(rs != null) {
					if(rs.next()) {
						int id = rs.getInt("id");
						String username = rs.getString("username");
						String displayName = rs.getString("display_name");
						String password = rs.getString("password");
						int role = rs.getInt("role_id");
						String pwdanswer1 = rs.getString("pwdanswer1");
						String pwdanswer2 = rs.getString("pwdanswer2");
						
						user = new User(id, username, displayName, password, role, pwdanswer1,pwdanswer2);
					}
				}
				
				return user;
			}

		};
		
		return (User)this.executeQuery(getUserByNameProcessor, sql, params);
	}

	public Vector<User> findUsersByName(String name) {
		String sql = "select * from user where username = ?";
		Object[] params = {name};

		RSProcessor getUsersByNameProcessor = new RSProcessor(){

			public Object process(ResultSet rs) throws SQLException {
				Vector<User> users = new Vector<User>();
				
				while(rs.next()) {
					int id = rs.getInt("id");
					String username = rs.getString("username");
					String displayName = rs.getString("display_name");
					String password = rs.getString("password");
					int role = rs.getInt("role_id");
					String pwdanswer1 = rs.getString("pwdanswer1");
					String pwdanswer2 = rs.getString("pwdanswer2");
					
					User user = new User(id, username, displayName, password, role , pwdanswer1,pwdanswer2);
					users.add(user);
				}
				
				return users;
				
			}

		};
		
		return (Vector<User>)this.executeQuery(getUsersByNameProcessor, sql, params);
	}
}
