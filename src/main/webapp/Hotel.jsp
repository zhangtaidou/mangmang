<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="app" value="${pageContext.request.contextPath}"></c:set>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>查看酒店流水账单</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js"></script>
    <style>
        #Inp{
            outline-style: none ;
            border: 1px solid #ccc;
            border-radius: 3px;
            width: 500px;
            height: 50px;
            font-size: 20px;
            margin-left: 110px;
            margin-top: 20px;
        }
        #TB{
            text-align: center;
            color: #0d8ddb;
        }
    </style>
</head>
<body>
<div class="add_blank" >您有新的订单,请注意查看</div>
    <form name="date">
        <input id="name" type="text" name="name" placeholder="请输入酒店昵称" >
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
        <input type="button" class="btn btn-info" onclick="HoteShow()" value="查询"/>
        <input type="button" value="结算" class="btn btn-info" onclick="JieSuan()" />
    </form>

    <table id="TB" width="100%" border="2" cellspacing="1" cellpadding="1" class="table">
        <tr>
            <td>房间房型</td>
            <td>房间价格</td>
            <td>订房数量</td>
            <td>入住天数</td>
            <td>小计</td>
            <td>结算状态</td>
        </tr>
        <tbody id="td">

        </tbody>
    </table>

</body>
<script>
    $(function () {
        setInterval(function(){
            $(".add_blank").hide();
        });
    })
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
    function HoteShow() {
        var name=$("#name").val();
        var year=$("#year").val();
        var month=$("#month").val();
        var day=$("#day").val();
        var years=$("#years").val();
        var months=$("#months").val();
        var days=$("#days").val();
        var datea=year+"-"+month+"-"+day;
        var dateb=years+"-"+months+"-"+days;

        $.ajax({
            "url":"${app}/admin_orderController/selectByNameRoom",
            "type":"get",
            "data":{"name":name,"dateaa":datea,"datebb":dateb},
            "dataType":"json",
            "success":function (data) {
                $(data).each(function () {
                    if(this.price_state==0){
                        $("#td").append("<tr><td>"+this.room+"</td><td>"+this.price+"</td><td>"+this.count+"</td><td>"+this.day
                            +"</td><td>"+this.price*this.day*this.count+"</td><td><input type='button' value='未结算'  class='btn btn-info'></td></tr>");
                    }else if(this.price_state==1){
                        $("#td").append("<tr><td>"+this.room+"</td><td>"+this.price+"</td><td>"+this.count+"</td><td>"+this.day
                            +"</td><td>"+this.price*this.day*this.count+"</td><td><input type='button' value='已结算'  class='btn btn-info'></td></tr>");
                    }

                })
            },
            "error":function () {
                alert("请求结果异常");
            }
        })
    }
    function JieSuan() {
        var name=$("#name").val();
        var year=$("#year").val();
        var month=$("#month").val();
        var day=$("#day").val();
        var years=$("#years").val();
        var months=$("#months").val();
        var days=$("#days").val();
        var datea=year+"-"+month+"-"+day;
        var dateb=years+"-"+months+"-"+days;
        $.ajax({
            "url":"${app}/admin_orderController/updateByDateOrder",
            "data":{"dateaa":datea,"datebb":dateb},
            "type":"get",
            "dataType":"json",
            "error":function () {
                alert("程序异常 请检查接口 或者联系高级前端工程师 王新栋");
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
    setInterval("hello()",10000);<!--10秒定时请求一次-->
</script>

</html>
