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
<title>处理编辑新闻页面</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

    <link rel="stylesheet" href="css/jquery-ui.min.css">
    <script type="text/javascript" src="js/jquery-1.12.4.js"></script>
    <script type="text/javascript"src="js/jquery-ui.js"></script> 
    <script type="text/javascript" src="js/editNews.js"></script>
</head>

<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String strID = request.getParameter("id");
		int newsid = Integer.parseInt(strID);
		
		try {
			NewsBiz newsBiz = new NewsBizImpl();
			if(newsBiz.updateEditNews(newsid, title, content)) {
		%>
	            <div id="success-info" >
			    </div>		
		<% 		
/* 				response.sendRedirect("addNewsSuccess.jsp"); */
/*                    response.sendRedirect("listNews.jsp");  */  
 					response.setHeader("refresh","1;URL=editNews.jsp"); 
				return ; 
			} else {
		%>
	            <div id="fail-info" >
			    </div>					
        <% 
/* 				request.getRequestDispatcher("addNewsFail.jsp").forward(
						request, response); */
						response.setHeader("refresh","1;URL=editNews.jsp"); 
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




