<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.rainsia.news.entity.User" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<!--   *** SIDEBAR ***-->
       <div id="sidebar" class="col-md-4 col-lg-3 sidebar-offcanvas">
          <div class="sidebar-content">
            <h1 class="sidebar-heading"> <a href="index.jsp">新闻</a></h1>
            
            <% 
            	User user = (User)session.getAttribute("login");  
            	if (user != null){
            %>
            		<p class="sidebar-p">欢迎<%=user.getName() %>浏览本站！ </p>            
            		<p class="sidebar-p">您可以在此进行新闻管理和评论管理 </p>
            
            <% 
            	}
            %>
            <ul class="sidebar-menu">
                <!-- Link-->
                <li class="sidebar-item"><a href="index.jsp" class="sidebar-link">新闻</a></li>
                <!-- Link-->
                <li class="sidebar-item"><a href="#" class="sidebar-link active">新闻列表</a></li>
                <!-- Link-->
                <li class="sidebar-item"><a href="addNews.jsp" class="sidebar-link">发布新闻</a></li>
                <!-- Link-->
                <li class="sidebar-item"><a href="editNews.jsp" class="sidebar-link">修改新闻</a></li>
                <!-- Link-->
                <li class="sidebar-item"><a href="delNews.jsp" class="sidebar-link">删除新闻</a></li>
                <!-- Link-->
                <li class="sidebar-item"><a href="about.html" class="sidebar-link">关于本站</a></li>
                
            </ul>
            <p class="social"><a href="#" data-animate-hover="pulse" class="external facebook"><i class="fa fa-facebook"></i></a><a href="#" data-animate-hover="pulse" class="external gplus"><i class="fa fa-google-plus"></i></a><a href="#" data-animate-hover="pulse" class="external twitter"><i class="fa fa-twitter"></i></a><a href="#" title="" class="external instagram"><i class="fa fa-instagram"></i></a><a href="#" data-animate-hover="pulse" class="email"><i class="fa fa-envelope"></i></a></p>
          </div>
        </div>
        <!--   *** SIDEBAR END ***  -->
       
</body>
</html>