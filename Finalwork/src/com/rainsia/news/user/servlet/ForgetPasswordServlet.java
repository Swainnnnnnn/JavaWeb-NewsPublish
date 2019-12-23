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


public class ForgetPasswordServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		super.doGet(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		req.setCharacterEncoding("UTF-8");
        String username = req.getParameter("username");
		String pwdanswer1 = req.getParameter("pwdanswer1");
		String pwdanswer2 = req.getParameter("pwdanswer2");
		
		
		
		if(username==null|| pwdanswer1 == null || pwdanswer2 == null) {
			req.setAttribute("msg1", "未输入用户登录名或问题一答案或问题二答案！");
			req.getRequestDispatcher("forgetpassword.jsp").forward(
				req, resp);
		} else if(username.trim().isEmpty() || pwdanswer1.trim().isEmpty() || pwdanswer2.trim().isEmpty()) {
			req.setAttribute("msg2", "未输入用户登录名或问题一答案或问题二答案！");
			req.getRequestDispatcher("forgetpassword.jsp").forward(
				req, resp);
		} 
		else {
			User user = new UserDaoImpl().findUserByName(username);
			//System.out.println(user.getName());
			//System.out.println(user.getPassword());
			//System.out.println(user.getPwdanswer1());
			
			
			if(user == null || !user.getPwdanswer1().equals(pwdanswer1) || !user.getPwdanswer2().equals(pwdanswer2) ) {
				//System.out.println(user.getName());
				req.setAttribute("msg3", "用户登录名或问题一答案或问题二答案，请重新输入！");
				req.getRequestDispatcher("forgetpassword.jsp").forward(
					req, resp);
				
				
			} else {
				session.setAttribute("success", user);
				req.setAttribute("msg4", "成功获取原密码！");
				req.getRequestDispatcher("log_sign_in.jsp").forward(req,
						resp);
				
			}
		}
		
	}
}
