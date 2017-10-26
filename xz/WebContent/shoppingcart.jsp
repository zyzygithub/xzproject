<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${requestScope.bin==null}">
	<jsp:forward page="CartServlet2?op=ck"></jsp:forward>
</c:if>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/mainshow.css" />
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<link rel="stylesheet"
	href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
<script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/shopcart.css" />
<!--  <script src="js/shopcart.js" type="text/javascript" charset="utf-8"></script> -->
<script type="text/javascript">
 $(function(){
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
	 //计算总价的函数
	 function total(){
		 $("#sortable").find(".totalmoney").each(function(){
				var price=$(this).parent().find("#price").text();
				var count=$(this).parent().find("#goodcount").val();
				var money=price*count;
				$(this).text(money);
		 });
	 }
	 //调用函数
	 total();
	//结算
	$(".button").click(function(){
		var arr=$(".ck:checked");
		var str="";
		if(arr.length==0){
			alert("请至少选择一项要结算的物品");
		}else{
			arr.each(function(){
				var goodid= $(this).val();
				var scid=$(this).parents("tr").find("#scid").val();
				var goodcount=$(this).parents("tr").find("#goodcount").val();
				$.get("CartServlet2",{"scid":scid,"goodcount":goodcount,"op":"update"},function(){
				})
				str=str+scid+",";
			})
			
			location.href="CartServlet2?op=jiesuan&str="+str;
		}
		
		
	});
	//清空购物车
	$('.button1').click(function(){
		var userid=$("#userid").val();
		var flag=confirm("是否要清空购物车");
		if(flag){
			location.href="CartServlet2?op=delall&userid="+userid;
		}
	})
	//增加数量
	$(".add").on("click",function(){
		var goodcount=$(this).parents("tr").find("#goodcount").val();
		var kuncun=$(this).parents("tr").find("#count").text();
		if(kuncun-goodcount>0){
			goodcount=goodcount*1+1*1;
			$(this).parents("tr").find("#goodcount").val(goodcount);
			total();
			zong();
		}else{
		}	
	});
	//减少数量
	$(".sub").on("click",function(){
		var goodcount=$(this).parents("tr").find("#goodcount").val();
		var kuncun=$(this).parents("tr").find("#count").text();
		if(goodcount>1){
			goodcount=goodcount*1-1*1;
			$(this).parents("tr").find("#goodcount").val(goodcount);
			total();
			zong();
		}else{
		}	
	});
	$(".sr").on("change",function(){
		var goodcount=$(this).val();
		var kuncun=$(this).parents("tr").find("#count").text();
		if(goodcount>=kuncun){
			$(this).val(kuncun);
		}if(goodcount<=1){
			$(this).val("1");
		}
		total();
		zong();
	})
	//删除
	$(".del").click(function() {
		var myp = $(this).parents("tr").find("#scid").val();
		location.href = "CartServlet2?op=del&id=" + myp;
	});
	//总价和总数量
	function zong(){
		var arr=$(".ck:checked");
		var countsum=0;
		var moneysum=0;
		arr.each(function(){
			var count=$(this).parents("tr").find("#goodcount").val();
			var money=$(this).parents("tr").find(".totalmoney").text();
			countsum=count*1+countsum;
			moneysum=money*1+moneysum;
		});
		$("#totalprice").text(moneysum);
		$("#totalcount").text(countsum);
	};
	$(".ck").click(function(){
		zong();
	});
	$("#qx").click(function(){
		var flag=$(this).prop("checked");
		$(".ck").prop("checked",flag);
		zong();
	});
 });
 </script>
