<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%--jstl标签库的导入 --%>
<%@ taglib prefix="t" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getLocalPort()
			+ request.getContextPath();
	application.setAttribute("path", path);
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>闲之 |个人中心</title>

<!-- 主页的头部图标 -->
<link rel="apple-touch-icon"
	href="https://upzip.b0.upaiyun.com/website/3.6.0/icons/logo1@128.png">
<link rel="shortcut icon"
	href="https://upzip.b0.upaiyun.com/website/3.6.0/favicon.ico">

<link href="${path }/css/bootstrap.css" rel='stylesheet' type='text/css' />
<script src="${path }/js/jquery.min.js"></script>
<link href="${path }/css/mainshow.css" rel="stylesheet" type="text/css"
	media="all" />
<link rel="stylesheet" type="text/css" href="${path }/css/default.css">




<link href="${path }/cssleft/jquery-accordion-menu.css" rel="stylesheet"
	type="text/css" />
<link href="${path }/cssleft/font-awesome.css" rel="stylesheet"
	type="text/css" />

<style type="text/css">
* {
	box-sizing: border-box;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	
}
a,button,input{ 
-webkit-tap-highlight-color: rgba(0, 0, 0, 0);    
   -webkit-user-modify: read-write-plaintext-only;
}

body {
	background: #f0f0f0;
}

.content {
	width: 260px;
	margin: 20px auto;
}

.filterinput {
	background-color: rgba(249, 244, 244, 0);
	border-radius: 15px;
	width: 90%;
	height: 30px;
	border: thin solid #FFF;
	text-indent: 0.5em;
	font-weight: bold;
	color: #FFF;
}

#demo-list a {
	overflow: hidden;
	text-overflow: ellipsis;
	-o-text-overflow: ellipsis;
	white-space: nowrap;
	width: 100%;
}

#tablegood {
	margin-top: -20px;
}

#tablegood a {
	color: black;
}

#tablegood a:hover {
	color: #017EBC;
	cursor: pointer;
}

input[type=button] {
	border: solid #017EBC;
	border-radius: 5px;
}

.changecss {
	background-color: #017EBC;
	border-radius: 8px;
}

td a {
	display: block;
	margin-left: 30px;
}

.goodcontent {
	display: -webkit-box;
	text-overflow: -o-ellipsis-lastline;
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 3;
	-webkit-box-orient: vertical;
}

table {
	margin-top: 0px;
}

#choseallgood {
	float: right;
}
</style>

<!-- bootstrap -->
<link rel="stylesheet" href="${path}/bootstrap/css/bootstrap.css" />
<link rel="stylesheet" href="${path}/css/bootstrap.css" />
<script type="text/javascript" src="${path}/js/jquery-2.1.0.js"></script>

<script type="text/javascript" src="${path}/bootstrap/js/bootstrap.js"></script>

