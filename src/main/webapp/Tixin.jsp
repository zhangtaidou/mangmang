<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="app" value="${pageContext.request.contextPath}"></c:set>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js"></script>
</head>
<body>
    <div>
        <h1>您来新订单啦....... </h1>
            <input type="button" value="点击此处查看您的新订单" onclick="inp()">


    </div>
</body>
<script>
    $(function () {
             playSound();
    })
    function inp() {
        var i=${sessionScope.admin.id}
            $.ajax({
                url:"${app}/user_orderController/updateStateBy",
                data:{"admin_id":i},
                type:"post",
                dataType:"json",
              error:function () {
                    alert("静态资源异常");
                }
            })
        location.href="${app}/DaiQueRen.jsp";
    }
    var playSound = function () {
        var borswer = window.navigator.userAgent.toLowerCase();
        if ( borswer.indexOf( "ie" ) >= 0 )
        {
            //IE内核浏览器
            var strEmbed = '<embed name="embedPlay" src="${app}/vide/lar.mp3" autostart="true" hidden="true" loop="false"></embed>';
            if ( $( "body" ).find( "embed" ).length <= 0 )
                $( "body" ).append( strEmbed );
            var embed = document.embedPlay;

            //浏览器不支持 audion，则使用 embed 播放
            embed.volume = 100;
            //embed.play();这个不需要
        } else
        {
            //非IE内核浏览器
            var strAudio = "<audio id='audioPlay' src='${app}/vide/lar.mp3' hidden='true'>";

            if($("#audioPlay").length<=0){
                $( "body" ).append( strAudio );
            }

            var audio = document.getElementById( "audioPlay" );

            //浏览器支持 audio
            audio.play();
        }
    }

</script>
</html>
