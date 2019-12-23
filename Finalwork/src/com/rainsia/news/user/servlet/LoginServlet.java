package com.rainsia.news.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rainsia.news.dao.impl.UserDaoImpl;
import com.rainsia.news.entity.User;

public class LoginServlet extends HttpServlet {
	
	@Override
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
		
		
		if(name == null || pwd == null) {
			req.setAttribute("message1", "未输入用户名或者密码！");
			req.getRequestDispatcher("log_sign_in.jsp").forward(
				req, resp);
		} else if(name.trim().isEmpty() || pwd.trim().isEmpty()) {
			req.setAttribute("message2", "未输入用户名或者密码！");
			req.getRequestDispatcher("log_sign_in.jsp").forward(
				req, resp);
		} else {
			User user = new UserDaoImpl().findUserByName(name);
			if(user == null || !user.getPassword().equals(pwd)) {
				req.setAttribute("message3", "用户名或密码错误，请重新登录！");
				req.getRequestDispatcher("log_sign_in.jsp").forward(
					req, resp);
			} else {
				
				//记住密码
	   	        String[] isUseCookies = req.getParameterValues("rememberme");
				if(isUseCookies != null && isUseCookies.length>0){
					String username11 = req.getParameter("username");  
					String password22 = req.getParameter("password");
					
					//System.out.println(username11+"8888");
					//System.out.println(password22+"9999");
					
					//使用Cookies对象保存字符串
					Cookie usernameCookie = new Cookie("username",username11);
					Cookie passwordCookie = new Cookie("password",password22);
					
					usernameCookie.setMaxAge(864000); 
				    passwordCookie.setMaxAge(864000);
					
					
					resp.addCookie(usernameCookie);
					resp.addCookie(passwordCookie);
			   	}else{
			   		Cookie[] cookies = req.getCookies(); 
			        if (cookies!=null && cookies.length>0){
			             for (Cookie c:cookies){
			                 if (c.getName().equals("username") || c.getName().equals("password")){ 
			                    c.setMaxAge(0);  //设置Cookie失效
			                    resp.addCookie(c); //重新保存 
			                } 
			            }
			         }
			   	}
				
				
				session.setAttribute("login", user);
				resp.sendRedirect("index.jsp");
			}
		}
		
	}
}
