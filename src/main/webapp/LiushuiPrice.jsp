<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="app" value="${pageContext.request.contextPath}"></c:set>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>Document</title>
    <style>
        table{border-right:1px solid black;border-bottom:1px solid black;text-align: center;height:50px}
        table th{border-left:1px solid black;border-top:1px solid black;text-align: center}
    </style>

</head>
<body>
<div class="add_blank" >您有新的订单,请注意查看</div>
<form name="date">
    <select name="year" id="year" onchange="selectYear(this.value)">
        <option value="">选择 年</option>
    </select>
    <select name="month" id="month" onchange="selectMonth(this.value)">
        <option value="">选择 月</option>
    </select>
    <select name="day" id="day">
        <option value="">选择 日</option>
    </select>
    <jsp:text>-----到------</jsp:text>
    <select name="years" id="years" onchange="selectYear(this.value)">
        <option value="">选择 年</option>
    </select>
    <select name="months" id="months" onchange="selectMonth(this.value)">
        <option value="">选择 月</option>
    </select>
    <select name="days" id="days">
        <option value="">选择 日</option>
    </select>

    <input type="button" value="查询" onclick="Time()">
</form>


    <table id="TB" width="100%" border="2" cellspacing="1" cellpadding="1" class="table">
        <tr id="GG">
            <th>房间房型</th>
            <th>房间价格</th>
            <th>订房数量</th>
            <th>入住天数</th>
            <th>订单时间</th>
            <th>小计</th>
            <th>订单状态</th>
            <th>结算状态</th>
        </tr>

        <tr id="tr">

        </tr>

    </table>

    <table id="TBB" width="100%" border="2" cellspacing="1" cellpadding="1" class="tableb">
        <tr id="trr">
            <td>成功入住订单价格总计</td>
        </tr>
    </table>

    <a href="#" onclick="TiaoZhuan()">查询结算清单(查询完请点击此处防止数据出错)</a>

    <%--<div><h3>总算</h3><p id="price"></p></div>--%>
