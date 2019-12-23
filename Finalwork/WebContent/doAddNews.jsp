<%@ page import="com.rainsia.news.biz.NewsBiz" %>
<%@ page import="com.rainsia.news.biz.impl.NewsBizImpl" %>
<%@ page import="com.rainsia.news.entity.User" %>
<%@ page import="com.rainsia.news.entity.News" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
	User user = (User)session.getAttribute("login");
	if(user != null) {
		if(user.getRole() == 1 || user.getRole() == 2) {
			
		} else {
			response.sendRedirect("index.jsp");
			return ;
		}
	} else {
		response.sendRedirect("index.jsp");
		return ;
	}
%> 

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>处理发表新闻页面</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

     <link rel="stylesheet" href="css/jquery-ui.min.css">
    <script type="text/javascript" src="js/jquery-1.12.4.js"></script>
    <script type="text/javascript"src="js/jquery-ui.js"></script> 
    <script type="text/javascript" src="js/addNews.js"></script>
</head>

<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int userId = user.getId();
		
		try {
			NewsBiz newsBiz = new NewsBizImpl();
			News news = new News(title, content);
			if(newsBiz.addNews(news, userId)) {
		%>
	            <div id="success-info" >
			    </div>		
		<% 		  
 					response.setHeader("refresh","1;URL=news_manage.jsp"); 
				return ; 
			} else {
		%>
	            <div id="fail-info" >
			    </div>					
        <% 
				response.setHeader("refresh","1;URL=news_manage.jsp"); 
				return ;
			}
		} catch(Exception e) {
			request.setAttribute("message", e.getMessage());
			request.getRequestDispatcher("news_manage.jsp").forward(
				request, response);
		}
	%>
</body>
</html>




