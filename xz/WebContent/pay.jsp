<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix="t" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0 ,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<title>结算页面</title>
<link rel="apple-touch-icon"
	href="https://upzip.b0.upaiyun.com/website/3.6.0/icons/logo1@128.png">
<link rel="shortcut icon"
	href="https://upzip.b0.upaiyun.com/website/3.6.0/favicon.ico">
<link
	href="https://upzip.b0.upaiyun.com/website/3.6.0/styles/showindex.css?1ea0a1186d1c01821d51"
	rel="stylesheet">

<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />

<script src="js/jquery.min.js"></script>
<!-- Custom Theme files -->
<link href="css/mainshow.css" rel="stylesheet" type="text/css"
	media="all" />
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript">
	$(function() {
		 $.ajaxSetup({  
			    async : false  
			});  
		//得到大类型
		$.get("${path}/TypesServlet", {
			"op" : "unittype"
		}, function(TypesData, status) {

			$.each(TypesData, function(index, type) {
				var goodtypes = "goodtypes" + index + "";
				
				$(".typeshow").append(
						"<div class='col1'><div id="+goodtypes+" class='h_nav'><h4>"
								+ type.TYPENAME + "</h4></div></div>");
				//得到小类型 
				var typename = type.TYPENAME;
				var a = new Array();
				$.get("${path}/TypesServlet", {
					"op" : "unittypemes",
					"typename" : typename
				}, function(TypemesData, status) {

					$.each(TypemesData, function(index, typemes) {
						$("#" + goodtypes + "").append(
								"<li><a href='products.html' style='color: black;'>"
										+ typemes.TYPEMESNAME + "</a></li>");
						$("#" + goodtypes + "").append("</br>");
					});
				});

			});
		});
	});
</script>
<meta name="keywords"
	content="BOX SHOP Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript">

						 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 

</script>
<!--webfont-->
<link
	href='http://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic'
	rel='stylesheet' type='text/css'>
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>
<!-- start menu -->

<link href="css/amazeui.css" rel="stylesheet" type="text/css" />

<link href="css/cartstyle.css" rel="stylesheet" type="text/css" />

<link href="css/jsstyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/address.js"></script>
<!--
        	begin：新增地址省级市区的js连接
        -->
<link href="css/city.css" rel="external nofollow"
	rel="external nofollow" rel="stylesheet" type="text/css" />
<script src="js/jquery-2.1.0.js"></script>
<script src="js/distpicker.data.js"></script>
<script src="js/distpicker.js"></script>
<!--
        	end：新增地址省级市区的js连接
        -->

<!--
        	作者：offline
        	时间：2017-10-13
        	描述：订单
        -->

<link href="css/Orders.css" rel="stylesheet" type="text/css" />
<script src="js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
<script src="js/jquery.reveal.js" type="text/javascript"></script>
<script src="js/jquery.sumoselect.min.js" type="text/javascript"></script>
<script src="js/common_js.js" type="text/javascript"></script>
<script src="js/footer.js" type="text/javascript"></script>
<script src="js/jquery.jumpto.js" type="text/javascript"></script>
<link href="css/megamenu.css" rel="stylesheet" type="text/css"
	media="all" />
<script type="text/javascript" src="js/megamenu.js"></script>
<script>
	$(document).ready(function() {
		$(".megamenu").megamenu();
	});
