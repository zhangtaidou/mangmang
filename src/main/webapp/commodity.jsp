<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="app" value="${pageContext.request.contextPath}"></c:set>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>酒店商品</title>
    <meta charset="utf-8">

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">

    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="${app}/js/jquery-1.8.3.min.js"></script>



    <style>
        table {
            border-color: #00a2d4;
            height: 60px;
            text-align: center;
        }
        #table tr td{
            text-align: center;
            height: 60px;
        }
        th{
            text-align:center;
        }
        td{
            text-align: center;
        }
        input {
            text-align:center;
        }
    </style>
</head>
<body>
    <script>
        $(function () {
            var id=${sessionScope.admin.id}
                $("#table").empty();
            $.ajax({
                url:"${app}/commodity/selectAllCommodity",
                data:{"admin_id":id},
                dataType:"json",
                type:"post",
                success:function (data){

                    $.each(data, function (index, poem) {

                          var name = $("<td>").html(poem.name)
                          name.attr('style', "width: 11.1%")
                          //商品图片
                          var img_src = $("<img style=height:30px;width:40px; src="+poem.img_src+">");
                          var td=$("<td>");
                          td.append(img_src)
                          td.attr('style', "width: 11.1%")

                          var price = $("<td>").html(poem.price+"￥")
                                price.attr('style', "width: 11.1%")
                          var stock = $("<td>").html(poem.stock)
                                stock.attr('style', "width: 11.1%")
                          var sales = $("<td>").html(poem.sales)
                                sales.attr('style', "width: 11.1%")
                          var date = $("<td>").html(poem.date)
                                date.attr('style', "width: 11.1%")
                          var kind = $("<td>").html(poem.kind)
                                kind.attr('style', "width: 11.1%")

                          var operate = $("<td ><br> <input type='button' id='input' onclick='del ("+poem.id+")' value='删除' class='btn btn-danger'></td>")
                                operate.attr('style', "width: 20%")
                           var tr = $("<tr id='tr'>").append(name).append(td).append(price).append(stock).append(sales).append(date).append(kind).append(operate)
                                $("#table").append(tr)
                        })
                    },

                    error:function () {
                        //alert("数据异常！请联系管理员！！！");
                }
            })

        })

        function del (id) {
            $.ajax({
                url:'${app}/commodity/deleteCommodity',
                type:'post',
                data:{'id':id},
                datatype:'json',
            })
            alert("删除成功！")
            location.href="${app}/commodity.jsp";
        }
    </script>

    <%--模态框--%>
    <!-- 按钮：用于打开模态框 -->
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
        商品添加
    </button>
    <!-- 模态框 -->
    <form action="${app}/commodity/insertCommodity" method="post" enctype="multipart/form-data">
    <div class="modal fade" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- 模态框头部 -->
                <div class="modal-header">
                    <h4 class="modal-title">商品添加</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- 模态框主体 -->
                <div class="modal-body">
                    商品名称:<input type="text" value="" name="name">
                    商品价格:<input type="text" value="" name="price"><br><br>
                    商品库存:<input type="text" value="" name="stock">
                    商品销量:<input type="text" value="" name="sales"><br><br>
                    上架时间:<input type="text" value= <% Date date=new Date(); SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");%> <%=sdf.format(date)%> name="date">


                    <%--<input type="text" class="easyui-datetimebox" name="birthday"
                           data-options="required:true,showSeconds:false" value="3/4/2010 2:3" style="width:150px">
                    <input id="dt" type="te xt" name="birthday">--%>


                    所属分类:<input type="text" value="" name="kind"><br><br>
                    商品图片:<input type="file" name="file" id=""><%--<div style="position:absolute; bottom: 15px;left: 80px"></div>--%>
                    <input type="hidden" value=${sessionScope.admin.id} name="admin_id">
                </div>

                <!-- 模态框底部 -->
                <div class="modal-footer">
                    <button type="submit" class="btn btn-secondary" >提交</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                </div>

            </div>
        </div>
    </div>
    </form>
<%--    <script>
        $('#dt').datetimebox({
            value: '3/4/2010 2:3',
            required: true,
            showSeconds: false,
            /*timeSeparator:"-",*/
        });
        /*var data = $('#dt').datetimebox(setValue(),)
        alert(data)
        $('#dt').datetimebox('setValue', '6/1/2012 12:30:56');*/    // set datetimebox value
        var v = $('#dt').getHours('none')       // get datetimebox value
        alert(v);
    </script>--%>
    <%--模态框--%>

    <table table width="100%" border="2"cellpadding="2" cellspacing="1" >
        <tr>
            <th style="width: 11.1%">商品名称</th>
            <th style="width: 11.1%">商品图片</th>
            <th style="width: 11.1%">商品价格</th>
            <th style="width: 11.1%">商品库存</th>
            <th style="width: 11.1%">商品销量</th>
            <th style="width: 11.1%">上架时间</th>
            <th style="width: 11.1%">商品分类</th>
            <th style="width: 20%">操作</th>
        </tr>
    </table>
    <table id="table" table width="100%" border="2"cellpadding="2" cellspacing="1"  >
    </table>
</body>
</html>
