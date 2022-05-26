<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="css/login.css">
<script type="text/javascript" src="js/jquery.min.js"></script>

<title>登录</title>
<script type="text/javascript">
	$(function(){
		//2.点击验证码 跟新验证码
		$("#pagecode").click(function(){
			$("#pagecode").attr("src","code?method=createCode&t="+Math.random());
		});


	})
</script>
</head>
<body style="background-color: #fff5bb">
		<!-- login -->
		<div class="top center" style="background-color: #fff5bb;">
			<div class="logo center" >
				<a href="${pageContext.request.contextPath }/index.jsp" target="_blank"></a>
			</div>
		</div>
		<form  method="post" action="user?method=login" class="form center" id="userLogin" style="width:1130px;height:588px;background:url(image/Sunflower-1.png);border-radius: 5px; padding-top: 50px ">
		<div class="login" style="background-color:rgba(68, 68, 68, 0.5);margin-right:50px;" >
			<div class="login_center" >
				<div class="login_top">
					<div class="left fl">会员登录</div>
					<div class="right fr">您还不是我们的会员？<a href="${pageContext.request.contextPath }/register.jsp" target="_self">立即注册</a></div>
					<div class="clear"></div>
					<div class="xian center" style="background: #ee9e44;"></div>
				</div>
				<div class="login_main center">
					<div class="username">
						<div class="left fl">用户名:&nbsp;</div>
						<div class="right fl">
						<input class="shurukuang" type="text" name="username" id="username"  placeholder="请输入你的用户名"/>
						<label id="nameMsg"></label>
						</div>
					</div>
					<div class="username">
						<div class="left fl">密&nbsp;&nbsp;&nbsp;&nbsp;码:&nbsp;</div>
						<div class="right fl">
						<input class="shurukuang" type="password" name="password"  id="pwd"  placeholder="请输入你的密码"/>	
						</div>
					</div>
					<div class="username">
						<div class="left fl">验证码:&nbsp;</div>
						<div class="right fl"><input  id="vcode" name="code" type="text" placeholder="验证码"/>
						<img  id="pagecode" src="code?method=createCode"></div>
					</div>
					<div class="username">
						<div class="left fl">&nbsp;&nbsp;&nbsp;&nbsp;</div>
						<div class="right fl"><label id="checkMsg"></label></div>
					</div>
					<div class="username">
						<input id="autoLogin" name="auto" type="checkbox" />&nbsp;&nbsp;自动登录
						<span id="autoLoginMsg"></span>
					</div>
					<div class="login_submit">
						<input class="submit" type="submit" name="submit" value="立即登录" id="btn"  style="background: #ee9e44;" >
					</div>
					<span style="color:red">${msg}</span>
				</div>	
			</div>
		</div>
		</form>

	</body>
</html>