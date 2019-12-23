<%@ page import="com.rainsia.news.biz.NewsBiz" %>
<%@ page import="com.rainsia.news.biz.impl.NewsBizImpl" %>
<%@ page import="com.rainsia.news.dao.impl.NewsDaoImpl" %>
<%@ page import="com.rainsia.news.dao.BaseDao" %>
<%@ page import="com.rainsia.news.dao.NewsDao" %>
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
<title>删除发表新闻页面</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

     <link rel="stylesheet" href="css/jquery-ui.min.css">
    <script type="text/javascript" src="js/jquery-1.12.4.js"></script>
    <script type="text/javascript"src="js/jquery-ui.js"></script> 
    <script type="text/javascript" src="js/delNews.js"></script>
    
    <script type="text/javascript">
		function go_back() {
			var previous = document.referrer;
			window.location.href=previous;
		}
	</script>
</head>

<body>

	<%
		request.setCharacterEncoding("UTF-8");
		
		String[] delid=request.getParameterValues("newsID");
		int id[] = new int[delid.length];
 		for(int i=0;i<delid.length;i++){
		    id[i] = Integer.parseInt(delid[i]);//转换String to int
		 }
		 
		try {
 			NewsBiz newsBiz = new NewsBizImpl();
  			for(int i=0;i<id.length;i++){
 				News newsdemo = newsBiz.getNewsById(id[i]);
			    if(! newsBiz.deleteNewsById( newsdemo.getId() ) ){
   	 %>
   	 				<div id="fali-info"></div>
   	 <% 	
				response.setHeader("refresh", "1;URL=delNews.jsp");
				return ; 
			}  
		 } //for%>
		 			<div id="success-info"></div>
	<% 
		 	response.setHeader("refresh", "1;URL=delNews.jsp");	  
				 
			}catch(Exception e) {
				request.setAttribute("message", e.getMessage());
				request.getRequestDispatcher("delNews.jsp").forward(
					request, response);
			}
	%> 
</body>
</html>
