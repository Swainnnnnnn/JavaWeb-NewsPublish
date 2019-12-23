<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ page language="java" import="java.util.*" pageEncoding="utf-8"%> --%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>娱乐新闻</title>
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
  <link rel="css/mine.detail.css">
  <!-- Favicon-->
  <link rel="shortcut icon" href="img/favicon.png">
</head>
<body>
     
     
   <!-- 密保设置成功，进入首页 -->
   <%  String message7 = (String) request.getAttribute("message7");
    if(message7 != null){
	    	out.println("<script type='text/javascript'>"
					+ "alert('密保设置成功，进入首页！');"
					+ "location.href='index.jsp';"
					+ "</script>");
	    }
    
    //修改密码成功
    String successMsg = (String) request.getAttribute("successMsg");
    if(successMsg != null){
	    	out.println("<script type='text/javascript'>"
					+ "alert('密码修改成功，返回首页！');"
					+ "location.href='index.jsp';"
					+ "</script>");
	    }
	 	
    %>





	<div id="all">
    <div class="container-fluid">
      <div class="row row-offcanvas row-offcanvas-left"> 
      
        <jsp:include page="header.jsp"></jsp:include>
        
        <!--   *** PORTFOLIO ***-->
        <div class="col-md-8 col-lg-9 content-column">
          <div class="small-navbar d-flex d-md-none">
            <button type="button" data-toggle="offcanvas" class="btn btn-outline-primary"> <i class="fa fa-align-left mr-2"></i>Menu</button>
            <h1 class="small-navbar-heading"> <a href="index.jsp">Creative </a></h1>
          </div>
          <div class="grid row">
            <div class="col-md-6 col-lg-3 grid-item"> 
              <div class="box-masonry"> <a href="detail.jsp?id=5" title="" class="box-masonry-image with-hover-overlay"><img src="img/portfolio/001.jpg" alt="" class="img-fluid"></a>
                <div class="box-masonry-hover-text-header"> <a href="detail.jsp?id=5" class="tile-link">  </a>
                  <h4>胖成这样，真是有对比就有伤害</h4>
                  <div class="box-masonry-desription">
                    <p> 2019年都快过完了，怎么还有这么老套的剧情和台词啊！ 胖成这样，真是有对比就有伤害 穿越回清朝谈恋爱的小说，有三大鼻祖，
                    	分别是《梦回大清》《步步惊心》和《独步天下》。《步步惊心》最先被影视化，也是其中最成功的一部改编，
                    </p>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-6 col-lg-3 grid-item"> 
              <div class="box-masonry"> <a href="detail.jsp?id=6" title="" class="box-masonry-image with-hover-overlay with-hover-icon"><img src="img/portfolio/002.jpg" alt="" class="img-fluid"></a>
                <div class="box-masonry-text"> 
                  <h4> <a href="detail.jsp?id=6">叫好不叫座 贺岁档“失宠”爆款去哪儿了</a></h4>
                  <div class="box-masonry-desription">
                    <p> 截至12月15日，贺岁档票房约14.5亿元，相比去年同期12月票房下降明显，贺岁档明显“失宠”。 
                    	《南方车站的聚会》《南方车站的聚会》 　　贺岁档“失宠”爆款去哪儿了
                    </p>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-6 col-lg-3 grid-item"> 
              <div class="box-masonry"> <a href="detail.jsp?id=7" title="" class="box-masonry-image with-hover-overlay with-hover-icon"><img src="img/portfolio/003.jpg" alt="" class="img-fluid"></a>
                <div class="box-masonry-text"> 
                  <h4> <a href="detail.jsp?id=7">妈妈在高以翔追悼会发言催泪:你永远都是我的天使</a></h4>
                  <div class="box-masonry-desription">
                    <p>上帝把你带来我的身边，现在又把你带走，应该是有祂的理由……你永远都是我的宝贝、我的天使。” </p>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-6 col-lg-3 grid-item"> 
              <div class="box-masonry"> 
                <div class="box-masonry-text"> 
                  <h4> <a href="detail.jsp?id=8">梁静茹恢复单身心情五味杂陈 花更多时间寻找答案</a></h4>
                  <div class="box-masonry-desription">
                    <p> 
                    	梁静茹暌违7年推出新专辑《我好吗？太阳如常升起》，坦言这7年间她从人妻、人母的角色又回到单身，心情五味杂陈。
                    </p>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-6 col-lg-3 grid-item"> 
              <div class="box-masonry"> <a href="detail.jsp?id=9" title="" class="box-masonry-image with-hover-overlay"><img src="img/portfolio/004.jpeg" alt="" class="img-fluid"></a>
                <div class="box-masonry-hover-text-header"> <a href="detail.jsp?id=9" class="tile-link">  </a>
                  <h4>李宇春父亲曾劝她退出娱乐圈 心疼女儿拄拐杖上台</h4>
                  <div class="box-masonry-desription">
                    <p>我其实是对人群有恐惧的。你觉得这个东西并没有对你造成伤害，但突然某一天发生了一件事情让你自己意识到原来我是受过伤的。</p>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-6 col-lg-3 grid-item"> 
              <div class="box-masonry"> 
                <div class="box-masonry-text"> 
                  <h4> <a href="detail.jsp?id=10">撒贝宁妻子诞下龙凤胎 晒照宣布喜讯</a></h4>
                  <div class="box-masonry-desription">
                    <p>日前，有网友爆料撒贝宁老婆李白已生产。新浪娱乐求证撒贝宁方，其工作人员回复：“大家用满满的爱默默祝福他们吧”，
                    	并在朋友圈晒出李白孕照和新成员小手照。随后有网友曝光李白社交平台截图，配文证实已生下龙凤胎。
                    </p>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-6 col-lg-3 grid-item"> 
              <div class="box-masonry"> <a href="detail.jsp?id=11" title="" class="box-masonry-image with-hover-overlay with-hover-icon"><img src="img/portfolio/005.jpg" alt="" class="img-fluid"></a>
                <div class="box-masonry-text"> 
                  <h4> <a href="detail.jsp?id=11">克里斯汀·斯图尔特获2010年代“十年女演员”奖</a></h4>
                  <div class="box-masonry-desription">
                    <p>克里斯汀·斯图尔特获得好莱坞影评人协会颁发的2010年代“十年女演员”奖，将于明年1月9日颁奖</p>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-6 col-lg-3 grid-item"> 
              <div class="box-masonry"> <a href="detail.jsp?id=12" title="" class="box-masonry-image with-hover-overlay with-hover-icon"><img src="img/portfolio/006.jpg" alt="" class="img-fluid"></a>
                <div class="box-masonry-text"> 
                  <h4> <a href="detail.jsp?id=12">凯伦·吉兰：想导漫威电影的酷女孩，骨子里很宅 </a></h4>
                  <div class="box-masonry-desription">
                    <p> 这个从苏格兰一路走到好莱坞镁光灯下的女孩，从名模、演员到编剧、导演，在一个个身份定义中不断突破自我。 
                    	凯伦·吉兰凯伦·吉兰 　　身高1.8米的凯伦·吉兰拥有一头漂亮的红发，似乎天生就适合做模特和演员。 　　
                    	然而，作为漫威电影宇宙中最漂亮的女演员之一，凯伦·吉兰却扮演着审美最特殊的半机械人星云。 
                    </p>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-6 col-lg-3 grid-item"> 
              <div class="box-masonry"> <a href="detail.jsp?id=13" title="" class="box-masonry-image with-hover-overlay with-hover-icon"><img src="img/portfolio/007.jpg" alt="" class="img-fluid"></a>
                <div class="box-masonry-text"> 
                  <h4> <a href="detail.jsp?id=13">盘点58部北京剧 北方演员居多北京人是“大拿”</a></h4>
                  <div class="box-masonry-desription">
                    <p>8部北京剧里，赵宝刚曾拍摄八部北京剧，刘家成、英达以五部作品居次，
                    	演员中何冰曾9次出演北京剧，并以此获奖。 北京剧里北京人是大拿北京剧里北京人是大拿
                    </p>
                  </div>
                </div>
              </div>
            </div>
            <!--  <div class="tlinks">Collect from <a href="http://www.cssmoban.com/"  title="网站模板">网站模板</a></div> -->
            <div class="col-md-6 col-lg-3 grid-item"> 
              <div class="box-masonry"> <a href="detail.jsp?id=14" title="" class="box-masonry-image with-hover-overlay"><img src="img/portfolio/008.jpg" alt="" class="img-fluid"></a>
                <div class="box-masonry-hover-text-header"> <a href="detail.jsp?id=14" class="tile-link">  </a>
                  <h4>五月天阿信曝团员"妻小成群" 石头傻眼：有点奇怪</h4>
                  <div class="box-masonry-desription">
                    <p>12月14日，五月天受邀出席盛典，荣获年度最佳乐团、年度最具号召力乐团、年度最受欢迎乐团3项大奖。 
                    </p>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-6 col-lg-3 grid-item"> 
              <div class="box-masonry"> <a href="detail.jsp?id=15" title="" class="box-masonry-image with-hover-overlay"><img src="img/portfolio/009.jpg" alt="" class="img-fluid"></a>
                <div class="box-masonry-hover-text-header"> <a href="detail.jsp?id=15" class="tile-link">  </a>
                  <h4>陶喆公益献唱11首经典歌曲 粉丝热情犹如见面会</h4>
                  <div class="box-masonry-desription">
                    <p>据台湾媒体报道，金曲歌王陶喆日前受邀参加“我有爱”公益演唱会，他帅气背着电吉他，自弹自唱热唱1小时，一连飙唱《小镇姑娘》、《苏三说》、《普通朋友》、《今天你要嫁给我》等11首经典歌，全场大合唱，宛如大型KTV，台下许多热情粉丝，原本依序坐着看演出，岂料在演出过程中，
                    	歌迷一一都随着音乐站起来摇摆，还有人冲到舞台前面，他也开心跟粉丝握手。
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!--   *** PORTFOLIO END ***-->
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