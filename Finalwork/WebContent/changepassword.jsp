<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.rainsia.news.entity.User" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <link rel="icon" type="image/x-icon" href="#" />
    <link type="text/css" rel="styleSheet"  href="css/changepassword.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>修改密码</title>
    <style>
        @font-face {
            font-family: 'neo';
            src: url("font/NEOTERICc.ttf");
        }
    </style>
</head>


<body>
    <%
		//获取验证消息
		request.setCharacterEncoding("UTF-8");
	    String error1 = (String) request.getAttribute("error1");
	   	String error2 = (String) request.getAttribute("error2");
	   	String error3 = (String) request.getAttribute("error3");
		String error4 = (String) request.getAttribute("error4");
	   	String error5 = (String) request.getAttribute("error5");
		
	   	
	   	User user = (User)session.getAttribute("login");
	   	
	    if(error1 != null){
	    	//System.out.println("a1");
	    	out.println("<script type='text/javascript'>"
					+ "alert('原密码输入错误！');"
					+ "location.href='changepassword.jsp';"
					+ "</script>");
	    }
	 	if(error2 != null){
	 		//System.out.println("a2");
	    	out.println("<script type='text/javascript'>"
					+ "alert('新密码不能为空！');"
					+ "location.href='changepassword.jsp';"
					+ "</script>");
	    }
	 	if(error3 != null){
	 		//System.out.println("a3");
	    	out.println("<script type='text/javascript'>"
					+ "alert('重复密码不能为空！');"
					+ "location.href='changepassword.jsp';"
					+ "</script>");
	    }
	 	
	 	if(error4 != null){
	 		//System.out.println("a4");
	    	out.println("<script type='text/javascript'>"
					+ "alert('两次密码输入不一致！');"
					+ "location.href='changepassword.jsp';"
					+ "</script>");
	    }
	 	if(error5 != null){
	 		//System.out.println("a5");
	    	out.println("<script type='text/javascript'>"
					+ "alert('修改失败，请重新修改！');"
					+ "location.href='changepassword.jsp';"
					+ "</script>");
	    }	
	 	
	%>


    <div id="bg">
        <div id="login_wrap">
            <div id="changeyourpassword">
                <div id="status">
                     <p>change your password</p>
                </div>
                <span>
                    <form method="post" action="changepassword.action">
                        <p class="form"><input type="text" name="username" id="user" placeholder="username"></p>
                        <p class="form"><input type="password" name="password1" id="passwd1" placeholder="old password"></p>
                        <p class="form"><input type="password" name="password2" id="passwd2" placeholder="new password"></p>
                        <p class="form"><input type="password" name="confirm-paasword" id="confirm-passwd" placeholder="confirm new password"></p>
                        <input type="reset" value="cansel" class="btn2"  style="margin-right: 20px;">
                        <input type="submit" value="sure" class="btn2"  id="btn">
                    </form>
                </span>
            </div>

            <div id="img"><!-- 图片绘制框 -->
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
                <p id="title">n&emsp;&emsp;e&emsp;&emsp;w&emsp;&emsp;s</p>
            </div>
        </div>
    </div>
</body>

</html>