</head>
<body>
	<div class="row clearfix">
		<div class="col-md-12 column">
			<!--
            	
            -->
			<div class="header">
				<div class="top-header">
					<div class="wrap">
						<div class="header-left">
							<ul>
								<li><a href="#">联系我们 </a></li> | |
								<li><a href="">欢迎你：${sessionScope.user1}</a></li>
							</ul>
						</div>
						<div class="header-right">
							<ul>
								<li><a href="mainshow.jsp">HOME</a></li>
								<li><i class="user"></i> <a href="account_message.jsp">我的</a>
								</li>
								<li class="login"><i class="lock"></i> <a id="login">登录</a>|
									<a id="Writeoff">注销</a> <a href="reg.jsp">我要注册</a></li>
								<li><i class="heart"></i> <a href="mylike.jsp">收藏</a> <!-- 动态显示收藏数量 -->
								<li class="last" id="mylikecount">0</li>
								</li>
								<li><i class="cart"></i> <a href="shoppingcart.jsp">购物车</a>
									<!-- 购物车数量 -->
								<li class="last" id="mysccount">0</li>
								</li>


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
						<div class="search">
							<div class="search2">
								<form>
									<input type="search" placeholder="请输入您要搜索的内容..."> <input
										type="button" value="搜用户" /> <input id="rbtn" type="button"
										value="搜商品" />
								</form>
						
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
		</div>
		<!-- 页头完-->

	</div>
	<hr style="background-color: #3694C7; height: 1px;" />
	<div class="row clearfix">
		<div class="col-md-4 column"></div>
		<div class="col-md-4 column"></div>
		<div class="col-md-4 column"></div>
	</div>
	<div class="row clearfix">
		<div class="col-md-2 column"></div>
		<div class="col-md-8 column">
			<!--
            	作者：offline
            	时间：2017-10-16
            	描述：商品表
            -->

			<c:if test="${requestScope.list.size()==0}">
				<div class="row clearfix" style="height: 400px;">
					<img alt="" src="images/shoppingcart.jpg">
					<div style="display: inline-block">
						<h2>您的购物车还是空的，赶紧行动吧！您可以：</h2>
						<br>
						<h3 style="display: inline-block">
							<a href="mylike.jsp">看看我的收藏夹</a>
						</h3>
						<br>
						<h3 style="display: inline-block">
							<a href="mainshow.jsp">去首页逛逛</a>
						</h3>
					</div>
					<!--商品表完--->
				</div>
				
				<div class="col-md-2 column"></div>
		</div>
		</c:if>
		<c:if test="${requestScope.list.size()!=0}">
			<div >
				<table border="0" cellspacing="" cellpadding="" id="mytable">
					<thead>
						<tr>
							<th><input type="checkbox" name="" id="qx" value=""
								onclick="selectall(this.checked)" />全选</th>
							<th>商品图片</th>
							<th>卖家名字</th>
							<th>商品名称</th>
							<th colspan="2" style="text-align: center;">购买数量</th>
							<th>剩余数量</th>
							<th>产品单价</th>
							<th>产品总价</th>
							<th>操作</th>
						</tr>
					</thead>

					<tbody id="sortable">

						<c:forEach items="${requestScope.list}" var="shopcart">


							<tr style="border-bottom: 1px solid lightgrey; height: 150px;">
								<td><input type="checkbox" class="ck" name="" id=""
									value="${shopcart.GOODID}" /></td>
								<td><img src="${shopcart.GOODPIC}" width="100px" /></td>
								<td>${shopcart.SELERNAME}</td>
								<td><a href="">${shopcart.GOODTITLE}</a></td>
								<c:if test="${shopcart.GOODSCOUNT>shopcart.GOODCOUNT}">
									<td style="width: 40px;"><input type="text" class="sr"
										name="" id="goodcount" value="${shopcart.GOODCOUNT}" /></td>
								</c:if>
								<c:if test="${shopcart.GOODSCOUNT<=shopcart.GOODCOUNT}">
									<td style="width: 40px;"><input type="text" class="sr"
										name="" id="goodcount" value="${shopcart.GOODSCOUNT}" /></td>
								</c:if>
								<td style="text-align: left; width: 20px;"><input
									type="button" id="" class="add" value="+" /><br> <input
									type="button" id="" class="sub" value="-" /></td>
								<td id="count">${shopcart.GOODCOUNT}</td>
								<td id="price" class="price">${shopcart.GOODPRICE}</td>
								<td id="totalmoney" class="totalmoney"></td>
								<td><button style="background: none; border-color: snow;"
										class="del">
										<img src="images/close1.png" />
									</button></td>
								<td><input type="hidden" id="scid" class="ac"
									value="${shopcart.SCID}" /> <input type="hidden" id="userid"
									class="ac" value="${shopcart.USERID}" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<table border="0" cellspacing="" cellpadding="" id="end">
					<tr>
						<th>总购物价格：¥</th>
						<td id="totalprice" style="text-align: left;">0</td>
					</tr>
					<tr>
						<th>总购买数量：</th>
						<td id="totalcount" style="text-align: left;">0</td>
					</tr>
					<tr>
						<td><button class="button1">清除购物车</button></td>
						<td><button class="button" style="vertical-align: middle">
								<span>结算 </span>
							</button></td>
					</tr>
				</table>
			</div>
			
				

			

		</c:if>

		<!--商品表完--->
	</div>
	<div class="col-md-2 column"></div>
	</div>
	<div class="row clearfix">
		<div class="col-md-12 column">
			<!--
            	作者：offline
            	时间：2017-10-16
            	描述：页脚
            -->
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
		</div>
	</div>
</body>