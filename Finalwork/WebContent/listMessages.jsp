<%@ page import="com.rainsia.news.entity.Messages" %>
<%@ page import="com.rainsia.news.entity.User" %>
<%@ page import="com.rainsia.news.biz.MessagesBiz" %>
<%@ page import="com.rainsia.news.biz.impl.MessagesBizImpl" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
  <link rel="stylesheet" href="css/list_messages_style.css">
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
                <div class="header_01">
                  <h1>留言板</h1>
                </div>
                <%
                  MessagesBiz messagesBiz = new MessagesBizImpl();
                  List<Messages> listMessages = messagesBiz.getAllMessages();
                  if(listMessages == null || listMessages.size() == 0) {
                %>
                    <p>
                      暂无留言。
                    </p>
                <%
                  } else { 
                %>
                    <div id="listmessages">
                      <%
                      for(Messages messages : listMessages) {
                      %>
                      <div class='msgBox'>
                      <div class="headUrl">
                        <img src='img/010.jpg' width='50' height='50'>
                        <div>
                          <span class="title"> <%= messages.getAuthor() %></span>
                          <span class="time"><%= messages.getCreateDate()%></span>
                        </div>
                        <%
                          User user = (User)session.getAttribute("login");
                          if(user != null) {
                          if(user.getRole() == 1 || user.getRole() == 2) {
                        %>
                          <a class="del" href="delMessages.jsp?id=<%= messages.getId() %>">删除</a>
                        <%
                             }
                          }
                        %>  
                      </div>
                      <div class='msgTxt'>
                        <%= messages.getContent() %>
                      </div>
                      </div>
                      <%
                      }
                    %>  
                  </div>
                <%
                  }
                %>  
              </div>
              <div id="delbutton" class="button_02">
                <a href="addMessages.jsp">添加留言</a>
              </div>
              <div class="cleaner"></div>
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
