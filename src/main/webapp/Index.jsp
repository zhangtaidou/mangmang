<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="app" value="${pageContext.request.contextPath}"></c:set>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <style  type="text/css">

    </style>
    <title id="titlee">管理员页面</title>
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
    <script src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js"></script>
    <style>
        .add_blank {
            position: absolute;
            left: 14%;
            width: 34%;
            font-size: 32px;
            height: 66px;
            text-align: center;
            background: #ff9966;
            line-height: 67px;
            display: none;
        }
    </style>
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
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                                    <span class="block m-t-xs" style="font-size:20px;">
                                        <strong class="font-bold">${sessionScope.admin.name}</strong>
                                    </span>
                                </span>
                        </a>
                    </div>
                    <div class="logo-element">Admin
                    </div>
                </li>
                <li>
                    <a class="J_menuItem" href="${app}/ZhuYe.jsp">
                        <span class="nav-label">主页</span>
                    </a>
                </li>
                <%--商品--%>
                <li>

                    <a href="#">
                        <span class="nav-label goods">酒店商品</span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" href="${app}/commodity.jsp">商品</a>
                        </li>

                    </ul>
                </li>
                <%--第三方商品--%>
                <li>

                    <a href="#">
                        <span class="nav-label goods">第三方商品</span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" href="${app}/goods.jsp">商品</a>
                        </li>

                    </ul>
                </li>
                <li>

                    <a href="#">
                        <span class="nav-label goods">房型管理</span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" href="${app}/ShangP.jsp">酒店房型</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="${app}/ZaiShouRoom.jsp">在售房间</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="${app}/XiaJiaRoom.jsp">下架房间</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#">
                        <span class="nav-label employee">职员管理</span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" href="">职位</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="">职员管理</a>
                        </li>
                    </ul>
                </li>
                <li>
                <a href="#">
                <span class="nav-label cloudwarehouse">个人中心</span>
                </a>
                <ul class="nav nav-second-level">
                <li>
                <a class="J_menuItem" href="${app}/adminnumber.jsp">账号管理</a>
                </li>
                </ul>
                </li>
                <%--<li>--%>
                    <%--<a href="#">--%>
                        <%--<span class="nav-label cloudwarehouse">房态</span>--%>
                    <%--</a>--%>
                    <%--<ul class="nav nav-second-level">--%>
                        <%--<li>--%>
                            <%--<a class="J_menuItem" href="">房态管理</a>--%>
                        <%--</li>--%>
                    <%--</ul>--%>
                <%--</li>--%>
                <li>
                    <a href="#">
                        <span class="nav-label order">查询价格</span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" href="${app}/fangjia.jsp">价格管理</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#">
                        <span class="nav-label order">服务订单管理</span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" href="${app}/WeiChuLiDD.jsp">未处理订单</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="${app}/YiChuLiDD.jsp">已处理订单</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#">
                        <span class="nav-label order">入住订单管理</span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" href="${app}/DaiQueRen.jsp">待确认</a>
                        </li>

                        <li>
                            <a class="J_menuItem" href="${app}/WeiRuZhu.jsp">待入住</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="${app}/NewZhu.jsp">所有订单</a>
                        </li>
                        <li>
                            <a class="J_menuItem"href="${app}/RuZhuYH.jsp">入住订单</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="${app}/cancel.jsp">取消订单</a>
                        </li>
                        <li>
                            <a class="J_menuItem"href="${app}/JuJie.jsp">拒接订单</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#">
                        <span class="nav-label financial">财务管理</span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" href="">发票</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="${app}/LiushuiPrice.jsp">酒店流水</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#">
                        <span class="nav-label financial">价格设置</span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" href="${app}/JiaGeTianJia.jsp">添加价格类型</a>
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
</head>
</body>

</html>
