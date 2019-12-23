<%@ page import="com.rainsia.news.biz.NewsBiz" %>
<%@ page import="com.rainsia.news.biz.impl.NewsBizImpl" %>
<%@ page import="com.rainsia.news.entity.User" %>
<%@ page import="com.rainsia.news.entity.News" %>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
<title>搜索结果</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/syqreset.css" type="text/css" media="all" />
    <link rel="stylesheet" href="css/syqstyle.css" type="text/css" media="screen" />

    <script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="js/jquery.nivo.slider.pack.js"></script>
    <script type="text/javascript" src="js/jquery.carouFredSel-5.6.2.js"></script>
    <script type="text/javascript" src="js/jquery.prettyPhoto.js"></script>
    <script type="text/javascript" src="js/jquery.sticky.js"></script>
    <script type="text/javascript" src="js/jquery-scroller-v1.min.js"></script>
    <script type="text/javascript" src="js/kendo.web.min.js"></script>
    <script type="text/javascript" src="js/custom.js"></script>
</head>

	<%
				request.setCharacterEncoding("UTF-8"); 
				String word = request.getParameter("word");
				String or = request.getParameter("or"); 
				String ti = request.getParameter("ti"); 
				String co = request.getParameter("co"); 
/* 				if(word == null){
					word="a";
				}
				
				if(order == null){
					order="new.id";
				} */
			
				NewsBiz newsBiz = new NewsBizImpl();
				/* List<News> listNews = newsBiz.query(word); */
			 	List<News> listNews = newsBiz.query(word,or,ti,co); 
				
				
		%>

<body class="sub-1sidebar">

    <div id="header-bottom">
        <div class="wrapper clearfix">

            <div class="sub-search-box clearfix">
                <form id="search_form" method="post" action="dosearch.jsp" class="search-form" />
		                <input type="text" id="word" required="required" name="word" onblur="if(this.value=='')this.value=this.defaultValue;" onfocus="if(this.value==this.defaultValue)this.value='';" value="Search" class="search-text" />
		                <input id="submit" type="submit" value="" name="submit" class="search-submit" />
                </form>

            </div>

        </div>

    </div>

    <div id="navigation">
        <nav id="secondary-menu" class="wrapper clearfix">
            <ul class="clearfix" id="main-nav">
                <li><a href="dosearch.jsp?ti=title&word=<%=request.getParameter("word")%>">仅标题</a></li>
                
                  <li><a href="dosearch.jsp?co=connent&word=<%=request.getParameter("word")%>">仅内容</a></li>

                <li>
                    <a href="dosearch.jsp?or=date&word=<%=request.getParameter("word")%>">最新发布</a>
                </li>
                
                <li><a href="#">相关度</a></li>

                <li><a href="#">发布时间</a>
                    <ul>
                        <li><a href="#">一天以内</a></li>
                        <li><a href="#">一周以内</a></li>
                        <li><a href="#">一月以内</a></li>
                        <li><a href="#">一年以内</a></li>
                    </ul>
                </li>

                <li><a href="#">频道</a>
                    <ul>
                        <li><a href="#">国内</a></li>
                        <li><a href="#">国际</a></li>
                        <li><a href="#">经济</a></li>
                        <li><a href="#">旅游</a></li>
                        <li><a href="#">三农</a></li>
                        <li><a href="#">体育</a></li>
                        <li><a href="#">艺术</a></li>
                        <li><a href="#">健康</a></li>
                        <li><a href="#">科教</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
    </div>
    
				
	    <div class="wrapper">
	        <div id="main-content">
	            <div class="primary">
	                <section>
                    
					
					
			<%
					for(News news : listNews) {
						
			%>
					<article class="entry-item box-hover clearfix">
						<a href="detail.jsp?id=<%= news.getId() %>"><img class="hover-effect responsive-img" src="img/244x117/244x117-6.jpg" alt="" /></a>
 						<div class="entry-content">
 						 <span class="entry-category">in:&nbsp;</span>
 						  <a class="entry-category" href="#">Fashion</a><span class="entry-date">&nbsp;&nbsp;|&nbsp;&nbsp;<%= news.getCreateDate() %></span>
	                        <h3 class="entry-title"><a href="detail.jsp?id=<%= news.getId()%>"><%= news.getTitle() %></a></h3>
 							<p><%= news.getContent() %></p>
                      	    <span class="entry-author">by:&nbsp;</span><a class="entry-author" href="#"><%= news.getAuthor() %></a>
	                        </div>
	                    </article>

			<%						
					}
			%>
			
					<ul class="pagination box-hover clearfix">
                        <li><a href="#" class="previous-page paging">Previous</a></li>
                        <li class="current"><a href="#" class="paging">1</a></li>
                        <li><a href="#" class="paging">2</a></li>
                        <li><a href="#" class="paging">3</a></li>
                        <li><a href="#" class="paging">4</a></li>
                        <li><a href="#" class="next-page paging">Next</a></li>
                    </ul>

                </section>
            </div>


</body>

</html>