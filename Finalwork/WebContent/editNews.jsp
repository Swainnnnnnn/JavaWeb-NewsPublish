<%@ page import="com.rainsia.news.entity.News" %>
<%@ page import="com.rainsia.news.entity.User" %>
<%@ page import="com.rainsia.news.biz.NewsBiz" %>
<%@ page import="com.rainsia.news.biz.impl.NewsBizImpl" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
  <title>编辑新闻</title>
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
  <!-- <link rel="stylesheet" href="css/news_manage/publishNews.css"> -->
  <link rel="stylesheet" href="css/news_manage/updateNews.css">
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
        
        <jsp:include page="header_manage_news.jsp"></jsp:include>
        <!--   *** SIDEBAR END ***  -->
        <!--   *** DETAIL ***-->
        <div class="col-md-8 col-lg-9 content-column white-background">
          <div class="small-navbar d-flex d-md-none">
            <button type="button" data-toggle="offcanvas" class="btn btn-outline-primary"> <i class="fa fa-align-left mr-2"></i>Menu</button>
            <h1 class="small-navbar-heading"> <a href="index.html">Creative </a></h1>
          </div>

          <div class="manage_title">
              <div class="manage_title_content">
                  <div id="div1">编辑新闻</div>
                  <div><p>管理新闻>编辑新闻</p></div>
          </div>

          <div class="del_news" id="del_news1">

            <div class="del_news_title">
               <div><p>Choose ： edit-News</p></div>
            </div>
            
            <div class="del_news_wrapper">
			<%
				NewsBiz newsBiz = new NewsBizImpl();
				List<News> listNews = newsBiz.getAllNews();
				if(listNews == null || listNews.size() == 0) {
			%>
					<p>
						没有新闻，无法编辑。
					</p>
			<%
				} else {
			%>

              <form id="del_newslist" action="doEdit-editNews.jsp" method="post" class="clearfix">
              <%
                  for(News news : listNews) {
              %>                 
                
                <div class="newslist_news clearfix">
                  <div class="checkbox-id">
                    <input class="checkbox-id" type="radio" name="newsID" id="" value="<%= news.getId() %>">
                  </div>

                  <div class="newslist_news_wrapper clearfix">
                    <div id="news_id"><p><%= news.getId() %></p></div>

                    <div id="news-info">
                        <div id="news_title">
                          <a href="detail.jsp?id=<%= news.getId() %>"><%= news.getTitle() %></a>
                        </div>
                        <div id="news_content">
                          <div><%= news.getContent() %></div>
                        </div>
                        <div id="news_date">
                          <p><%=news.getCreateDate() %></p>
                        </div>
                    </div>

                  </div>

                </div>
                <%						
                    }
                  %>
                   <input id="btn-delnews" type="submit" value="编辑"/>
                <%
					}		
                %>
               
              </form>

            </div><!--delnews wrapper-->

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