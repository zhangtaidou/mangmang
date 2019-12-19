<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="app" value="${pageContext.request.contextPath}"></c:set>
<html>
	<head>
		<meta charset="utf-8">
		<title>伊佳逸风酒店>房态></title>
	</head>
	<body>
		<h5>Fuck You</h5>
		<form action="${app}/user_orderController/addUser_order" method="post" >

		房间类型：<input type="text" name='room' id='room'/>
		房间价格：<input type="text" name='price' id='price'><br/>
		酒店名字：<input type="text" name='admin_name' id='introduce'><br/>
		房间库存：<input type="text" name='count' id='count'>
		用户名字：<input type="text" name='user_name' >
			用户手机号：<input type="text" name='phone' >
			用户id：<input type="text" name='user_id' >
			酒店id：<input type="text" name='admin_id' >
		<input type="submit" >确认</input>
		</form>
	</body>
</html>