<!-- bootstrap -->
<!--ajax区域-->
<script type="text/javascript">
	$(function() {
		//初始化like信息
		//设置全局变量
		taname = "${requestScope.taname}";
		userName = "${sessionScope.user1}";
		window.i = 0;//当前页数
		window.totalPage = 0;//总页数
		//ajax
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
		
		function clearall(){
					//清除 ul中分页有关的部分
					$("#pagemes").children().remove();
					
					//清除 表格中的分页数据内容
			$("#panel-tablegood").children().remove();
			$("#panel-tablegood").append("<div><img src='images/nosearch.jpg'></div>");
			$("#panel-commentFromMe").children().remove();	
			$("#panel-commentFromMe").append("<div><img src='images/nosearch.jpg'></div>");
		}
		$.get("GoodsServlet", {
			"op" : "getSellGoodByPage",
			"taname" : taname
		}, function(pd, status) {
			//调用传过来的data
			if(pd.total==0){
				clearall();
			}else{
				showData(pd, status);
				window.i = pd.page;//将当前页数赋值给全局变量
				window.totalPage = pd.totalPage;//将总页数赋值给全局变量
				//如果当前页为1，将prev颜色改变
				if (window.i == 1) {
					$(".pageLast").css("color", "#dddddd");
				}
				//如果当前页为总页数，将next颜色改变
				if (window.i == window.totalPage) {
					$(".pageNext").css("color", "#dddddd");
				}
			}
			
		});

		function showData(pd, status) {
			//清除 ul中分页有关的部分
			$("#pagemes").children().remove();

			//清除 表格中的分页数据内容
			$("#panel-tablegood").children().remove();
			//遍历pd.data的数据
			$.each(pd.data,function(index, GoodsSeller) {
				var str = "<table id='tablegood' class='table table-hover table-condensed' style='border:none;'>"
						+ "<thead><tr><th style='text-decoration:line-through;'>原价"
						+ GoodsSeller.ORIGINALPRICE
						+ "</th>"

						+ "<th style='color:red'>现价￥"
						+ GoodsSeller.GOODPRICE
						+ "</th>"
						+ "<th>"
						+ "<input type='hidden' value='"+GoodsSeller.GOODID+"'/>"
						+ "</th>"
						+ "</tr>"
						+ "</thead>"
						+ "<tbody>"
						+ "<tr><td  style='display: inline-block;width:120px; height:98px;text-align: center;align-content: center;'>"
						+ "<div id='' class='changecss' style='text-align:center;width:120px; height:90px;margin-top: -5px;'>"
						+ "<img id='' class='imgclick'"
				+"src="+GoodsSeller.GOODPIC
				+" style='border-radius:5px;width:116px; height:86px;margin:2px auto;' />"
						+ "</div></td><td >"
						+ "<a class='sale_a'>[商品名]: "
						+ GoodsSeller.GOODTITLE
						+ "</a>"

						+ "<div class='goodcontent' >"
						+ "<a>[商品描述]: "
						+ GoodsSeller.GOODREMARK
						+""
						+ "</div></td><td></td></tr><tr><td><a class='message' data-toggle='modal'>去联系他</a></td><td>"
						+ "<p>"
						+ "目前点击量："
						+ GoodsSeller.GOODCLICK
						+ "</p>"
						+ "</td><td><input type='button' style='float:right;' class='ilike' value='我也想要' /></td>"
						+ "</tr></tbody></table>"

				$("#panel-tablegood").append(str);
			});
			//循环显示页码
			$("#pagemes").append("<li><a class='pageLast' >Prev</a></li>");
			//循环显示页码
			for (var i = 1; i <= pd.totalPage; i++) {
				if (pd.page == i) {
					$("#pagemes").append(
							"<li class='active'><a class='pageNo'>" + i
									+ "</a></li>");
				} else {
					$("#pagemes")
							.append(
									"<li class=''><a class='pageNo'>" + i
											+ "</a></li>");
				}
			}
			$("#pagemes").append("<li><a class='pageNext' >Next</a></li>");

		}

		$.get("GoodsServlet", {
			"op" : "getOutGoosByPage","taname":taname
		}, function(pd1, status) {
			//调用传过来的data
			showOutData(pd1, status);

		});
		//显示上面的已完成的订单信息
		function showOutData(pd1, status) {

			//清除 表格中的分页数据内容
			$("#outgood").children().remove();
			//遍历pd.data的数据
			$.each(pd1.data,function(index, GoodsSeller) {
						var str1 = "<tr><td ><div class='goodcontent'>"
								+ "<input type='hidden' value='"+GoodsSeller.GOODID+"'/>"
								+ "<a class='sale_a'>[商品名]： "
								+ GoodsSeller.GOODTITLE + "</a>"

								+ "</div></td></tr>"
						$("#outgood").append(str1);
					});

		}
		//初始化用户信息
		$.get("UserServlet", {
			"up" : "unitpeople","taname":taname
		}, function(pd1, status) {
			//调用传过来的data
			//清除 表格中的分页数据内容
			$("#people").children().remove();
			//遍历pd.data的数据
			$.each(pd1,function(index, UserMes) {
				var str1 = "</br><p> &nbsp&nbsp用户名："+taname+"</p>"
				+"<p>&nbsp&nbsp已上架商品:"+UserMes.sellcount+"件</p>"
				+"<p>&nbsp&nbsp用户信用分:"+UserMes.pingfen+"</p>"
				+"<p> &nbsp&nbsp用户收藏数:"+UserMes.likecount+"</p>"
			$("#people").append(str1);
			});
		});

		//具体页数 点击
		$(document).on("click", ".pageNo", function() {
			window.i = $(this).text();
			$.get("GoodsServlet", {
				"op" : "getSellGoodByPage",
				"page" : $(this).text(),
				"taname" : taname
			}, function(pd, status) {
				//调用传过来的data
				showData(pd, status);
				if (window.i == 1) {
					$(".pageLast").css("color", "#dddddd");
				}
				if (window.i == window.totalPage) {
					$(".pageNext").css("color", "#dddddd");
				}
			});
		});

		//前一页  后一页 
		$(document).on("click", ".pageLast", function() {
			//判断当前页的全局变量值为多少，为1则链接无效
			if (window.i == 1) {
				$(".pageLast").css("color", "#dddddd");
			} else {
				var index = window.i - 1;

				$.get("GoodsServlet", {
					"op" : "getSellGoodByPage",
					"page" : index,
					"taname" : taname
				}, function(pd, status) {
					//调用传过来的data
					window.i = index;
					showData(pd, status);
					if (window.i == 1) {
						$(".pageLast").css("color", "#dddddd");
					}
				});
			}
		});
		$(document).on("click", ".pageNext", function() {
			if (window.i == window.totalPage) {
				$(".pageNext").css("color", "#dddddd");
			} else {
				var index = window.i * 1 + 1 * 1;

				if (index == window.totalPage) {
					$(".pageNext").css("color", "#dddddd");
				}
				$.get("GoodsServlet", {
					"op" : "getSellGoodByPage",
					"page" : index,
					"taname" : taname
				}, function(pd, status) {
					//调用传过来的data
					window.i = index;
					showData(pd, status);
					if (window.i == window.totalPage) {
						$(".pageNext").css("color", "#dddddd");
					}
				});

			}

		});

		//在卖出的商品中 点击我 

		$(document).on("click",".sale_a",
				function() {
					
					var goodid = $(this).parents('table').find(
							'input[type=hidden]').val();
					location.href = "GoodsServlet?op=getGD&goodId=" + goodid;

				});

		//点击我要看
		$(document).on("click",".ilike",
				function() {

					var goodId = $(this).parents('table').find(
							'input[type=hidden]').val();
					location.href = "GoodsServlet?op=getGD&goodId=" + goodId;
				});
		//联系他 传商品ID 跳出模态框
		$(document).on("click",".message",function() {
			var goodid = $(this).parents('table').find('input[type=hidden]').val();
			$("#mycontent").val("");
			$(this).attr("href","#myModal");
			
			$("#goodid").val(goodid);
		
		});
		//点击sendMessage发送信息
		$("#sendmessage").click(function(){
			var messageContent = $("#mycontent").val();
			
			var goodId = $("#goodid").val();
			$.get("MessageServlet", {"op" : "sendGoodMessage","goodId":goodId,"messageContent":messageContent}, function(data, status) {
				alert(data);
			});
		});

		/* 我是买家 我评价的开始 */
		$.get("account_comment_servlet", {"op" : "queryTaComment","taname" : taname}, function(pd, status) {
			//调用传过来的data
			showDataFromMe(pd, status);
			window.i2 = pd.page;//将当前页数赋值给全局变量
			window.totalPage2 = pd.totalPage;//将总页数赋值给全局变量
			//如果当前页为1，将prev颜色改变
			if (window.i2 == 1) {
				$(".pageLast2").css("color", "#dddddd");
			}
			//如果当前页为总页数，将next颜色改变
			if (window.i2 == window.totalPage2) {
				$(".pageNext2").css("color", "#dddddd");
			}
		});

		/* showDataFromMe开始 */
		function showDataFromMe(pd, status) {
			//清除 ul中分页有关的部分
			$("#pagemes2").children().remove();

			//清除 表格中的分页数据内容
			$("#panel-commentFromMe").children().remove();
			//遍历pd.data的数据
			var str = "";
			var str1 = "<table id='tableCommentToMe' class='table table-bordered table-hover'>"
					+ "<thead><tr><th>卖家</th><th>评价内容</th><th>评分</th><th>评价日期</th></tr></thead><tbody>";
			str = str + str1;
			

			$.each(pd.data, function(index, CommentFromMe) {
				var str2 = "<tr><td>" + CommentFromMe.USERNAME + "</td><td>"
						+ CommentFromMe.COMMENTCONTENT + "</td><td>"
						+ CommentFromMe.COMMENTSCORE + "</td><td>"
						+ CommentFromMe.COMMENTDATE.substring(0, 19)
						+ "</td></tr>";
				str = str + str2;
			});
			var str3 = "</tbody></table>"
			str = str + str3;
			$("#panel-commentFromMe").append(str);
		
			//循环显示页码
			$("#pagemes2").append("<li><a class='pageLast2' >Prev</a></li>");
			//循环显示页码
			for (var j = 1; j <= pd.totalPage; j++) {
				if (pd.page == j) {
					$("#pagemes2").append(
							"<li class='active'><a class='pageNo2'>" + j
									+ "</a></li>");
				} else {
					$("#pagemes2").append(
							"<li class=''><a class='pageNo2'>" + j
									+ "</a></li>");
				}
			}
			$("#pagemes2").append("<li><a class='pageNext2' >Next</a></li>");
			
		}
		/* showDataFromMe结束 */

		//具体页数 点击
		$(document).on("click", ".pageNo2", function() {
			window.i2 = $(this).text();
			
			$.get("account_comment_servlet", {
				"op" : "queryTaComment",
				"page" : $(this).text(),
				"taname" : taname
			}, function(pd, status) {

				//调用传过来的data
				showDataFromMe(pd, status);
				if (window.i2 == 1) {
					$(".pageLast2").css("color", "#dddddd");
				}
				if (window.i2 == window.totalPage2) {
					$(".pageNext2").css("color", "#dddddd");
				}
			});
		});

		//前一页  后一页 
		$(document).on("click", ".pageLast2", function() {
			//判断当前页的全局变量值为多少，为1则链接无效
			if (window.i2 == 1) {
				$(".pageLast2").css("color", "#dddddd");
			} else {
				var index = window.i2 - 1;

				$.get("account_comment_servlet", {
					"op" : "queryTaComment",
					"page" : index,
					"taname" : taname
				}, function(pd, status) {
					//调用传过来的data
					window.i2 = index;
					showDataFromMe(pd, status);
					if (window.i2 == 1) {
						$(".pageLast2").css("color", "#dddddd");
					}
				});
			}
		});

		$(document).on("click", ".pageNext2", function() {
			if (window.i2 == window.totalPage2) {
				$(".pageNext2").css("color", "#dddddd");
			} else {
				var index = window.i2 * 1 + 1 * 1;

				if (index == window.totalPage2) {
					$(".pageNext2").css("color", "#dddddd");
				}
				$.get("account_comment_servlet", {
					"op" : "queryTaComment",
					"page" : index,
					"taname" : taname
				}, function(pd, status) {
					//调用传过来的data
					window.i2 = index;
					showDataFromMe(pd, status);
					if (window.i2 == window.totalPage2) {
						$(".pageNext2").css("color", "#dddddd");
					}
				});

			}

		});

		/* 我是买家 我评价的结束 */

		//
	});