</body>
<script>
    function TiaoZhuan() {
        location.href="${app}/LiushuiPrice.jsp";
    }
    function Time() {
        var id = ${sessionScope.admin.id};
        var year=$("#year").val();
        var month=$("#month").val();
        var day=$("#day").val();
        var years=$("#years").val();
        var months=$("#months").val();
        var days=$("#days").val();
        var datea=year+"-"+month+"-"+day;
        var dateb=years+"-"+months+"-"+days;
        $.ajax({
            url:"${app}/admin_orderController/selectByDateOrder",
            type:"get",
            data:{"dateaa":datea,"datebb":dateb,"admin_id":id},
            dataType:"json",
            success:function (data){
                $("#TB #ss td").remove();
                $("#tol").remove();
                $.each(data,function (index, poem) {
                    var name = $("<td>").html(poem.room)
                    var price = $("<td>").html(poem.price)
                    var count = $("<td>").html(poem.count)
                    var day = $("<td>").html(poem.day)
                    var date = $("<td>").html(poem.date)
                    var xiaoji = $("<td>").html(poem.price*poem.day*poem.count)
                    var zhuangtai=$("<td>").html(poem.price_state)
                    var tr=$("<tr id='tt'>").append(name).append(price).append(count).append(day).append(date).append(xiaoji).append(zhuangtai)
                    $("#TB").append(tr);
                })
            }
        })
        $.ajax({
            url:"${app}/admin_orderController/selectByDateOrderPrice",
            type:"get",
            data:{"dateaa":datea,"datebb":dateb,"admin_id":id},
            dataType:"json",
            success:function (data){
                var total = $("<td>").html(data.total);
                var trr=$("<tr>").append(total);
                $("#TBB").append(trr);
            }
        })
    }
    $(function () {
        show();
        setInterval(function(){
            $(".add_blank").hide();
        });
    })
    function show(){
        var id = ${sessionScope.admin.id};
        $.ajax({
            url:"${app}/admin_orderController/selectAllOrder",
            type:"get",
            data:{"admin_id":id},
            dataType:"json",
            success:function (data) {
                $.each(data,function (index, poem) {
                    if(poem.price_state==0){
                        if(poem.state==0){
                            var name = $("<td>").html(poem.room)
                            var price = $("<td>").html(poem.price)
                            var count = $("<td>").html(poem.count)
                            var day = $("<td>").html(poem.day)
                            var date = $("<td>").html(poem.date)
                            var xiaoji = $("<td>").html(poem.price*poem.day*poem.count)
                            var Dingdan=$("<td><a>").html("入住用户")
                            var zhuangtai=$("<td>").html("未结算")
                            var tr=$("<tr id='ss'>").append(name).append(price).append(count).append(day).append(date).append(xiaoji).append(Dingdan).append(zhuangtai)
                            $("#TB").append(tr);
                        }else if(poem.state==1){
                            var name = $("<td>").html(poem.room)
                            var price = $("<td>").html(poem.price)
                            var count = $("<td>").html(poem.count)
                            var day = $("<td>").html(poem.day)
                            var date = $("<td>").html(poem.date)
                            var xiaoji = $("<td>").html(poem.price*poem.day*poem.count)
                            var Dingdan=$("<td><a>").html("入住用户")
                            var zhuangtai=$("<td>").html("未结算")
                            var tr=$("<tr id='ss'>").append(name).append(price).append(count).append(day).append(date).append(xiaoji).append(Dingdan).append(zhuangtai)
                            $("#TB").append(tr);
                        }else if(poem.state==2){
                            var name = $("<td>").html(poem.room)
                            var price = $("<td>").html(poem.price)
                            var count = $("<td>").html(poem.count)
                            var day = $("<td>").html(poem.day)
                            var date = $("<td>").html(poem.date)
                            var xiaoji = $("<td>").html(poem.price*poem.day*poem.count)
                            var Dingdan=$("<td><a>").html("待入住")
                            var zhuangtai=$("<td>").html("未结算")
                            var tr=$("<tr id='ss'>").append(name).append(price).append(count).append(day).append(date).append(xiaoji).append(Dingdan).append(zhuangtai)
                            $("#TB").append(tr);
                        }else if(poem.state==3){
                            var name = $("<td>").html(poem.room)
                            var price = $("<td>").html(poem.price)
                            var count = $("<td>").html(poem.count)
                            var day = $("<td>").html(poem.day)
                            var date = $("<td>").html(poem.date)
                            var xiaoji = $("<td>").html(poem.price*poem.day*poem.count)
                            var Dingdan=$("<td><a>").html("待确认")
                            var zhuangtai=$("<td>").html("未结算")
                            var tr=$("<tr id='ss'>").append(name).append(price).append(count).append(day).append(date).append(xiaoji).append(Dingdan).append(zhuangtai)
                            $("#TB").append(tr);
                        }else if(poem.state==4){
                            var name = $("<td>").html(poem.room)
                            var price = $("<td>").html(poem.price)
                            var count = $("<td>").html(poem.count)
                            var day = $("<td>").html(poem.day)
                            var date = $("<td>").html(poem.date)
                            var xiaoji = $("<td>").html(poem.price*poem.day*poem.count)
                            var Dingdan=$("<td><a>").html("拒接")
                            var zhuangtai=$("<td>").html("未结算")
                            var tr=$("<tr id='ss'>").append(name).append(price).append(count).append(day).append(date).append(xiaoji).append(Dingdan).append(zhuangtai)
                            $("#TB").append(tr);
                        }else if(poem.state==5){
                            var name = $("<td>").html(poem.room)
                            var price = $("<td>").html(poem.price)
                            var count = $("<td>").html(poem.count)
                            var day = $("<td>").html(poem.day)
                            var date = $("<td>").html(poem.date)
                            var xiaoji = $("<td>").html(poem.price*poem.day*poem.count)
                            var Dingdan=$("<td><a>").html("取消")
                            var zhuangtai=$("<td>").html("未结算")
                            var tr=$("<tr id='ss'>").append(name).append(price).append(count).append(day).append(date).append(xiaoji).append(Dingdan).append(zhuangtai)
                            $("#TB").append(tr);
                        }
                    }else if(poem.price_state==1){
                        if(poem.state==0){
                            var name = $("<td>").html(poem.room)
                            var price = $("<td>").html(poem.price)
                            var count = $("<td>").html(poem.count)
                            var day = $("<td>").html(poem.day)
                            var date = $("<td>").html(poem.date)
                            var xiaoji = $("<td>").html(poem.price*poem.day*poem.count)
                            var Dingdan=$("<td><a>").html("入住用户")
                            var zhuangtai=$("<td>").html("已结算")

                            var tr=$("<tr id='ss'>").append(name).append(price).append(count).append(day).append(date).append(xiaoji).append(Dingdan).append(zhuangtai)
                            $("#TB").append(tr);
                        }else if(poem.state==1){
                            var name = $("<td>").html(poem.room)
                            var price = $("<td>").html(poem.price)
                            var count = $("<td>").html(poem.count)
                            var day = $("<td>").html(poem.day)
                            var date = $("<td>").html(poem.date)
                            var xiaoji = $("<td>").html(poem.price*poem.day*poem.count)
                            var Dingdan=$("<td><a>").html("入住用户")
                            var zhuangtai=$("<td>").html("已结算")
                            var tr=$("<tr id='ss'>").append(name).append(price).append(count).append(day).append(date).append(xiaoji).append(Dingdan).append(zhuangtai)
                            $("#TB").append(tr);
                        }else if(poem.state==2){
                            var name = $("<td>").html(poem.room)
                            var price = $("<td>").html(poem.price)
                            var count = $("<td>").html(poem.count)
                            var day = $("<td>").html(poem.day)
                            var date = $("<td>").html(poem.date)
                            var xiaoji = $("<td>").html(poem.price*poem.day*poem.count)
                            var Dingdan=$("<td><a>").html("待入住")
                            var zhuangtai=$("<td>").html("已结算")
                            var tr=$("<tr id='ss'>").append(name).append(price).append(count).append(day).append(date).append(xiaoji).append(Dingdan).append(zhuangtai)
                            $("#TB").append(tr);
                        }else if(poem.state==3){
                            var name = $("<td>").html(poem.room)
                            var price = $("<td>").html(poem.price)
                            var count = $("<td>").html(poem.count)
                            var day = $("<td>").html(poem.day)
                            var date = $("<td>").html(poem.date)
                            var xiaoji = $("<td>").html(poem.price*poem.day*poem.count)
                            var Dingdan=$("<td><a>").html("待确认")
                            var zhuangtai=$("<td>").html("已结算")
                            var tr=$("<tr id='ss'>").append(name).append(price).append(count).append(day).append(date).append(xiaoji).append(Dingdan).append(zhuangtai)
                            $("#TB").append(tr);
                        }else if(poem.state==4){
                            var name = $("<td>").html(poem.room)
                            var price = $("<td>").html(poem.price)
                            var count = $("<td>").html(poem.count)
                            var day = $("<td>").html(poem.day)
                            var date = $("<td>").html(poem.date)
                            var xiaoji = $("<td>").html(poem.price*poem.day*poem.count)
                            var Dingdan=$("<td><a>").html("拒接")
                            var zhuangtai=$("<td>").html("已结算")
                            var tr=$("<tr id='ss'>").append(name).append(price).append(count).append(day).append(date).append(xiaoji).append(Dingdan).append(zhuangtai)
                            $("#TB").append(tr);
                        }else if(poem.state==5){
                            var name = $("<td>").html(poem.room)
                            var price = $("<td>").html(poem.price)
                            var count = $("<td>").html(poem.count)
                            var day = $("<td>").html(poem.day)
                            var date = $("<td>").html(poem.date)
                            var xiaoji = $("<td>").html(poem.price*poem.day*poem.count)
                            var Dingdan=$("<td><a>").html("取消")
                            var zhuangtai=$("<td>").html("已取消")
                            var tr=$("<tr id='ss'>").append(name).append(price).append(count).append(day).append(date).append(xiaoji).append(Dingdan).append(zhuangtai)
                            $("#TB").append(tr);
                        }

                    }
                })
            },

            "error":function () {
                alert("数据异常！请联系管理员！！！");
            }
        })
        $.ajax({
            url:"${app}/admin_orderController/selectAllOrderPrice",
            type:"get",
            data:{"admin_id":id},
            dataType:"json",
            success:function (data){
                var total = $("<td>").html(data.total);
                var trr=$("<tr id='tol'>").append(total);
                $("#TBB").append(trr);
            }
        })
    }

    function dateStart()
    {
        //月份对应天数
        MonHead = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

        //给年下拉框赋内容
        var y  = new Date().getFullYear();
        for (var i = (y-50); i < (y+50); i++) //以今年为准，前50年，后50年
            document.date.year.options.add(new Option(" "+ i +" 年", i));
        for (var i = (y-50); i < (y+50); i++) //以今年为准，前50年，后50年
            document.date.years.options.add(new Option(" "+ i +" 年", i));

        //给月下拉框赋内容
        for (var i = 1; i < 13; i++)
            document.date.month.options.add(new Option(" " + i + " 月", i));
        for (var i = 1; i < 13; i++)
            document.date.months.options.add(new Option(" " + i + " 月", i));
        document.date.year.value = y;
        document.date.month.value = new Date().getMonth() + 1;
        document.date.years.value = y;
        document.date.months.value = new Date().getMonth() + 1;
        var n = MonHead[new Date().getMonth()];
        if (  new Date().getMonth() ==1 && IsPinYear(yearvalue)  )
            n++;
        var j = MonHead[new Date().getMonth()];
        if (  new Date().getMonth() ==1 && IsPinYear(yearvalue)  )
            j++;
        writeDay(n); //赋日期下拉框
        writeDays(j);
        document.date.day.value = new Date().getDate();
        document.date.days.value = new Date().getDate();
    }

    if(document.attachEvent)
        window.attachEvent("onload", dateStart);
    else
        window.addEventListener('load', dateStart, false);

    function selectYear(str) //年发生变化时日期发生变化(主要是判断闰平年)
    {
        var monthvalue = document.date.month.options[document.date.month.selectedIndex].value;
        if (monthvalue == "")
        {
            var e = document.date.day;
            optionsClear(e);
            return;
        }
        var n = MonHead[monthvalue - 1];
        if (  monthvalue ==2 && IsPinYear(str)  )
            n++;
        writeDay(n);
    }

    function selectMonth(str)   //月发生变化时日期联动
    {
        var yearvalue = document.date.year.options[document.date.year.selectedIndex].value;
        if (yearvalue == "")
        {
            var e = document.date.day;
            optionsClear(e);
            return;
        }
        var n = MonHead[str - 1];
        if (  str ==2 && IsPinYear(yearvalue)  )
            n++;
        writeDay(n);
    }

    function writeDay(n)   //据条件写日期的下拉框
    {
        var e = document.date.day; optionsClear(e);
        for (var i=1; i<(n+1); i++)
            e.options.add(new Option(" "+ i + " 日", i));
    }
    function writeDays(j)   //据条件写日期的下拉框
    {
        var e = document.date.days; optionsClear(e);
        for (var i=1; i<(j+1); i++)
            e.options.add(new Option(" "+ i + " 日", i));
    }

    function IsPinYear(year)//判断是否闰平年
    {
        return(  0 == year%4 && ( year%100 !=0 || year%400 == 0 )  );
    }


    function optionsClear(e)
    {
        e.options.length = 1;

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

<div id="dd" style="text-align: center">


</div>
</html>