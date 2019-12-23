<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.rainsia.news.entity.User" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <link rel="icon" type="image/x-icon" href="#" />
    <link type="text/css" rel="styleSheet"  href="css/protectpassword.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>设置密保</title>
    <style>
        @font-face {
            font-family: 'neo';
            src: url("font/NEOTERICc.ttf");
        }
    </style>
</head>


<body>
<%	request.setCharacterEncoding("UTF-8");

    User user = (User)session.getAttribute("login");

    String message1 = (String) request.getAttribute("message1");
	String message2 = (String) request.getAttribute("message2");
	String message3 = (String) request.getAttribute("message3");
    String message4 = (String) request.getAttribute("message4");
	String message5 = (String) request.getAttribute("message5");
	String message6 = (String) request.getAttribute("message6");
	String message9 = (String) request.getAttribute("message9");
	
	
	 if(message1 != null){
	    	out.println("<script type='text/javascript'>"
					+ "alert('用户登录名不能为空！');"
					+ "location.href='protectpassword.jsp';"
					+ "</script>");
	    }
	 if(message2 != null){
	    	out.println("<script type='text/javascript'>"
					+ "alert('问题一的答案不能为空！');"
					+ "location.href='protectpassword.jsp';"
					+ "</script>");
	    }
	 if(message3 != null){
	    	out.println("<script type='text/javascript'>"
					+ "alert('问题二的答案不能为空！');"
					+ "location.href='protectpassword.jsp';"
					+ "</script>");
	    }
	 	
	 if(message4 != null){
	    	out.println("<script type='text/javascript'>"
					+ "alert('用户登录名错误！');"
					+ "location.href='protectpassword.jsp';"
					+ "</script>");
	    }
	 if(message5 != null){
	    	out.println("<script type='text/javascript'>"
					+ "alert('设置未成功，请重新操作！');"
					+ "location.href='protectpassword.jsp';"
					+ "</script>");
	    }	
	 if(message6 != null){
	    	out.println("<script type='text/javascript'>"
					+ "alert('设置未成功，请重新操作！');"
					+ "location.href='protectpassword.jsp';"
					+ "</script>");
	    }	
	 
	 if(message9 != null){
	    	out.println("<script type='text/javascript'>"
					+ "alert('注册成功，设置密保问题！');"
					+ "location.href='protectpassword.jsp';"
					+ "</script>");
	    }	
%>



    <div id="bg">
        <div id="login_wrap">
            <div id="changeyourpassword">
                <div id="status">
                     <p class="p1" >设置密保问题</p>
                </div>
                <span>
                    <form method="post" action="protectpassword.action">
                        <p class="form">
                        	<input  type="text" name="username" id="user" placeholder="username" >
                        </p> 
                        <p class="p2">first 你的小学班主任的名字是什么？</p>
                        <p class="form"><input type="text" name="pwdanswer1" id="pwdanswer1" ></p>
                        <p class="p2">second 你最喜欢的颜色是什么？</p>
                        <p class="form"><input type="text" name="pwdanswer2" id="pwdanswer2" ></p>
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