</script>
</head>
<body style="background-color: #FAFAFA;">

	<!-- 头 -->
	<div class="header">
		<div class="top-header">
			<div class="wrap">
				<div class="header-left">
					<ul>
						<li><a href="#">联系我们 </a></li> |
						<li><a href="order.html">欢迎你：</a></li>
					</ul>
				</div>
				<div class="header-right">
					<ul>
						<li><a href="mainshow.jsp">HOME</a></li>
						<li><i class="user"></i> <a href="addBalance.jsp">我的</a></li>
						<li class="login"><i class="lock"></i> <a id="login">登录</a>|
							<a id="Writeoff" >注销</a> 
							<a href="reg.jsp">我要注册</a></li>
						<li><i class="heart"></i> <a href="mylike.jsp">收藏</a>
							<!-- 动态显示收藏数量 -->
						<li class="last" id="mylikecount">0</li>
						</li>
						<li><i class="cart"></i> <a href="shoppingcart.jsp">购物车</a>
							<!-- 购物车数量 -->
						<li class="last" id="mysccount">0</li>
						</li>


					</ul>
					<div class="sign-up-right">
						<a href="login.html"></a>
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
	<!-- header-section-ends -->
	<hr style="background-color: #3694C7; height: 1px;" />
	<!-- 中间部分 -->
	<div class="wrap">

		<div class="pag-nav">
			<ul class="p-list">
				<li><a href="mainshow.jsp">首页</a></li> &nbsp;&nbsp;/&nbsp;
				<li class="act">&nbsp;个人中心</li>
			</ul>
		</div>
		<!--个人信息-->
		<div class="col-md-12">
			<div class="col-md-1"></div>
			<div class="col-md-11">


				<div id="people" class="col-md-2"
				 style="background: url(${path}/images/divbcg.jpg) no-repeat; width:225px; height: 150px;">
					
				</div>
				
				<div class="col-md-9">
					<table id="salegood" class="table">
						<thead>
							<tr>
								<th>最近卖出</th>
							</tr>
							<!--第一行-->
						</thead>
						<tbody id="outgood">
							

						</tbody>

					</table>
				</div>

			</div>

		</div>

		
		
		<div class="col-md-12">
			</br>
			<div class="col-md-1"></div>

			<!--更改的ajax块-->
			<div class="col-md-10 personalajax">
				<div id="content" style="height: 600px;">
					<div>
						<!--表格 begin-->
						<div class="tabbable" id="tabs-650261">
							<ul class="nav nav-tabs">
								<li class="active"><a href="#panel" data-toggle="tab">他的闲置</a>
								</li>
								<li><a href="#panel2" data-toggle="tab">他的评分</a></li>
							</ul>
							<div class="tab-content">

								<!-- 左选项卡begin-->
								<div class="tab-pane active" id="panel">
									<div class="tab-pane active" id="panel-tablegood">
									
										<!-- 第一個商品end-->


									</div>

									<!--page分页 begin-->
									<div class="text-center">
										<div class="col-md-1"></div>
										<div class="col-md-10 column">
											<ul class="pagination" id="pagemes">

											</ul>
										</div>
										<div class="col-md-1"></div>
									</div>
									<!--page分页 end-->

								</div>
								<!-- 左选项卡begin-->


								<!-- 右选项卡begin-->
								<div class="tab-pane" id="panel2">
									<div class="tab-pane" id="panel-commentFromMe"
										style="height: 240px">
										
									</div>


									<!--page分页 begin-->
									<div class="text-center">
										<div class="col-md-1"></div>
										<div class="col-md-10 column">
											<ul class="pagination" id="pagemes2">
											

-->
											</ul>
										</div>
										<div class="col-md-1"></div>
									</div>
									<!--page分页 end-->

								</div>


								<!-- 右选项卡end-->
							</div>
						</div>
						<!--表格 end-->




					</div>
				</div>
			

			</div>


		</div>

	</div>
	</div>
	<!--尾巴-->
	<div class="footer col-md-12" style="clear: both;">
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
<!--  回复的弹窗 -->
<div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
						
						<h2 class="modal-title" 
							style="text-align: center;">Send Message</h2>
					</div>
				
				</br><div class="modal-body form-inline">
				<input type="hidden" id="goodid" value=""/>
					<strong class="form-group" >Send Content:</strong>
					</br><textarea id="mycontent" class="" rows="4" cols="76" class="form-group1" id="textdata1" resize="none" value=""></textarea>
				</div>
				<div class="modal-body form-inline">
					<strong class="form-group myname" style="float:right;margin-right:50px;">by:${sessionScope.user1}</strong>
				</div>
			<div class="modal-footer" align="center">
				 <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button> 
				 <button type="button" class="btn btn-primary" id="sendmessage" data-dismiss="modal">发送</button>
			</div>
		</div>
		
	</div>
	
</div>
<!--  回复的弹窗 -->

</body>
</html>