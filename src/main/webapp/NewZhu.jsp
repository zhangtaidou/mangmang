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
	  <div id='Sou'>
		  <form>
			  <input type="text" name='phone' id="phone" placeholder="请输入手机号" class="bt1">
			  <input type="text"  name='user_name' id="name" placeholder="请输入姓名" class="bt2">
			  <input type="button" value="查询" class="btn btn-info" onclick="sels()">
		  </form>
	  </div>
	  <div>
		<table id="TB" class="table"  width="100%" border="2"cellpadding="2" cellspacing="1"  >
		<tr>
			<th>客户姓名</th>

			<%--<th>客户手机号</th>--%>

			<%--<th>身份证号码</th>--%>

			<th>入驻时间</th>

			<th>房间价格</th>

			<th>房间房型</th>

			<th>房间数量</th>

			<th>入住天数</th>

			<th colspan="3">操作</th>

		</tr>

			<tbody id="ty">

			</tbody>
	</table>

	  </div>
  </div>
  </body>
<script>
	function sels(){
		var id = ${sessionScope.admin.id};
		var admin_id = ${sessionScope.admin.id};
		var phone=$("#phone").val();
		var name=$("#name").val();
		$.ajax({
			"url":"${app}/admin_orderController/selectByUserIdentiFication",
			"type":"post",
			"data":{"id":id,"phone":phone,"user_name":name,"admin_id":admin_id},
			"dataType":"json",
			"success":function (data) {
				$("#ty").text("  ");
				$(data).each(function () {
					// var price=this.price+this.price*0.1
					$("#ty").append("<tr><td>"+this.user_name+"</td>"+
							// "<td>"+this.phone+"</td>" +
							// "<td>"+this.user_id+"</td>" +
							"<td>"+this.date+"</td>" +
							"<td>"+this.price+"</td>" +
							"<td>"+this.room+"</td>"+
							"<td>"+this.count+"</td>"+
							"<td>"+this.day+"</td>" +
							"<td><input type='button' value='用户入住' onclick='ruzhu("+this.id+")' class='btn btn-info'></td>"+
							"<td><input type='button' value='用户退款' onclike='tuikuan("+this.id+")' class='btn btn-info'></td></tr>"
					);
				})
			},
			"error":function () {
				alert("数据异常！请联系管理员！！！");
			}
		})
	}
	function ruzhu(id){
		$.ajax({
			"url":"${app}/admin_orderController/updateState",
			"type":"get",
			"data":{"id":id},
			"dataType":"json",
			"error":function () {
				alert("数据异常！请联系管理员！！！");
			}
		})
		location.href="${app}/RuZhuYH.jsp";
	}
	$(function () {
		var id = ${sessionScope.admin.id};
		$.ajax({
			"url":"${app}/admin_orderController/selectAllOrder",
			"type":"get",
			"data":{"admin_id":id},
			"dataType":"json",
			"success":function (data) {
				$(data).each(function () {
					if(this.state==0){
						$("#ty").append("<tr><td>"+this.user_name+"</td>"+
								// "<td>"+this.phone+"</td>" +
								// "<td>"+this.user_id+"</td>" +
								"<td>"+this.date+"</td>" +
								"<td>"+this.price+"</td>" +
								"<td>"+this.room+"</td>"+
								"<td>"+this.count+"</td>"+
								"<td>"+this.day+"</td>"+
								"<td><input type='button' value='确认入住' onclick='ruzhu("+this.id+")' class='btn btn-info'></td>"+
								"<td><input type='button' value='用户退款' onclike='tuikuan("+this.id+")' class='btn btn-info'></td></tr>"
						);
					}else if(this.state==1) {
						// var price=this.price+this.price*0.1
						$("#ty").append("<tr><td>" + this.user_name + "</td>" +
								// "<td>" + this.phone + "</td>" +
								// "<td>" + this.user_id + "</td>" +
								"<td>" + this.date + "</td>" +
								"<td>" + this.price + "</td>" +
								"<td>" + this.room + "</td>" +
								"<td>" + this.count + "</td>" +
								"<td>" + this.day + "</td>" +
								"<td><input type='button' value='用户退房' onclick='ruzhu(" + this.id + ")' class='btn btn-info'></td>" +
								"<td><input type='button' value='用户退款' onclike='tuikuan(" + this.id + ")' class='btn btn-info'></td></tr>"
						);
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