</script>
<style type="text/css">
input::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
	-webkit-appearance: none !important;
	margin: 0;
}
</style>
</head>
<script type="text/javascript">
	$(function() {
		//显示收货地址
	
		function showGoodPosition(pd,status){
			$(".a").find("li").remove();
			$.each(pd,function(index, GP) {
				var str ="<li class='user-addresslist defaultAddr'>" 
				+"<div class='address-left'>"
				+ "<div class='user DefaultAddr '>"
				+"<input type='hidden' id='GPID' value='"+GP.GPID+"'>"
				+ "<span class='buy-address-detail'> <span class='buy-user'>"
				+ GP.GPNAME
				+ "</span> <span class='buy-phone'>"
				+ GP.GPPHONE
				+ "</span></span></div>"
				+ "<div class='default-address DefaultAddr'>"
				+ "<span class='buy-line-title buy-line-title-type'>"
				+ "收货地址：</span></br> <span class='buy--address-detail'>"
				+ "<span class='street '>"
				+ GP.GPPOSITOIN
				+ "</span></span></div>"
				+ "</div>"
				+ "<div class='address-right'><a href='address.html'>"
				+ "<span class='am-icon-angle-right am-icon-lg'>"
				+ "</span></a></div><div class='clearfix'></div>"
				+ "<div class='new-addr-btn'>"
				+ "<a href='' class='del'>删除</a>"
				+ "</div></li>";
				
				var str2 ="<li class='user-addresslist'>" 
					+"<div class='address-left'>"
					+ "<div class='user DefaultAddr '>"
					+"<input type='hidden' id='GPID' value='"+GP.GPID+"'>"
					+ "<span class='buy-address-detail'> <span class='buy-user'>"
					+ GP.GPNAME
					+ "</span> <span class='buy-phone'>"
					+ GP.GPPHONE
					+ "</span></span></div>"
					+ "<div class='default-address DefaultAddr'>"
					+ "<span class='buy-line-title buy-line-title-type'>"
					+ "收货地址：</span></br> <span class='buy--address-detail'>"
					+ "<span class='street '>"
					+ GP.GPPOSITOIN
					+ "</span></span></div>"
					+ "</div>"
					+ "<div class='address-right'><a href='address.html'>"
					+ "<span class='am-icon-angle-right am-icon-lg'>"
					+ "</span></a></div><div class='clearfix'></div>"
					+ "<div class='new-addr-btn'>"
					+ "<a href='' class='del'>删除</a>"
					+ "</div></li>";
				if(index==0){
					$(".a").append(str);
				}else{
					$(".a").append(str2);
				}
				 
			});
			$(".user-addresslist").on("click",function() {
				$(this).addClass("defaultAddr").siblings().removeClass("defaultAddr");
			}); 
		}
		//收货地址动态生成
		$.get("GoodPositionServlet",{"op":"select"},function(pd, status) {
			showGoodPosition(pd, status);
			//点击选择收货地址
			
			//删除收货地址
			 $(".del").on("click",function(){
				 	if($(".defaultAddr").length==1){
				 		alert("请至少保留一条收货地址");
				 	}else{
					var gpid=$(this).parent().parent().find("#GPID").val();
					var flag=confirm("是否要删除该地址");
					if(flag){
						$.get("GoodPositionServlet",{"op":"del","gpid":gpid},function(pd, status){
							showGoodPosition(pd, status);
						});
					}
				 	}
				});
			//收货人框失去焦点
			 $("#user-name").blur(function(){
				var user_name= $("#user-name").val();
				if(user_name==""){
					$("#user-name").css("border-color","red");
					$("#yzname").text("收件人姓名不能为空");
				}else{
					$("#user-name").css("border-color","green");
				}
			 });
			//收货人框得到焦点
				$("#user-name").focus(function(){
					$("#yzname").text("");
					$("#user-name").attr("placeholder","收货人");
					$("#user-name").css("border-color","lightblue");
				});
			//手机框失去焦点
				$("#user-phone").blur(function(){
					var user_phone=$("#user-phone").val();
					var ss=user_phone.search(/[0-9]{11}/i);
					if(ss){
						$("#user-phone").css("border-color","red");
						$("#yzphone").text("电话不合法");
					}else{
						$("#user-phone").css("border-color","green");
					}
				});
			//手机框得到焦点
				$("#user-phone").focus(function(){
					$("#user-phone").css("border-color","lightblue");
					$("#yzphone").text("");
			});	
			$('.theme-login').on('click',function(){
				$("#user-name").val("");
				$("#user-phone").val("");
				$("#user-intro").val("");
				$("#yzphone").text("");
				$("#yzname").text("");
				$("#user-name").css("border-color","default");
				$("#user-phone").css("border-color","default");
				
			})
			//新增收货地址
			$(".save").on("click",function(){
				var address="";
				var user_name= $("#user-name").val();
				var user_phone=$("#user-phone").val();
				var province1alert=$("#province1").val();
				var city1=$("#city1").val();
				var district1=$("#district1").val();
				var user_intro=$("#user-intro").val();
				address=province1alert+city1+district1+user_intro;
				if(user_name==""){
					$("#user-name").css("border-color","red");
					$("#yzname").text("收件人姓名不能为空");
				}
				else{
					var ss=user_phone.search(/[0-9]{11}/i);
					if(ss){
						$("#user-phone").css("border-color","red");
						$("#yzphone").text("电话不合法");
					}else{
						$.get("GoodPositionServlet",{"op":"add","user_name":user_name,"user_phone":user_phone,"address":address},function(pd, status){
							$(document.body).css("overflow","visible");
							$('.theme-login').removeClass("selected");
							$('.item-props-can').removeClass("selected");					
							$('.theme-popover-mask').hide();
							$('.theme-popover').slideUp(200);
							showGoodPosition(pd, status);
						});
					}
					
				}
				
			});
		
		});
		//订单清单
		function order(pd, status){
			$("tbody").children().remove;
			var sum = 0;
			$.each(pd,function(index, VSS) {
				VSS.TOTALPRICE=VSS.GOODSCOUNT*VSS.GOODPRICE;
				var str = '<tr><td class="Product_info">'
				+ '<a href="#"><img src="'+VSS.GOODPIC+'" width="100px" height="100px" /></a>'
				+ '<a href="#" class="product_name">'
				+ VSS.GOODTITLE
				+ '</a></td>'
				+ '<td><i>￥</i>'
				+ VSS.ORIGINALPRICE
				+ '</td>'
				+ '<td><i>￥</i>'
				+ VSS.GOODPRICE
				+ '</td>'
				+ '<td class="count">'
				+ VSS.GOODSCOUNT
				+ '</td>'
				+ '<td class="Moneys"><i>￥</i>'
				+ VSS.TOTALPRICE
				+ '</td><input type="hidden" id="GOODSELER" value="'+VSS.GOODSELER+'">'
				+'<input type="hidden" class="GOODID" value="'+VSS.GOODID+'">'
				+'<input type="hidden" class="USERID" value="'+VSS.USERID+'">'
				+'<input type="hidden" class="SCID" value="'+VSS.SCID+'">'
				+'<input type="hidden" class="USERBALANCE" value="'+VSS.USERBALANCE+'">'
				+'</tr>';
				$("tbody").append(str);
				sum = sum + VSS.TOTALPRICE;
			});
				var str1 = '<ul><li><label>商品总价</label><i>￥</i><span class="summoney">'
					+ sum
					+ '</span></li>'
					+ '<li class="shiji_price"><label>实&nbsp;&nbsp;付&nbsp;&nbsp;款</label><i>￥</i><span>'
					+ sum + '</span></li></ul>';
				$(".right_direction").append(str1);
		}
		//获得订单
		$.post("ViewShoppingCartServlet",function(pd, status) {
			order(pd,status);
		});
		
			
	});
