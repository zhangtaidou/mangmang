<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="app" value="${pageContext.request.contextPath}"></c:set>

<html lang="en">
<head>

    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">

    <title>房间价格管理</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
    <link rel="shortcut icon" href="favicon.ico">
    <link href="${app}/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="${app}/css/animate.css" rel="stylesheet">
    <link href="${app}/css/style.css?v=4.1.0" rel="stylesheet">
    <script>
        $(function () {
            /*
            * 头部日期
            * */
            var d = new Date();
            var date = new Date(d);


            var weeks = ["日", "一", "二", "三", "四", "五", "六"];
            var year = d.getFullYear();
            //weeks[day7]
            $("#1").html(d.getMonth()+1+"/"+d.getDate());
            d.setDate(d.getDate() +1);
            $("#2").html( d.getMonth()+1+"/"+d.getDate());
            d.setDate(d.getDate() +1);
            $("#3").html( d.getMonth()+1+"/"+d.getDate());
            d.setDate(d.getDate() +1);
            $("#4").html(  d.getMonth()+1+"/"+d.getDate());
            d.setDate(d.getDate() +1);
            $("#5").html( d.getMonth()+1+"/"+d.getDate());
            d.setDate(d.getDate() +1);
            $("#6").html(  d.getMonth()+1+"/"+d.getDate());
            d.setDate(d.getDate() +1);
            $("#7").html(  d.getMonth()+1+"/"+d.getDate());
            var p = $("#p").html($("#1").text()+"-"+$("#7").text());
            var qian=$("<a><span class=\"glyphicon glyphicon-chevron-left\" aria-hidden=\"true\"></span></a>")
            qian.bind("click",{"param":-13},rili);
            var hou=$("<a><span class=\"glyphicon glyphicon-chevron-right\" aria-hidden=\"true\"></span></a>")
            hou.bind("click",{"param":1},rili);
            $("#rq").append(qian).append(p).append(hou)


            var day1 = year+"/"+$("#1").text();
            var day2 = year+"/"+$("#2").text();
            var day3 = year+"/"+$("#3").text();
            var day4 = year+"/"+$("#4").text();
            var day5 = year+"/"+$("#5").text();
            var day6 = year+"/"+$("#6").text();
            var day7 = year+"/"+$("#7").text();
            var arr=new Array(day1,day2,day3,day4,day5,day6,day7);
            /*
            * 获取所有房型
            * */

            fff(arr);
            function fff(arr){
            $.ajax({
                url:"${app}/datetimeprice/selectbyid",
                datatype:"json",
                type:"get",
                success:function (data) {
                    $.each(data, function (i, p) {
                        var span = $("<span class=\"caret\"></span>");
                        var fangt=$("<td align='center'>").html(p.name+"|"+"房量");
                        fangt.append(span)
                        var zyi = $("<td align='center'>").html(p.count);
                        var zer = $("<td align='center'>").html(p.count);
                        var zsan = $("<td align='center'>").html(p.count);
                        var zsi = $("<td align='center'>").html(p.count);
                        var zwu = $("<td align='center'>").html(p.count);
                        var zliu = $("<td align='center'>").html(p.count);
                        var zri = $("<td align='center'>").html(p.count);
                        var tr= $("<tr style='height: 60px'>").append(fangt).append(zyi).append(zer).append(zsan).append(zsi).append(zwu).append(zliu).append(zri)
                        tr.attr('id',p.name);
                        fangt.bind("click",{"name":p.name},none);
                        $("#thead").append(tr)

                        /*
                         * 模态框房型赋值
                         * */
                        var room_imput = $("<input type=\"checkbox\" value=\"option1\" name=\"room_na\">");
                        var room_span = $("<span>").html(p.name)
                        room_imput.attr('id',p.name);
                        room_imput.attr('value',p.name);
                        var room_label = $(" <label class=\"checkbox-inline\">").append(room_imput).append(room_span);
                        $("#room_name").append(room_label)
                            $.ajax({
                                url:"${app}/datetimeprice/selectByKind",
                                datatype:"json",
                                type:"post",
                                data:{"room_name":p.name,"admin_id":p.admin_id},
                                success:function (data) {
                                    $.each(data,function (i,k) {
                                        var a1=$("<td align='center'>").html(k.kind);
                                        /*
                                        * 获取当前时间
                                        * */

                                        var tr1 = $("<tr>");
                                        tr1.append(a1)

                                        $.ajax({
                                            url:"${app}/datetimeprice/selectdatetime",
                                            traditional: true,
                                            datatype:"json",
                                            type:"post",
                                            data:{"kind":k.kind,"date":arr,"name":p.name,"price":p.price,"admin_id":p.admin_id},
                                            success:function (data) {
                                                $.each(data,function (i,d) {
                                                    //1.页面回显
                                            var a2 = $("<td align='center'id='dtd'>").html(d.price);
                                            var vu = a2.text();
                                                    a2.attr('id',d.id+"jiage");
                                                    tr1.append(a2);
                                                    a2.bind("click",{"kind":k.kind,"date":d.date,"name":p.name,"id":d.id,"vu":vu},upd);
                                                })
                                            }
                                        })



                                        tr1.attr("style","height:60px;display:none;");
                                        tr1.attr('id',p.name+"none");
                                        tr.after(tr1);

                                    })
                                }
                            })
                    })
                }
            })
            }
            /*
            * 2.展开
            * */
            function none(n) {
                var name=n.data["name"];
                var style=$("#"+name+"none").attr('style');
                if (style=="height:60px;display:none;"){
                    $("#"+name+"none").attr('style',"height:60px;")
                } else {
                    $("#"+name+"none").attr('style',"height:60px;display:none;")
                }
            }
            /*
            * 3.修改房价
            * */

            function upd(n) {
                if($("#inp").length < 1){
                //获取td标签中价格的值
                var vue = n.data["vu"];
                var data_id = n.data["id"];

                // 创建input标签框
                var input = $("<input  class='input' type='text' id='inp' autofocus='autofocus' onkeyup=\"value=value.replace(/[^\\d.]/g,'')\">").attr('value',vue);
                var id = n.data["id"]
                $("#"+id+"jiage").append(input)

                //文档完全加载完后执行函数
                $(document).ready(function(){
                    //获取焦点
                    $("#inp").focus(function(){
                        $(this).css("background-color","#ffffff");
                    });
                    //失去焦点
                    $("#inp").blur(function(){
                        var aa=$("#inp").val()
                        $(this).parent().removeClass('input').html($(this).val() || 0);

                        $(this).css("background-color","#ffffff");

                        $.ajax({
                            url:"${app}/datetimeprice/updateprice",
                            datatype:"json",
                            type:"post",
                            data:{"price":aa,"id":data_id},

                        })
                    });
                });


            }
            }
            /*
            * 切换日期
            * */
            function rili(p) {
                var datum = p.data["param"];
                d.setDate(d.getDate() +datum);
                $("#1").html(d.getMonth()+1+"/"+d.getDate());
                d.setDate(d.getDate() +1);
                $("#2").html(d.getMonth()+1+"/"+d.getDate());
                d.setDate(d.getDate() +1);
                $("#3").html(d.getMonth()+1+"/"+d.getDate());
                d.setDate(d.getDate() +1);
                $("#4").html(d.getMonth()+1+"/"+d.getDate());
                d.setDate(d.getDate() +1);
                $("#5").html(d.getMonth()+1+"/"+d.getDate());
                d.setDate(d.getDate() +1);
                $("#6").html(d.getMonth()+1+"/"+d.getDate());
                d.setDate(d.getDate() +1);
                $("#7").html(d.getMonth()+1+"/"+d.getDate());
               $("#p").html($("#1").text()+"-"+$("#7").text());

                var day1 = year+"/"+$("#1").text();
                var day2 = year+"/"+$("#2").text();
                var day3 = year+"/"+$("#3").text();
                var day4 = year+"/"+$("#4").text();
                var day5 = year+"/"+$("#5").text();
                var day6 = year+"/"+$("#6").text();
                var day7 = year+"/"+$("#7").text();
                var arr=new Array(day1,day2,day3,day4,day5,day6,day7);
                $("#riqi").nextAll().remove();
                fff(arr);
            }




        })
    </script>
