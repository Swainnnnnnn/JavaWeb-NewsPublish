package com.rainsia.news.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rainsia.news.dao.UserDao;
import com.rainsia.news.dao.impl.UserDaoImpl;
import com.rainsia.news.entity.User;


public class ChangePassword extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		super.doGet(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		User user = (User)session.getAttribute("login");
		String relPassword = user.getPassword();
		String username = req.getParameter("username");
		
		
		String password1 = req.getParameter("password1");
		String password2 = req.getParameter("password2");
		String confirmpasswd = req.getParameter("confirm-paasword");
		
		//System.out.println(confirmpasswd);
		
		
		if(username.equals(user.getName()) || password1.equals(relPassword)){
			if(password2 == null || password2.trim().equals("")) {
				
				//System.out.println("1");
				req.setAttribute("error2", "新密码不能为空！");
				req.getRequestDispatcher("changepassword.jsp").forward(req, resp);
				return;
			}
			
			if(confirmpasswd == null || confirmpasswd.trim().equals("")) {
				//System.out.println("2");
				req.setAttribute("error3", "重复密码不能为空！");
				req.getRequestDispatcher("changepassword.jsp").forward(req, resp);
				return;
			}
			
			if(!password2.equals(confirmpasswd)){
				//System.out.println("3");
				req.setAttribute("error4", "两次输入不一致！");
				req.getRequestDispatcher("changepassword.jsp").forward(req, resp);
				return;
			}else {
				UserDao userDao = new UserDaoImpl();		
				int ret = userDao.resetPassword(user, password2);
				//System.out.println(ret);
				if(ret==1){
					//System.out.println("f4");
					req.setAttribute("successMsg", "密码修改成功，返回首页！");
					req.getRequestDispatcher("index.jsp").forward(req, resp);
					//System.out.println("123");
					
					return;
				}else {
					//System.out.println("5");
					req.setAttribute("error5", "修改失败！");
					req.getRequestDispatcher("changepassword.jsp").forward(req, resp);
					return;
				}
			}
		}else {
			
			//System.out.println("6");
			req.setAttribute("error1", "用户登录名或原密码输入错误！");
			req.getRequestDispatcher("changepassword.jsp").forward(req, resp);
			return;
		}
		
	}
}
