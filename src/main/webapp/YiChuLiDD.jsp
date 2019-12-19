<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="app" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>GG</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <style>
        #TB{
            border-color: #0E9AEF;
            height: 70px;
        }
        th{
            color: #00B7EE;
            text-align: center;
        }
        .bt1{
            width: 300px;
            height: 40px;
        }
        .bt2{
            width: 300px;
            height: 40px;
        }
        #Sou{
            margin-left: 800px;
        }
        td{
            text-align: center;
            color: #00B7EE;
        }
        #GG{
            color: red;
        }
    </style>
    <script src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js"></script>
</head>
<body>
<div class="add_blank" >您有新的订单,请注意查看</div>
<div id='eve'>
    <div>
        <table id="TB" class="table"  width="100%" border="2"cellpadding="2" cellspacing="1"  >
            <tr>
                <th>选项</th>

                <th>房号</th>

                <th>时间</th>

                <th>备注</th>

                <th>操作</th>
            </tr>

            <tbody id="ty">

            </tbody>
        </table>

    </div>
</div>
</body>
<script>
    $(function () {
        var id = ${sessionScope.admin.id};
        $.ajax({
            "url":"${app}/ServeController/selectService",
            "type":"get",
            "data":{"admin_id":id},
            "dataType":"json",
            "success":function (data) {
                $(data).each(function () {
                    if(this.state==2){
                        $("#ty").append("<tr><td>"+this.option+"</td>"+
                            "<td>"+this.number+"</td>" +
                            "<td>"+this.date+"</td>" +
                            "<td>"+this.remarks+"</td>" +
                            "<td><input type='button' value='已处理' class='btn btn-info'></td></tr>"
                        )
                    }
                })
            },
            "error":function () {
                alert("数据异常！请联系管理员！！！");
            }
        })
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