</head>
<body>
    <%--左侧日期--%>
    <table class="table table-bordered">
        <thead id="thead">
            <tr style="height: 60px" id="riqi">
                <th id="rq" style="width: 12.5%;text-align: center">
                    <span id="p"></span>
                </th>
                <th id="1" style="width: 12.5%;text-align: center"></th>
                <th id="2" style="width: 12.5%;text-align: center"></th>
                <th id="3" style="width: 12.5%;text-align: center"></th>
                <th id="4" style="width: 12.5%;text-align: center"></th>
                <th id="5" style="width: 12.5%;text-align: center"></th>
                <th id="6" style="width: 12.5%;text-align: center"></th>
                <th id="7" style="width: 12.5%;text-align: center"></th>
            </tr>
        </thead>

    </table>


    <!-- Button trigger modal -->
    <div class="container-fluid" id="dmodal">
        <div class="pull-right" style="float: left">
            <button type="button" id="button1" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
                批量设置房间价格
            </button>

            <!-- Modal -->
            <div class="modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h3 class="modal-title" id="myModalLabel">批量设置价格</h3>
                        </div>
                        <%--房型--%>

                        <div class="modal-body">
                            <div id="room_name">
                                <span class="modal-title" style="font-weight: bolder" id="room_nameq">选择房型:</span>
                            </div>
                        </div>
                        <%--kind--%>
                        <div class="modal-body">
                            <div id="kind_name">
                                <span class="modal-title" style="font-weight: bolder" id="kindq">选择价格类型:</span>
                                <label class="checkbox-inline">

                                    <input type="checkbox" name="box" id="room1" value="无早"> 无早
                                </label>

                                <label class="checkbox-inline">

                                    <input type="checkbox" name="box" id="room2" value="单早"> 单早
                                </label>

                                <label class="checkbox-inline">

                                    <input type="checkbox" name="box" id="room3" value="双早"> 双早
                                </label>


                            </div>
                        </div>

                        <%--价格--%>
                        <div class="modal-body">
                            房价价格:<input type="number" name="price" id="price">
                        </div>


                        <%--日期--%>
                        <form name="date">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="modal-title" style="font-weight: bolder">选择房型:</span>
                            <select name="year" id="year" onchange="selectYear(this.value)">
                                <option value="">选择 年</option>
                            </select>
                            <select name="month" id="month" onchange="selectMonth(this.value)">
                                <option value="">选择 月</option>
                            </select>
                            <select name="day" id="day">
                                <option value="">选择 日</option>
                            </select>
                            <%--<jsp:text>---</jsp:text>--%>
                            <select name="years" id="years" onchange="selectYear(this.value)">
                                <option value="">选择 年</option>
                            </select>
                            <select name="months" id="months" onchange="selectMonth(this.value)">
                                <option value="">选择 月</option>
                            </select>
                            <select name="days" id="days">
                                <option value="">选择 日</option>
                            </select>
                        </form>



                        <div class="modal-footer">
                            <button type="button" class="btn btn-group" data-dismiss="modal">取消</button>
                            <button type="button" id="btn" class="btn btn-primary" data-dismiss="modal">确定</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script language="JavaScript">
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


            $("#btn").click(function Time() {
                var id = ${sessionScope.admin.id};
                var year=$("#year").val();
                var month=$("#month").val();
                var day=$("#day").val();
                var years=$("#years").val();
                var months=$("#months").val();
                var days=$("#days").val();
                var datea=year+"/"+month+"/"+day;
                var dateb=years+"/"+months+"/"+days;

                //获取input中的价格
                var pri = $("#price").val();
                //定义room_name的数组  数组中有：选择房型的值
                var room_named =[];//定义一个数组
                $('input[name="room_na"]:checked').each(function(){//遍历每一个名字为box的复选框，其中选中的执行函数
                    room_named.push($(this).val());//将选中的值添加到数组chk_value中
                });
                //定义chk_value的数组  数组中：选择价格类型的值
                var chk_value =[];//定义一个数组
                $('input[name="box"]:checked').each(function(){//遍历每一个名字为box的复选框，其中选中的执行函数
                    chk_value.push($(this).val());//将选中的值添加到数组chk_value中
                });
                Date.prototype.format = function() {
                    var s = '';
                    s += this.getFullYear() + '/'; // 获取年份。
                    if((this.getMonth() + 1) >= 10) {// 获取月份。
                        s += (this.getMonth() + 1) + "/";
                    } else {
                        s += "0" + (this.getMonth() + 1) + "/";
                    }
                    if(this.getDate() >= 10) {// 获取日。
                        s += this.getDate();
                    } else {
                        s += "0" + this.getDate();
                    }
                    return(s); // 返回日期。
                };

                var ab = datea.split("/");
                var ae = dateb.split("/");
                var db = new Date();
                db.setUTCFullYear(ab[0], ab[1]-1, ab[2]);
                var de = new Date();
                de.setUTCFullYear(ae[0], ae[1]-1, ae[2]);
                /*
                *
                * */
                var unixDb=db.getTime();
                var unixDe=de.getTime();
                var arr=new Array();
                arr.push(datea);
                arr.push(dateb);
                for(var k=unixDb+24*60*60*1000;k<unixDe;){
                    var ss = (new Date(parseInt(k))).format();
                    k = k + 24 * 60 * 60 * 1000;
                    arr.push(ss);
                }
                /*var room_names= new Array();
                room_names.push(room_named);
                alert(room_names)*/
                $.ajax({
                    url:"${app}/datetimeprice/updateByprice",
                    type:"post",
                    traditional:true,
                    //data:{"list":list,"dateb":dateb,"admin_id":id,"room_name":room_nameq,"kind":kindq},
                    data:{"date":arr,"admin_id":id,"room_name":room_named,"kind":chk_value,"price":pri},
                    dataType:"json",
                    success:function (data){
                        $("#TB #ss td").remove();
                        $("#tol").remove();
                        $.each(data,function (index, poem) {
                            var name = $("<td>").html(poem.room)
                            var price = $("<td>").html(poem.price)
                            var count = $("<td>").html(poem.count)
                            var day = $("<td>").html(poem.day)
                            var xiaoji = $("<td>").html(poem.price*poem.day*poem.count)
                            var zhuangtai=$("<td>").html(poem.price_state)
                            var tr=$("<tr id='tt'>").append(name).append(price).append(count).append(day).append(xiaoji).append(zhuangtai)
                            $("#TB").append(tr);

                        })
                    }
                })
            })
        </script>
        <%--第二个模态框 --%>
</body>
</html>


