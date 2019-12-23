package com.rainsia.news.user.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rainsia.news.entity.User;


public class SigninFilter implements Filter {
	
	private static final String LOGIN_PATH = "LOGIN_PATH";    //显示登录页面  
    private String loginPath;  

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpReq = (HttpServletRequest) req;
		HttpServletResponse httpResp = (HttpServletResponse) resp;
		
		HttpSession session = httpReq.getSession();
		
		User user = (User)session.getAttribute("signin");

		
		if(user == null ) {
			req.setAttribute("message12", "禁止非法访问！");
			req.getRequestDispatcher(loginPath).forward(httpReq, httpResp);
		}
		
		
		chain.doFilter(req, resp);
	}

	@Override
	public void init(FilterConfig conf) throws ServletException {
		loginPath = conf.getInitParameter("LOGIN_PATH");
	}

	@Override
	public void destroy() {
		
	}

}

