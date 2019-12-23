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


public class Protectpassword extends HttpServlet {
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
        User user = (User)session.getAttribute("signin");
        String username = req.getParameter("username");
		String pwdanswer1 = req.getParameter("pwdanswer1");
		String pwdanswer2 = req.getParameter("pwdanswer2");
		
		System.out.println(pwdanswer1);
		System.out.println(pwdanswer2);

		if(username == null || username.equals("") ||  username.trim().isEmpty()){
			req.setAttribute("message1", "用户登录名不能为空！");
			req.getRequestDispatcher("protectpassword.jsp").forward(req,
					resp);
		}else if (pwdanswer1 == null || pwdanswer1.equals("") ||  pwdanswer1.trim().isEmpty() ) {
			req.setAttribute("message2", "问题一的答案不能为空！");
			req.getRequestDispatcher("protectpassword.jsp").forward(req,
					resp);
		}else if(pwdanswer2 == null || pwdanswer2.equals("") ||  pwdanswer2.trim().isEmpty()){
			req.setAttribute("message3", "问题二的答案不能为空！");
			req.getRequestDispatcher("protectpassword.jsp").forward(req,
					resp);
		}else if(!username.equals(user.getName())){
			req.setAttribute("message4", "用户登录名错误！");
			req.getRequestDispatcher("protectpassword.jsp").forward(req,
					resp);
		}
	    else {
			int count = new UserDaoImpl().countUserByName(username);
			if(count >= 1) {
				
				UserDao userDao = new UserDaoImpl();		
				int ret = userDao.protectPassword(user, pwdanswer1, pwdanswer2);
				
				if (ret > 0) {
					//out.println("<script type='text/javascript'>"
						//	+ "alert('设置成功，进入首页！');"
							//+ "location.href='index.jsp';"
							//+ "</script>");
					req.setAttribute("message7", "设置成功，进入首页！");
					req.getRequestDispatcher("index.jsp").forward(
							req, resp);
					
					//response.sendRedirect("login.jsp");
				} else {
					//System.out.println("1");
					req.setAttribute("message5", "设置未成功，请重新操作！");
					req.getRequestDispatcher("protectpassword.jsp").forward(
							req, resp);
				} 
				
			} else {
				System.out.println("2");
				req.setAttribute("message6", "设置未成功，请重新操作！");
				req.getRequestDispatcher("protectpassword.jsp").forward(req,
						resp);  
			}
		}
		
	}
}
