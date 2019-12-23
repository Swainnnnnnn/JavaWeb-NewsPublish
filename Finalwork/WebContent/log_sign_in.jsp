<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ page import="com.rainsia.news.entity.User" %> 
    
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" contentype="utf-8">
    <link rel="icon" type="image/x-icon" href="#" />
    <link type="text/css" rel="styleSheet"  href="css/main.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>账号登录</title>
    <style>
        @font-face {
            font-family: 'neo';
            src: url("font/NEOTERICc.ttf");
        }
        
        input:-webkit-autofill {
        -webkit-box-shadow: 0 0 0px 1000px #e06267 inset !important;
        -webkit-text-fill-color:#fff;
        
} 
    </style>
</head>

<body>
    <%
		//获取验证消息
		request.setCharacterEncoding("UTF-8");
        User user = (User)session.getAttribute("success");
        
        
    
        //登录
	   	String message1 = (String) request.getAttribute("message1");
	   	String message2 = (String) request.getAttribute("message2");
	   	String message3 = (String) request.getAttribute("message3");
	   	
	   	//注册
	    String message4 = (String) request.getAttribute("message4");
	   	String message5 = (String) request.getAttribute("message5");
	   	String message6 = (String) request.getAttribute("message6");
		String message7 = (String) request.getAttribute("message7");
	   	String message8 = (String) request.getAttribute("message8");
	   	String message9 = (String) request.getAttribute("message9");
	   	String message10 = (String) request.getAttribute("message10");
	   	
	   	
	   	
	   	//忘记密码
	   	String msg4 = (String) request.getAttribute("msg4");
	   	
	   	
	   	//记住密码
	   	String username1 = ""; //用户名
    	String password1 = ""; //密码
    	
    	Cookie[] cookies = request.getCookies();
    	
    	//System.out.println("cookies.length1:"+cookies.length);
    	//System.out.println("cookies.name1:"+cookies[0].getName());
    	//System.out.println("cookies.value1:"+cookies[0].getValue());
    	
    	//保存有cookie对象
    	if(cookies != null && cookies.length > 0){
    		for(Cookie c: cookies){
    			if(c.getName().equals("username")){
    				username1 = c.getValue();
    			}
    			if(c.getName().equals("password")){
    				password1 =c.getValue();
    			}
    		}
    	}

        //System.out.println(username1+"1314");
    	
        
        //非法访问
        String message11 = (String) request.getAttribute("message11");
        String message12 = (String) request.getAttribute("message12");
    	
	%>
	
	
	
	
	
	<div id="mess" >
	 	 <%
	 	 
	 	//登录的提示语
	 	if(message1 != null){
	    	out.println("<script type='text/javascript'>"
					+ "alert('未输入用户名或者密码！');"
					+ "location.href='log_sign_in.jsp';"
					+ "</script>");
	    }
	 	if(message2 != null){
	    	out.println("<script type='text/javascript'>"
					+ "alert('未输入用户名或者密码！');"
					+ "location.href='log_sign_in.jsp';"
					+ "</script>");
	    }
	 	if(message3 != null){
	    	out.println("<script type='text/javascript'>"
					+ "alert('用户名或密码错误，请重新登录！');"
					+ "location.href='log_sign_in.jsp';"
					+ "</script>");
	    }
	 	
	 	
	 	
	   //注册的提示语
	   if(message4 != null){
	    	out.println("<script type='text/javascript'>"
					+ "alert('用户登录名不能为空！');"
					+ "location.href='log_sign_in.jsp';"
					+ "</script>");
	    }
	 	if(message5 != null){
	    	out.println("<script type='text/javascript'>"
					+ "alert('用户显示名不能为空！');"
					+ "location.href='log_sign_in.jsp';"
					+ "</script>");
	    }
	 	if(message6 != null){
	    	out.println("<script type='text/javascript'>"
					+ "alert('密码不能为空！');"
					+ "location.href='log_sign_in.jsp';"
					+ "</script>");
	    }
	 	
	 	if(message7 != null){
	    	out.println("<script type='text/javascript'>"
					+ "alert('两次输入的密码不一致！');"
					+ "location.href='log_sign_in.jsp';"
					+ "</script>");
	    }
	 	if(message8 != null){
	    	out.println("<script type='text/javascript'>"
					+ "alert('用户登录名已存在，请重新注册！');"
					+ "location.href='log_sign_in.jsp';"
					+ "</script>");
	    }	
	 	
	 	//if(message9 != null){
	    	//out.println("<script type='text/javascript'>"
				//	+ "alert('注册成功，马上登录！');"
					//+ "location.href='log_sign_in.jsp';"
					//+ "</script>");
	  //  }	
	 	
	 	if(message10 != null){
	    	out.println("<script type='text/javascript'>"
					+ "alert('注册失败，请重新注册！');"
					+ "location.href='log_sign_in.jsp';"
					+ "</script>");
	    }	
	 	
	   
	 	//忘记密码
	 	 if(msg4 != null){
	    	out.println("<script type='text/javascript'>"
					+ "alert('成功获取原密码并且重新登录！原密码为："+user.getPassword()+"' );"
					+ "location.href='log_sign_in.jsp';"
					+ "</script>");
	    }
	   	
	 	
	 	System.out.println(message11+"wxl");
	 	//非法访问提示语
	 	if(message11 != null){
	    	out.println("<script type='text/javascript'>"
					+ "alert('必须先登录才能完成操作！');"
					+ "location.href='log_sign_in.jsp';"
					+ "</script>");
	    }	
	 	
	 	if(message12 != null){
	    	out.println("<script type='text/javascript'>"
					+ "alert('禁止非法访问！');"
					+ "location.href='log_sign_in.jsp';"
					+ "</script>");
	    }	
	 %>
	</div>



    <div id="bg">
        <div id="hint"><!-- 提示框 -->
            <p>登录失败</p>
        </div>
        <div id="login_wrap">
            <div id="login"><!-- 登录注册切换动画 -->
                <div id="status">
                    <i style="top: 0">Log</i>
                    <i style="top: 35px">Sign</i>
                    <i style="right: 5px">in</i>
                </div>
                <span>
                    <form id="form"  method="post"   action="login.action">
                        <p class="form">
                        	<input  type="text" name="username" id="user" placeholder="username"  value="<%=username1 %>">
                        </p>                     
                        
                        <p class="form">
                             <input  type="password" name="password" id="passwd" placeholder="password" value="<%=password1 %>">
                        </p>
                        <p class="form confirm">
                             <input  type="password" name="con_password" id="confirm-passwd" placeholder="confirm password" >
                        </p>
                        <p class="form display_name">
                             <input  autocomplete="off" type="text" name="display_name" id="display_name" placeholder="display_name"  >
                        </p>
                        
                        <!--2019.12.12 改动过 -->
                        <div id="rememberme-style">
                             <input type="checkbox" name="rememberme" id="rememberme"  checked="checked" >remember me
                        </div>
                              <input type="submit" id="sure" value="Sure" class="btn" >
                        <div>
                        <input type="button" id="btn1" name="btn1" value="Log in" class="btn" onclick="login()"  style="margin-right: 20px;">
                        <input type="button" value="Sign in" class="btn" onclick='signin()' id="btn">
                        </div>
                    </form>
                    <a href="forgetpassword.jsp">Forget your password?</a>
                </span>
            </div>

            <div id="login_img"><!-- 图片绘制框 -->
                <span class="circle">
                    <span></span>
                    <span></span>
                </span>
                <span class="star">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                </span>
                <span class="fly_star">
                    <span></span>
                    <span></span>
                </span>
                <p id="title">news</p>
            </div>
        </div>
    </div>
