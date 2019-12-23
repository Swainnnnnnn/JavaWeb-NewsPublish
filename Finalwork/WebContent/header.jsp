<%@ page import="com.rainsia.news.biz.NewsBiz" %>
<%@ page import="com.rainsia.news.biz.impl.NewsBizImpl" %>
<%@ page import="com.rainsia.news.entity.User" %>
<%@ page import="com.rainsia.news.entity.News" %>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
 <meta charset="utf-8">
</head>
<body>
	<!--   *** SIDEBAR ***-->
        <div id="sidebar" class="col-md-4 col-lg-3 sidebar-offcanvas">
          <div class="sidebar-content">
            <h1 class="sidebar-heading"> <a href="index.jsp">新闻</a></h1>
            <%
            	User user = (User)session.getAttribute("login");
            	if ( user == null ){
            %>
           			<p class="sidebar-p">欢迎大家浏览本站！ </p>
            		<p class="sidebar-p">本网站会为大家提供最新的娱乐新闻 </p>
            <% 
            	}else{
            		if ( user.getRole() == 3){	
            %>
           				<p class="sidebar-p">欢迎<%=user.getName() %>浏览本站！ </p>
            			<p class="sidebar-p">本网站会为您提供最新的娱乐新闻 </p>
            <%   
            		}else{
            %>
          				<p class="sidebar-p">欢迎<%=user.getName() %>浏览本站！ </p>
            			<p class="sidebar-p">您可以在此进行新闻管理和评论管理 </p>
            <%      			
            		}
            	}
            %>
            
            <ul class="sidebar-menu">
            
            
                <!-- show always-->
                <li class="sidebar-item"><a href="index.jsp" class="sidebar-link active">新闻</a></li> 
                
                <!-- show always-->  
                                           
                <%  
                	if ( user == null){ 
                %>
                
                	<!-- show up when do not login-->
                	<li class="sidebar-item"><a href="log_sign_in.jsp" class="sidebar-link">登录/注册</a></li>
                
				<% 
					}else{
						if (user.getRole() == 3){
				%>
							<!-- show up when user login-->
                			<li class="sidebar-item"><a href="comment.jsp" class="sidebar-link">评论</a></li>
                <%               
						}else{
				%>
							<!-- show up when administrator login-->
                			<li class="sidebar-item"><a href="news_manage.jsp" class="sidebar-link">管理新闻</a></li>
                
                			<!-- show up when administrator login-->
                			<li class="sidebar-item"><a href="#" class="sidebar-link">管理评论</a></li>
				<% 
						}
				%>
					<!-- show up when login-->
                	<li class="sidebar-item"><a href="changepassword.jsp" class="sidebar-link">修改密码</a></li>
                
                	<!-- show up when login-->
                	<li class="sidebar-item"><a href="logout.action" class="sidebar-link">退出登录</a></li>
                
               	 	<!-- show up when login-->
                	<li class="sidebar-item"><a href="#" class="sidebar-link">注销账号</a></li>
				<% 
					}
				%>
                
                
                <!-- show always-->
                <li class="sidebar-item"><a href="listMessages.jsp" class="sidebar-link">留言板</a></li>  
                <li class="sidebar-item"><a href="about.html" class="sidebar-link">关于网站</a></li>                
 		        
            </ul>
            <div>
            	<p class="sidebar-p">搜索新闻 </p>     			
            	<form id="search_form" method="post" action="dosearch.jsp" class="search-form"/>
                 	<input type="text" id="word" required="required" name="word" onblur="if(this.value=='')this.value=this.defaultValue;" onfocus="if(this.value==this.defaultValue)this.value='';" value="Search" class="search-text" />
		    	</form>
            </div>
          </div>
        </div>
        <!--   *** SIDEBAR END ***  -->
</body>
</html> 