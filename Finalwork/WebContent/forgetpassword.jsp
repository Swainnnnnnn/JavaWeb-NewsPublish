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
    <title>忘记密码</title>
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
        User user = (User)session.getAttribute("success");
	   	String msg1 = (String) request.getAttribute("msg1");
	   	String msg2 = (String) request.getAttribute("msg2");
	   	String msg3 = (String) request.getAttribute("msg3");
		
	   	
	   	if(msg1 != null){
	    	out.println("<script type='text/javascript'>"
					+ "alert('未输入用户登录名或问题一答案或问题二答案！');"
					+ "'location.href='forgetpassword.jsp';"
					+ "</script>");
	    }
	 	if(msg2 != null){
	    	out.println("<script type='text/javascript'>"
					+ "alert('未输入用户登录名或问题一答案或问题二答案！');"
					+ "location.href='forgetpassword.jsp';"
					+ "</script>");
	    }
	 	if(msg3 != null){
	    	out.println("<script type='text/javascript'>"
					+ "alert('用户登录名或问题一答案或问题二答案错误，请重新输入！');"
					+ "location.href='forgetpassword.jsp';"
					+ "</script>");
	    }
	 	
	  
	   	
	   	
	%>
   
   
   
    <div id="bg">
        <div id="login_wrap">
            <div id="changeyourpassword">
                <div id="status">
                     <p class="p1" >回答密保问题，获取原密码</p>
                </div>
                <span>
                    <form method="post" action="forgetpassword.action">
                        <p class="form">
                        	<input  type="text" name="username" id="user" placeholder="username" >
                        </p>   
                        <p class="p2">first 你的小学班主任的名字是什么？</p>
                        <p class="form"><input type="text" autocomplete="off" name="pwdanswer1" id="pwdanswer1" ></p>
                        <p class="p2">second 你最喜欢的颜色是什么？</p>
                        <p class="form"><input type="text" autocomplete="off" name="pwdanswer2" id="pwdanswer2" ></p>
                        <input type="reset" value="cansel" class="btn2"  style="margin-right: 20px;">
                        <input type="submit" value="sure" class="btn2"  id="btn">
                       
                        <div  id="forgetpassword"> <%
				         //User user = (User)session.getAttribute("success");
				         if(user == null) {
			            %>
					     <p class="p2"> 再想想密码？ </p>
					
			            <%
				        } else {
			            %>
				          
				          
				          
				          
				          
			           <%
				       }
			           %></div>
                        
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