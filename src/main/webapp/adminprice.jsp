<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="app" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
    <title>管理员插入订单</title>
    <meta charset="utf-8">

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js"></script>
    <style>
        input{
            margin-top: 15px;
        }

    </style>
</head>
<body>
<div class="add_blank" >您有新的订单,请注意查看</div>

    <form action="${app}/user_orderController/addUser_order" method="post" >
        <audio id="sound" autoplay="autoplay"></audio>

        编&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号:<input type="text" name="id" id="id"><br/>
        酒店昵称:<input type="text" name="admin_name" id="admin_name"><br/>
        客户姓名:<input type="text" name="user_name" id="user_name"><br/>
        价&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;格:<input type="text" name="price" id="price"><br/>
        房&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型:<input type="text" name="room" id="room"><br/>
        酒店编号:<input type="text" name="admin_id" id="admin_id"><br/>
        用户编号:<input type="text" name="user_id" id="user_id"><br/>
        手&nbsp;&nbsp;机&nbsp;&nbsp;号:<input type="text" name="phone" id="phone"><br/>
        时&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;间:<input type="text" name="date" id="date"><br/>
        数&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;量:<input type="text" name="count" id="count"><br/>
        天&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数:<input type="text" name="day" id="day"><br/>
        状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态:<input type="text" name="state" id="state"><br/>
        结算状态:<input type="text" name="price_state" id="price_state"><br/>
        工&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号:<input type="text" name="nuber" id="nuber"><br/>
        <input type="submit" value="插入订单" class="btn btn-info">
    </form>


</body>
<script>
    $(function () {
        setInterval(function(){
            $(".add_blank").hide();
        });
    })
    var war=0;
    function hello() {
        var id=${sessionScope.admin.id}
            $.ajax({
                url:'${app}/user_orderController/selectAllAdmin',
                type:'get',
                data:{'admin_id':id},
                datatype:'json',
                async:false,
                success:function (data) {
                    $(data).each(function() {
                        console.log(data);
                        if(this.price_state==1) {
                            war=1;
                            location.href='${app}/Tixin.jsp';
                            // $(".add_blank").show()
                            // playSound();
                        }
                    })
                }
            });
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
    if(war==1){
        var war=1;
    }
    setInterval("hello()",10000);<!--10秒定时请求一次-->

</script>
</html>
