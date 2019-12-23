<%@ page import="com.rainsia.news.entity.News" %>
<%@ page import="com.rainsia.news.entity.User" %>
<%@ page import="com.rainsia.news.biz.NewsBiz" %>
<%@ page import="com.rainsia.news.biz.impl.NewsBizImpl" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>新闻详情</title>
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
  <link rel="stylesheet" href="css/mine.detail.css">
  <!-- Favicon-->
  <link rel="shortcut icon" href="img/favicon.png">
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
            <h1 class="small-navbar-heading"> <a href="index.jsp">Creative </a></h1>
          </div>
          <div class="row">
            <div class="col-xl-10">
              <div class="content-column-content">
           <%
				String strId = request.getParameter("id");
              	String content=request.getParameter("content");
				try{
					int id = Integer.parseInt(strId);
					NewsBiz newsBiz = new NewsBizImpl();
					News news = newsBiz.getNewsById(id);
					News cnews=newsBiz.getNewsByContent(content);
					if(news == null&&cnews == null) {
			%>
						<p>非法的新闻id。</p>
			<%
						return ;
					} else {
			%>
				
                <h1><%= news.getTitle() %></h1>
                <p>
                	by：<%= news.getAuthor() %>
					<br><%= news.getCreateDate() %>
			 	</p>
                <p class="lead">
                <div class="clearfix">
                  <div class="detail_picture">
                    <img src="img/about.jpg" alt="">
                  </div>
                  <div class="detail_message">
                    <p><%= news.getContent() %></p>
            <%
					}
				} catch (Exception e) {
			%>
					<p>非法的新闻id。</p>
			<%
					return ;
				}
			%>
                  </div>
                </div>
                <blockquote class="blockquote">
                  <p>新闻推荐：</p>
                  <p class="mb-0">
                    <ol>
                      <li><a href="detail.jsp?id=10">撒贝宁妻子诞下龙凤胎 晒照宣布喜讯</a></li>
                      <li><a href="detail.jsp?id=14">五月天阿信曝团员"妻小成群" 石头傻眼：有点奇怪</a></li>
                    </ol>
                  </p>
                </blockquote>
                <h2>评论</h2>
                <p>请各位网友发表评论时，注意文明发言</p>
                <ul>
                  <li>
                    <p>网友一：</p>
                    <p>Lorem ipsum dolor sit amet.</p>
                  </li>
                  <li>
                    <p>网友二：</p>
                    <p>Lorem ipsum dolor sit amet.</p>
                  </li>
                  <li>
                    <p>网友三：</p>
                    <p>Lorem ipsum dolor sit amet.</p>
                  </li>
                  <li>
                    <p>网友四：</p>
                    <p>Lorem ipsum dolor sit amet.</p>
                  </li>
                </ul>
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
</html>