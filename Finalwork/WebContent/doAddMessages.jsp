<%@ page import="com.rainsia.news.biz.MessagesBiz" %>
<%@ page import="com.rainsia.news.biz.impl.MessagesBizImpl" %>
<%@ page import="com.rainsia.news.entity.User" %>
<%@ page import="com.rainsia.news.entity.Messages" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<%
User user = (User)session.getAttribute("login");
if(user == null)  {
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
<title>处理新添留言</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
</head>

<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int userId = user.getId();
		
		try {
			MessagesBiz messagesBiz = new MessagesBizImpl();
			Messages messages = new Messages(title, content);
			if(messagesBiz.addMessages(messages, userId)) {
				response.sendRedirect("listMessages.jsp");
				return ; 
			} else {
				request.getRequestDispatcher("addMessagesFail.jsp").forward(
						request, response);
				return ;
			}
		} catch(Exception e) {
			request.setAttribute("message", e.getMessage());
			request.getRequestDispatcher("addMessagesFail.jsp").forward(
				request, response);
		}
	%>
</body>
</html>
