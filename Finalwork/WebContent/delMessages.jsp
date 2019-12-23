<%@ page import="com.rainsia.news.biz.MessagesBiz" %>
<%@ page import="com.rainsia.news.biz.impl.MessagesBizImpl" %>
<%@ page import="com.rainsia.news.entity.User" %>
<%@ page import="com.rainsia.news.entity.Messages" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>删除留言</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
</head>

<body>
	<%
	    String strId = request.getParameter("id");
		
		try {
			int id = Integer.parseInt(strId);
			MessagesBiz messagesBiz = new MessagesBizImpl();
			if(messagesBiz.delMessages(id)) {
				response.sendRedirect("listMessages.jsp");
				return ; 
			} else {
				request.getRequestDispatcher("delMessagesFail.jsp").forward(
						request, response);
				return ;
			}
		} catch(Exception e) {
			request.setAttribute("message", e.getMessage());
			request.getRequestDispatcher("delMessagesFail.jsp").forward(
				request, response);
		}
	%>
</body>
</html>
