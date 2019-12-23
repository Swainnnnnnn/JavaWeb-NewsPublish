package com.rainsia.news.user.servlet;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rainsia.news.dao.impl.UserDaoImpl;
import com.rainsia.news.entity.User;


public class SigninServlet extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doGet(req, resp);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		
		HttpSession session = req.getSession();
		
	
		String name = req.getParameter("username");
		String pwd = req.getParameter("password");
		String displayName = req.getParameter("display_name");
		
		//System.out.println(name);
		//System.out.println(pwd);
		String con_password = req.getParameter("con_password");
		String display_name = req.getParameter("display_name");

		if (name == null || name.equals("") ||  name.trim().isEmpty() ) {
			req.setAttribute("message4", "用户登录名不能为空！");
			req.getRequestDispatcher("log_sign_in.jsp").forward(req,
					resp);
		}
		else if (pwd == null || pwd.equals("") || pwd.trim().isEmpty()) {
			req.setAttribute("message6", "密码不能为空！");
			req.getRequestDispatcher("log_sign_in.jsp").forward(req,
					resp);
		} else if (!con_password.equals(pwd)) {
			req.setAttribute("message7", "两次输入的密码不一致！");
			req.getRequestDispatcher("log_sign_in.jsp").forward(req,
					resp);
		}else if(display_name == null || display_name.equals("") ||  display_name.trim().isEmpty()){
			req.setAttribute("message5", "用户显示名不能为空！");
			req.getRequestDispatcher("log_sign_in.jsp").forward(req,
					resp);
		} 
		else {
			int count = new UserDaoImpl().countUserByName(name);
			if(count >= 1) {
				req.setAttribute("message8", "用户登录名已存在，请重新注册！");
				req.getRequestDispatcher("log_sign_in.jsp").forward(req,
						resp);
				

				
			} else {
				
				User newUser = new User(name,displayName, pwd) ;

				
				int result = new UserDaoImpl().insert(newUser);
				
				
				if (result > 0) {
					req.setAttribute("message9", "注册成功，设置密保问题！");
					req.getRequestDispatcher("protectpassword.jsp").forward(
							req, resp);
					
					session.setAttribute("signin", newUser);
					
					//response.sendRedirect("login.jsp");
				} else {
					req.setAttribute("message10", "注册失败，请重新注册！");
					req.getRequestDispatcher("log_sign_in.jsp").forward(
							req, resp);
				}
			}
		}
		
		

	}
	
	
}
