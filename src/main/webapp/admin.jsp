<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="app" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <title>超级管理员页面</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
    <link rel="shortcut icon" href="favicon.ico">
    <link href="${app}/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${app}/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="${app}/css/animate.css" rel="stylesheet">
    <link href="${app}/css/style.css?v=4.1.0" rel="stylesheet">
</head>
<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
<div id="wrapper">
    <!--左侧导航开始-->
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="nav-close"><i class="fa fa-times-circle"></i>
        </div>
        <div class="sidebar-collapse">
            <ul class="nav" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element">
                                <span class="clear">
                                    <span class="block m-t-xs" style="font-size:20px;">
                                        <strong class="font-bold">百合天互总后台</strong>
                                    </span>
                                </span>
                    </div>
                    <div class="logo-element">hAdmin
                    </div>
                </li>
                <li>
                    <a href="#">
                        <span class="nav-label goods">超级管理员</span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" href="${app}/Hotel.jsp">查看酒店结算</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#">
                        <span class="nav-label financial">插入订单</span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" href="${app}/adminprice.jsp">管理员插入订单操作</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
    <!--左侧导航结束-->
    <!--右侧部分开始-->
    <div id="page-wrapper" class="gray-bg dashbard-1">

        <div class="row J_mainContent" id="content-main">
            <iframe id="J_iframe" width="100%" height="100%" src="${app}/ZhuYe.jsp" frameborder="0" data-id="ZhuYe.html" seamless></iframe>
        </div>
    </div>
    <!--右侧部分结束-->
</div>
<!-- 全局js -->
<script src="${app}/js/jquery.min.js?v=2.1.4"></script>
<script src="${app}/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${app}/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="${app}/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="${app}/js/plugins/layer/layer.min.js"></script>
<!-- 自定义js -->
<script src="${app}/js/hAdmin.js?v=4.1.0"></script>
<script type="text/javascript" src="${app}/js/index.js"></script>
<!-- 第三方插件 -->
<script src="${app}/js/plugins/pace/pace.min.js"></script>
</body>
</html>
