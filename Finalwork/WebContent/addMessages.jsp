<%@ page import="com.rainsia.news.entity.Messages" %>
<%@ page import="com.rainsia.news.entity.User" %>
<%@ page import="com.rainsia.news.biz.MessagesBiz" %>
<%@ page import="com.rainsia.news.biz.impl.MessagesBizImpl" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
User user = (User)session.getAttribute("login");
if(user == null)  {
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
</html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Creative - Bootstrap Portfolio Theme</title>
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
  <!-- theme stylesheet-->
  <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
  <!-- Custom stylesheet - for your changes-->
  <link rel="stylesheet" href="css/custom.css">
  <!-- Favicon-->
  <link rel="shortcut icon" href="img/favicon.png">
  
  <!-- Tweaks for older IEs--><!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
</head>
<body>
  <div id="all">
    <div class="container-fluid">
      <div class="row row-offcanvas row-offcanvas-left"> 
       <jsp:include page="header.jsp"></jsp:include>
        <!--   *** DETAIL ***-->
        <div class="col-md-8 col-lg-9 content-column white-background">
          <div class="small-navbar d-flex d-md-none">
            <button type="button" data-toggle="offcanvas" class="btn btn-outline-primary"> <i class="fa fa-align-left mr-2"></i>Menu</button>
            <h1 class="small-navbar-heading"> <a href="index.html">Creative </a></h1>
          </div>
          <div class="row">
            <div class="col-lg-8">
              <div class="content-column-content">
                <h1>发表留言</h1>
                <p>你可以在此处发表你的看法</p>
                <form id="contact-form" method="post" action="doAddMessages.jsp" class="contact-form form">
                  <div class="controls">
                    <div class="form-group">
                      <label for="message">主题：</label>
                      <textarea rows="1" name="title" id="message" required="required" class="form-control"></textarea>
                      <label for="message">内容：</label>
                      <textarea rows="4" name="content" id="message" required="required" class="form-control"></textarea>
                    </div>
                    <div>
                      <input type="submit" value="发布" class="btn btn-outline-primary">
                    </div>
                  </div>
                </form>
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
</body>