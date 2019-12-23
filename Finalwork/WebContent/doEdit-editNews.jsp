<%@ page import="com.rainsia.news.entity.News" %>
<%@ page import="com.rainsia.news.entity.User" %>
<%@ page import="com.rainsia.news.biz.NewsBiz" %>
<%@ page import="com.rainsia.news.biz.impl.NewsBizImpl" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


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
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
  <base href="<%=basePath%>">
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>修改新闻</title>
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="robots" content="all,follow">
  <!-- Bootstrap CSS-->
  <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome CSS-->
  <link rel="stylesheet" href="vendor/font-awesome/css/font-awesome.min.css">
  <!-- Google fonts - Roboto-->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,300,700,400italic">
  <!-- owl carousel-->
  <link rel="stylesheet" href="vendor/owl.carousel/assets/owl.carousel.css">
  <link rel="stylesheet" href="vendor/owl.carousel/assets/owl.theme.default.css">
  <link rel="stylesheet" href="css/news_manage/publishNews.css">
  <!-- theme stylesheet-->
  <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
  <!-- Custom stylesheet - for your changes-->
  <link rel="stylesheet" href="css/custom.css">
  <!-- Favicon-->
  <link rel="shortcut icon" href="img/favicon.png">
</head>
<body>
 <div id="all">
    <div class="container-fluid">
      <div class="row row-offcanvas row-offcanvas-left"> 
        
        <jsp:include page="header_manage_news.jsp"></jsp:include>
        
        <!--   *** DETAIL ***-->
        <div class="col-md-8 col-lg-9 content-column white-background">
          <div class="small-navbar d-flex d-md-none">
            <button type="button" data-toggle="offcanvas" class="btn btn-outline-primary"> <i class="fa fa-align-left mr-2"></i>Menu</button>
            <h1 class="small-navbar-heading"> <a href="index.html">Creative </a></h1>
          </div>
          
          <div class="manage_title">
              <div class="manage_title_content">
                  <div id="div1">修改新闻</div>
                  <div><p>管理新闻>修改新闻</p></div>
          </div>

          <div class="add_news" id="add_news1">

            <div class="add_news_title">
               <div><p>Edit ： News-info</p></div>
            </div>

            <div class="add_news_wrapper">
   			<%
				String strId = request.getParameter("newsID");
				int id = Integer.parseInt(strId);
				NewsBiz newsBiz = new NewsBizImpl();
				News news = newsBiz.getNewsById(id);
				String userdisplayname = user.getDisplayName();

				if(news.getAuthor().equals(userdisplayname)){
					
			%>
                <form id="contact-form" method="post" action="doEditNews.jsp"  class="contact-form form">
                    <table id="publish_news-info">
                    <tr>
 				    	<td>作者：</td>
				    	<td><p><%=news.getAuthor() %></p></td>
				    <tr>
                      <tr>
                        <td><label for="name">新闻标题：</label></td>
                        <td><input type="text" name="title" id="title" required="required" class="form-control" value="<%=news.getTitle() %>"></td>
                      </tr>

                      <tr>
                        <td><label for="message">新闻内容：</label></td>
                        <td><textarea rows="4" cols="10"  name="content" id="content" required="required" class="form-control" value="<%=news.getContent() %>"><%=news.getContent() %></textarea></td>
                      </tr>
               		<tr><td><input type="text" id="id" name="id" value="<%=news.getId() %>" hidden/></td> </tr>
                  </table> 
                    <input type="submit" value="提交" id="submit" name="submit" class="btn btn-outline-primary btn-add">
                </form>
                
            <%
				}else{		
			%>
					<div id="eidt-right"></div>
			<%
 						request.getRequestDispatcher("editNews.jsp").forward(
													request, response);  
				}
			%>
            </div>

          </div>
        </div>
      </div>
    </div>
  </div>
  </div>
  <!-- JavaScript files-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/popper.js/umd/popper.min.js"> </script>
  <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
  <script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
  <script src="vendor/owl.carousel/owl.carousel.min.js"></script>
  <script src="vendor/masonry-layout/masonry.pkgd.min.js"></script>
  <script src="js/front.js"></script>
  <script type="text/javascript" src="js/editNews.js"></script>
</body>
</html>