</script>
<script type="text/javascript">
	$(function(){
		//结算
		$(".shop").on("click",function(){
			//添加订单
			var i=0;
			//订单总金额
			var summoney=$("body").find(".summoney").text();
			//当前用户余额
			var USERBALANCE=$("body").find(".USERBALANCE").val();
			//当前用户编号
			var USERID=$("body").find(".USERID").val();
			//t当前时间，用于ajax get请的缓冲
			var t = new Date().getTime();
			if($(".defaultAddr").length==0){
				alert("请至少选择一个收获地址");
			}else{
				 //结算之后更改用户余额
				if(summoney-USERBALANCE>0){
					alert("余额不足请充值");
					location.href="addBalance.jsp"
				}
				else{
					 $.ajaxSetup({  
						    async : false
						});  
					$.get("ShoppingServlet",{"op":"Balance","USERID":USERID,"summoney":summoney},function(){
						
					});
					//遍历tr得到每个商品的信息
					$("tbody").find("tr").each(function(){
						//商品卖家的id
						var GOODSELER=$(this).find("#GOODSELER").val();
						//留言
						var liuyan=$("#liuyan").val();
						//选择的地址的id
						var GPID=$(".defaultAddr").find("#GPID").val();
						//购买数量
						var count=$(this).find(".count").html();
						//商品id
						var GOODID=$(this).find(".GOODID").val();
						//购物车id
						var SCID=$(this).find(".SCID").val();
						
						
						//结算之后更改商品里的库存
							$.get("ShoppingServlet",{"op":"update","GOODID":GOODID,"t":t,"count":count},function(pd,status){
								
							});
						 //添加订单，添加订单详情
						 $.get("OrderServlet",{"op":"add","GOODSELER":GOODSELER,"liuyan":liuyan,"GPID":GPID,"count":count,"GOODID":GOODID,"USERID":USERID,"r":t},function(pd, status){
							
						}); 
						//结算之后删除购物车里的东西
						$.get("ShoppingServlet",{"op":"del","SCID":SCID,"t":t},function(pd,status){
							
						});
						$.get("ShoppingServlet",{"op":"addmes","GOODSELER":GOODSELER,"USERID":USERID,"t":t,"GOODID":GOODID},function(pd,status){
							
						});
					});
					 $.ajaxSetup({  
						    async : true
						}); 
					alert("付款成功");
					location.href="account.jsp?inorout=in&state=待发货";
					
				} 
			}
			
		
		});
		//取消订单
		function goBack() {
			window.history.back();
		}
	});
