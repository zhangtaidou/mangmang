<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="app" value="${pageContext.request.contextPath}"></c:set>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>

<head>
    <title>Title</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>GG</title>

    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
    价格类型:<input type="text" name="kind" id="inpkind">
    相关房型:<input type="text" name="room_name" id="inproom_name">&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="开始搜索" onclick="selectByKindOrRoom_Name()"><br/>
        价&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;格:<input type="text" name="pricea" id="pricea" value=0 >&nbsp;&nbsp;&nbsp;&nbsp;——&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="priceb" id="priceb" value=100000>&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="开始搜索" onclick="selectPrice()">
<br/>
<button  type="button" class="btn btn-primary btn-lg"  data-toggle="modal" data-target="#myModal" style="height: 40px" onclick="selectRoom()" >
    +新价格类型
</button>
<script>
    var count=1;
    var   kind;
    var   price;
    var   room_name;
    var   admin_id;
    // $("#select").click(function () {
    //
    //     kind = $("#dajiji").val();
    //     price = $("#price").val();
    // });
    // $("#select1").click(function () {
    //
    // });

    function ses() {
        room_name = $("#select1").val();
        count = $("#select").val();
        kind = $("#dajiji").val();
        price = $("#price").val();
        admin_id =${sessionScope.admin.id}
        $.ajax({
                url:"${app}/KindController/addKind",
                data:{
                    "count":count,
                    "room_name":room_name,
                    "kind":kind,
                    "price":price,
                    "admin_id":admin_id
                },
                datatype:"json",
                type:"post"
            }
        )
        alert("添加成功！")
        location.href="${app}/JiaGeTianJia.jsp";
    }

    var id=${sessionScope.admin.id}
        $.ajax({
            url:"${app}/KindController/selectKind",
            data:{"id":id},
            dataType:"json",
            type:"post",
            success:function (data){
                $("#select1").empty();
                $.each(data,function (index, poem) {
                    var td=$("<td>").html(poem.kind)
                    var name=$("<td>").html(poem.room_name)
                    var price=$("<td>").html(poem.price)
                    var del=$("<input type='button'onclick='del("+poem.id+")' class='btn btn-danger' value='删除' >");
                    var tr=$("<tr>").append(name).append(td).append(price).append(del)
                    $("#table").append(tr)
                })
            }
        })
    // function ss(){
    //
    //     if(kind==null){
    //         alert("该内容不能为空");
    //     }else if(price==null){
    //         alert("该内容不能为空");
    //     }
    // }

    function del(id) {
        $.ajax({
            url:"${app}/KindController/deleteKind",
            data:{"id":id},
            dataType:"json",
            type:"post",
            // error:function () {
            //     alert("数据异常！请联系管理员！！！");
            // }
        })
        alert("删除成功");
        location.href="${app}/JiaGeTianJia.jsp";

    }

    function selectRoom() {
        var id=${sessionScope.admin.id}
            $("#select1").empty();
        var opp=$("<option>").html("请选择类型")
        $("#select1").append(opp)
        $.ajax({
            url:"${app}/KindController/selectRoom",
            data:{"id":id},
            dataType:"json",
            type:"post",
            success:function (data){
                $.each(data,function (index, poem) {
                    var op=$("<option>").html(poem.name)
                    $("#select1").append(op)
                })
            }
        })
    }
    /*区间查询*/
    function selectPrice() {
        var id=${sessionScope.admin.id}
        var pricea=$("#pricea").val();
        var priceb=$("#priceb").val();
        $("#table").empty();
        $.ajax({
            url:"${app}/KindController/selectByPrice",
            data:{"admin_id":id,"pricea":pricea,"priceb":priceb},
            dataType:"json",
            type:"post",
            success:function (data){
                //需要优化
                if(data==""){
                    alert("暂无相应数据！！！");
                    location.href="${app}/JiaGeTianJia.jsp";
                }else {
                    $.each(data, function (index, poem) {
                        var td = $("<td>").html(poem.kind)
                        var name = $("<td>").html(poem.room_name)
                        var price = $("<td>").html(poem.price)
                        var del = $("<input type='button'onclick='del(" + poem.id + ")' class='btn btn-danger' value='删除' >");
                        var tr = $("<tr id='tr'>").append(name).append(td).append(price).append(del)
                        $("#table").append(tr)

                    })
                }
            },
            error:function () {
                 alert("数据异常！请联系管理员！！！");
             }
        })
    }

    function selectByKindOrRoom_Name() {
        var id=${sessionScope.admin.id}
        var inpKind=$("#inpkind").val();
        var inpRoom_Name=$("#inproom_name").val();
        $("#table").empty();
        $.ajax({
            url:"${app}/KindController/selectByKindOrRoom_Name",
            data:{"admin_id":id,"kind":inpKind,"room_name":inpRoom_Name},
            datatype:"json",
            type:"post",
            success:function (data){
               if(data==""){
                  alert("暂无相应数据！！！");
                  location.href="${app}/JiaGeTianJia.jsp";
               }else {
                   $.each(data, function (index, poem) {
                       var td = $("<td>").html(poem.kind)
                       var name = $("<td>").html(poem.room_name)
                       var price = $("<td>").html(poem.price)
                       var del = $("<input type='button'onclick='del(" + poem.id + ")' class='btn btn-danger' value='删除' >");
                       var tr = $("<tr id='tr'>").append(name).append(td).append(price).append(del)
                       $("#table").append(tr)
                   })
               }
            }
        })
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
    setInterval("hello()",10000);  //10秒定时请求一次
</script>

<form>
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">增加价格类型</h4>

                </div>
                价格类型归属：<input type="text" value="${sessionScope.admin.name}" disabled="disabled">
                价格类型名称：<input type="text"  id="dajiji" name="kind"><br>
                <br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;价格：<input type="text" id="price" ><br>
                <br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;关联房型：<select style="width: 180px" id="select1">

            </select>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;早餐份数：<select style="width: 180px" id="select" >
                <option>请选择早餐数量</option>

                <option name="conut" value="1">
                    1
                </option>
                <option name="conut" value="2">
                    2
                </option>
                <option name="conut" value="3">
                    3
                </option>
                <option name="conut" value="4">
                    4
                </option >
                <option name="conut" value="5">
                    5
                </option>
                <option name="conut" value="6">
                    6
                </option>
                <option name="conut" value="7">
                    7
                </option>
                <option name="conut" value="8">
                    8
                </option>
            </select>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="submit" class="btn btn-primary" onclick="ses()" id="se">保存</button>
                </div>
            </div>
        </div>
    </div>
</form>
    <table class="table table-striped" >
        <thead>
        <tr>
            <th>关联房型</th>
            <th>价格类型名称</th>
            <th>价格</th>
            <th>操作</th>
        </tr>
        </thead>
    </table>
    <table class="table table-striped" id="table">
    </table>
</body>
</html>
