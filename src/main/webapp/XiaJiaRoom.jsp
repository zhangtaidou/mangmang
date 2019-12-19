<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="app" value="${pageContext.request.contextPath}"></c:set>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        #TB{
            height: 70px;
        }

        td{
            text-align: center;
        }
        a{
            text-decoration:none;
            color: #00a2d4;
        }
    </style>
    <script src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="add_blank" >您有新的订单,请注意查看</div>
<table id="TB" class="table" table width="100%" border="2"cellpadding="2" cellspacing="1" >
    <tr>
        <td>房间房型</td>
        <td>房间价钱</td>
        <td>房间图片</td>
        <td>房型评分</td>
        <td>房间介绍</td>
        <td>房型剩余</td>
        <td>房态</td>
        <td colspan="3">操作</td>
    </tr>
    <tbody id="ty">

    </tbody>
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        添加房间
                    </h4>
                </div>
                <form action="${app}/roomController/addUser" method="post" enctype="multipart/form-data">
                    <div class="modal-body">
                        房间类型：<input type="text" name='name' id='room'/>
                        房间价格：<input type="text" name='price' id='price'><br/>
                        房间图片：<input type="file" name='files' id='img' >
                        房间介绍：<input type="text" name='introduce' id='introduce'><br/>
                        房间库存：<input type="text" name='count' id='count'>
                        房间房态：<input type="text" name='state' id='state'>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">
                            关闭
                        </button>
                        <button type="submit" class="btn btn-primary" >
                            确认
                        </button>
                    </div>
                </form>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
</table>
</body>
<script>
    function show(){
        var id = ${sessionScope.admin.id};
        $.ajax({
            "url":"${app}/roomController/selectByState",
            "type":"get",
            "data":{"id":id},
            "dataType":"json",
            "success":function (data) {
                $(data).each(function () {
                    if(data != null){
                        //'./images/1.jpg'
                        $("#TB").append("<tr><td>" + this.name + "</td>" +
                            "<td>" + this.price + "</td>" +
                            "<td><img  style=\"height:30px;width:40px;\" src="+this.img+"></td>" +
                            "<td>" + this.grade + "</td>" +
                            "<td>" + this.introduce + "</td>" +
                            "<td>" + this.count + "</td>" +
                            "<td><input type='button'  id='btn' onclick='updstate(" + this.id + ")' class='btn btn-info' value='关房'></td>" +
                            "<td><input type='button' value='删除' onclick='del("+this.id+")' class='btn btn-info'></td>"+
                            "<td><input type='button' value='上架'  onclick='sj(" + this.id + ")' class='btn btn-info'></td>"
                        )
                    }else{
                        var tr= $("<tr>")
                        $("#TB").append(tr)
                    }
                })
            },
            "error":function () {
                alert("数据异常！请联系管理员！！！");
            }
        })
    }
    $(function () {
        show()
        setInterval(function(){
            $(".add_blank").hide();
        });
    })



    function del(id){
        $.ajax({
            "url":"${app}/roomController/deleteRoom",
            "type":"post",
            "data":{"id":id},
            "dataType":"json",
            "error":function () {
                alert("数据库异常请联系管理员");
            }
        })
        alert("删除成功")
        location.href="${app}/ShangP.jsp";
    }

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