</body>
<script>
    var onoff = true//根据此布尔值判断当前为注册状态还是登录状态
    var confirm = document.getElementsByClassName("confirm")[0]
    var display_name = document.getElementsByClassName("display_name")[0]
    //var user = document.getElementById("user")
    //var passwd = document.getElementById("passwd")
    //var con_pass = document.getElementById("confirm-passwd")
    
    //var flag = true;
    
    //自动居中title
    var name_c = document.getElementById("title")
    name = name_c.innerHTML.split("")
    name_c.innerHTML = ""
    for (i = 0; i < name.length; i++)
        if (name[i] != ",")
            name_c.innerHTML += "<i>" + name[i] + "</i>"
    //引用hint()在最上方弹出提示
    function hint() {
        let hit = document.getElementById("hint")
        hit.style.display = "block"
        setTimeout("hit.style.opacity = 1", 0)
        setTimeout("hit.style.opacity = 0", 2000)
        setTimeout('hit.style.display = "none"', 3000)
    }
   
    //注册按钮
    function signin() {
    	
    	 
        let status = document.getElementById("status").getElementsByTagName("i");
        let hit = document.getElementById("hint").getElementsByTagName("p")[0];
        if (onoff) {
        	//改变用户名的那么属性，便于区分登录、注册
        	//console.log(document.getElementById("user").name);
        	
        	//表示注册的name属性
        	//document.getElementById("btn1").name="no";
        	//console.log(document.getElementById("user").name);
        	//document.getElementById("passwd").name="passWord";
        	//显示出下面两行
        	
        	document.getElementById("rememberme-style").style.display = "none";
        	
        	
        	document.getElementById("form").action = "signin.action"
        	
        	document.getElementById("user").value='';
        	document.getElementById("passwd").value='';
        	document.getElementById("confirm-passwd").value='';
        	document.getElementById("display_name").value='';
        	
        	//flag = false;
            confirm.style.height = 51 + "px"
            display_name.style.height = 70 + "px"
            status[0].style.top = 35 + "px"
            status[1].style.top = 0
            

            onoff = !onoff
        } else {
          
        }
    }

    //登录按钮
    function login() {
        if (onoff) {
        	
        } else {
            let status = document.getElementById("status").getElementsByTagName("i")
            
            
            document.getElementById("rememberme-style").style.display = "block";
            //改变用户名的那么属性，便于区分登录、注册
        	//console.log(document.getElementById("user").name);
            document.getElementById("form").action = "login.action";
        	//表示注册的name属性
        	//document.getE//lementById("user").name="username";
        	//console.log(document.getElementById("user").name);
            //document.getElementById("passwd").name="password";
        	//document.getElementById("btn1").name="btn1";
            //flag = true;
            document.getElementById("user").value='';
        	document.getElementById("passwd").value='';
        	document.getElementById("confirm-passwd").value='';
        	document.getElementById("display_name").value='';
            
            
            confirm.style.height = 0
            display_name.style.height = 0
            status[0].style.top = 0
            status[1].style.top = 35 + "px"
            

            onoff = !onoff
        }
    }
    
    
    //动态设置form的action属性
    //if(document.getElementById("btn1").name){
       // document.getElementById("form").action = "doLogin.jsp";
     //}else
     //{
      // document.getElementById("form").action = "doSignin.jsp";
    //}
     
    
    
    
</script>
</html>
