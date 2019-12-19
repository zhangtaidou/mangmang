<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="app" value="${pageContext.request.contextPath}"></c:set>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="renderer" content="webkit">
		<title>管理员登陆页面</title>
		<!-- Custom Theme files -->
		<link href="${app}/css/styleone.css" rel="stylesheet" type="text/css" media="all"/>
		<!-- Custom Theme files -->
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="keywords" content="Login form web template, Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
	</head>
	<body>
		<div class='login'>
			<h2>Login</h2>
			<div class="login-top">
				<h1>管理员登陆</h1>
				<h1>v2.0</h1>
				<form action="${app}/adminController/selectByPwd" method="post">
					<input type="text" value="用户名" name="account" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'User Id';}"/>
					<input type="password" value="password" name="password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'password';}"/>

				<div class='forgot'>
					<input type="submit" value="登陆" />
				</div>
				</form>
			</div>
		</div>
	</body>
</html>