</script>
<body>
	<div class="header">
		<div class="top-header">
			<div class="wrap">
				<div class="header-left">
					<ul>
						<li><a href="#">联系我们 </a></li> |
						<li><a href="">欢迎你：${sessionScope.user1}</a></li>
					</ul>
				</div>
				<div class="header-right">
					<ul>
						<li><a href="mainshow.jsp">HOME</a></li>
						<li><i class="user"></i> <a href="account_message.jsp">我的</a></li>
						<li class="login"><i class="lock"></i> <a id="login">登录</a>|
							<a id="Writeoff">注销</a> <a href="reg.jsp">我要注册</a></li>
						<li><i class="heart"></i> <a href="mylike.jsp">收藏</a>
						<li class="last" id="mylikecount">0</li>
						</li>
						<li><i class="cart"></i> <a href="shoppingcart.jsp">购物车</a> <!-- 购物车数量 -->
						</li>
						<li class="last" id="mysccount">0</li>
					</ul>
					<div class="sign-up-right">
						<a href=""></a>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<div class="wrap">
			<div class="header-bottom">
				<div class="logo">
					<a href="mainshow.jsp"><img src="images/logo.png"
						class="img-responsive" alt="" /></a>
				</div>
				<div class="search"></div>
				<div class="clearfix"></div>
			</div>
		</div>
		</br>
<hr style="background-color: #3694C7; height: 1px;" />
</br>

		<div class="wrap"></div>

		<div class="clearfix"></div>
		<!--地址 -->
		<div class="paycont">
			<div class="address">
				<h3>确认收货地址</h3>
				<div class="control">
					<div class="tc-btn createAddr theme-login am-btn am-btn-danger">使用新地址</div>
				</div>
				<div class="clearfix"></div>
				<ul class="a">

				</ul>
			</div>
			<!--订单内容 -->
			<div class="concent">
				<div id="payTable">
					<h3>确认订单信息</h3>
					<!--产品列表-->
					<div class="Product_List">
						<table>
							<thead>
								<tr class="title">
									<td class="name">商品名称</td>
									<td class="price">商品价格</td>
									<td class="Preferential">优惠价</td>
									<td class="Quantity">购买数量</td>
									<td class="Money">金额</td>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
						<div class="Pay_info">
							<label>买家留言</label><input name="liuyan" id="liuyan" type="text"
								onkeyup="checkLength(this);" class="text_name " /> <span
								class="wordage">剩余字数：<span id="sy" style="color: Red;">50</span></span>
						</div>
						<!--价格-->
						<div class="price_style">
							<div class="right_direction"></div>
						</div>
					</div>

					<!--信息 -->
					<div class="order-go clearfix">
						<div class="pay-confirm clearfix">
							<div id="holyshit269" class="submitOrder">
								<div class="go-btn-wrap">
									<a id="J_Go " class="btn-go shop" tabindex="0"
										title="点击此按钮，提交订单">提交订单</a> <a id="J_Go"
										href="shoppingcart.jsp" class="btn-go" tabindex="0"
										title="点击此按钮，取消订单" style="margin-right: 15px;">取消订单</a>
								</div>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>

				<div class="clearfix"></div>
			</div>
		</div>
	
		<!--
            	作者：offline
            	时间：2017-10-12
            	描述：新增地址模态窗
            -->

		<div class="theme-popover-mask"></div>
		<div class="theme-popover" id="theme-popover">
			<!--标题 -->
			<div class="am-cf am-padding">
				<div class="am-fl am-cf">
					<strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add
						address</small>
				</div>
			</div>
			<hr />

			<div class="am-u-md-12">
				<form class="am-form am-form-horizontal">

					<div class="am-form-group">
						<label for="user-name" class="am-form-label">收货人</label>
						<div class="am-form-content">
							<input type="text" id="user-name" placeholder="收货人">
						</div>
					</div>
					<div class="am-form-content">
						<p id="yzname"></p>
					</div>

					<div class="am-form-group">
						<label for="user-phone" class="am-form-label">手机号码</label>
						<div class="am-form-content">
							<input id="user-phone" placeholder="收货人联系电话" type="number">
						</div>
					</div>
					<div class="am-form-content">
						<p id="yzphone"></p>
					</div>

					<div class="am-form-group">
						<label for="user-phone" class="am-form-label">所在地</label>
						<div data-toggle="distpicker">
							<div class="am-form-content address">
								<select class="am-form-control" id="province1"></select> <select
									class="am-form-control" id="city1"></select> <select
									class="am-form-control" id="district1"></select>
							</div>
						</div>
					</div>

					<div class="am-form-group">
						<label for="user-intro" class="am-form-label">详细地址</label>
						<div class="am-form-content">
							<textarea class="" rows="3" id="user-intro" placeholder="输入详细地址"></textarea>
							<small>100字以内写出你的详细地址...</small>
						</div>
					</div>

					<div class="am-form-group theme-poptit">
						<div class="am-u-sm-9 am-u-sm-push-3">

							<div class="am-btn am-btn-danger save">保存</div>
							<div class="am-btn am-btn-danger close">取消</div>
						</div>
					</div>
				</form>
			</div>

		</div>
		<div class="clearfix"></div>
		<div class="clearfix"></div>

	</div>
	<div class="footer">
		<div class="wrap">
			<div class="contact-section">
				<div class="col-md-4 follow text-center">
					<h3>
						<i class="shipping-icon"></i>免费购物
					</h3>
					<p>足不出户就能看到网站上的动态信息，根据商品的真实照片，性能介绍，买卖家信息，卖出或买到自己闲置商品。</p>
				</div>
				<div class="col-md-4 subscribe text-center">
					<h3>
						<i class="correct-icon"></i>100 %便捷可靠
					</h3>
					<p>随时随刻发布自己闲置物品，换取等值物品或者出售得到经济利益。</p>
				</div>
				<div class="col-md-4 help text-center">
					<h3>
						<i class="return-icon"></i>社交方式
					</h3>
					<p>不仅能让物品“值”起来，而且能促进人与人之间的沟通。二手购物是一种效率很高的社交方式。</p>

				</div>
				<div class="clearfix"></div>
			</div>

			<div class="cards text-center">
				<img src="images/cards.jpg" alt="" />
			</div>
			<div class="copyright text-center">
				<p>
					Copyright &copy; 中软国际开发九 | Projects by <a
							href="daomai.jsp"> 倒买倒卖组</a>
				</p>
			</div>

		</div>
	</div>
	<script type="text/javascript">
		function checkLength(which) {
			var maxChars = 50; //
			if (which.value.length > maxChars) {
				alert("您出入的字数超多限制!");
				// 超过限制的字数了就将 文本框中的内容按规定的字数 截取
				which.value = which.value.substring(0, maxChars);
				return false;
			} else {
				var curr = maxChars - which.value.length; //250 减去 当前输入的
				document.getElementById("sy").innerHTML = curr.toString();
				return true;
			}
		}
	</script>
	<script>
		$(function() {
			$(':input').labelauty();
			(function(){
				if(${sessionScope.user1!=null}){
					  $("#userName").val("${sessionScope.user1}");
					  $("#login").css("display","none");
					 
					  $("#Writeoff").css("display","display");
					  getinfo();
				  }else{
					  $("#Writeoff").css("display","none");
				  }
			})();
			function getinfo(){
				//获取个人收藏数目
				 $.get("LikeServlet",{"op":"unitlike"},function(Likecount,status){
					 
					 $("#mylikecount").text(Likecount);
				 });
				
				//动态显示购物车 数量 
				 $.get("CartServlet",{"op":"unitcart"},function(cartcount,status){
					 $("#mysccount").text(cartcount);
				 });};
		});
	</script>
</body>

</html>