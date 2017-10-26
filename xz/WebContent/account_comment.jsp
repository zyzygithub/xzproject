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

<link href="${path}/css/bootstrap.css" rel='stylesheet' type='text/css' />
<script src="${path}/js/jquery.min.js"></script>
<link href="${path}/css/mainshow.css" rel="stylesheet" type="text/css"
	media="all" />
<link rel="stylesheet" type="text/css" href="${path}/css/default.css">




<link href="cssleft/jquery-accordion-menu.css" rel="stylesheet"
	type="text/css" />
<link href="cssleft/font-awesome.css" rel="stylesheet" type="text/css" />

<style type="text/css">
* {
	box-sizing: border-box;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
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
</style>

<script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
<script src="js/jquery-accordion-menu.js" type="text/javascript"></script>

<!-- bootstrap -->
<link rel="stylesheet" href="${path}/bootstrap/css/bootstrap.css" />
<link rel="stylesheet" href="${path}/css/bootstrap.css" />
<%-- <script type="text/javascript" src="${path}/js/jquery-2.1.0.js"></script> --%>
<script type="text/javascript" src="${path}/bootstrap/js/bootstrap.js"></script>

<!-- bootstrap -->



<script type="text/javascript">
<!--ajax区域-->
	$(function() {
		
		//设置全局变量
		window.i=0;//当前页数
		window.totalPage=0;//总页数
		//ajax同步
		var userName="${sessionScope.user1}";
		$.ajaxSetup({
			  async: false
			  });
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
		
		
		
		
		/* 我是卖家 评价我的开始 */
		$.get("account_comment_servlet",{"op":"queryAllByPage","identity":"ToMe"},function(pd,status){
			//调用传过来的data
			showDataToMe(pd,status);
			window.i=pd.page;//将当前页数赋值给全局变量
			window.totalPage=pd.totalPage;//将总页数赋值给全局变量
			//如果当前页为1，将prev颜色改变
			if(window.i==1){
				$(".pageLast").css("color","#dddddd");
			}
			//如果当前页为总页数，将next颜色改变
			if(window.i==window.totalPage){
				$(".pageNext").css("color","#dddddd");
			}
		});
		
		/* showDataToMe开始 */
		function showDataToMe(pd,status){
			//清除 ul中分页有关的部分
			$("#pagemes").children().remove();
		
			//清除 表格中的分页数据内容
			$("#panel-commentToMe").children().remove();
			//遍历pd.data的数据
			if(pd.total!=0){
			var str="";
			var str1="<table id='tableCommentToMe' class='table table-bordered table-hover'>"
				+"<thead><tr><th>买家</th><th>评价内容</th><th>评分</th><th>评价日期</th></tr></thead><tbody>";
				str=str+str1;
		//	$("#panel-commentToMe").append(str1);
			
			$.each(pd.data,function(index,CommentToMe){
				var str2="<tr><td>"
				+CommentToMe.USERNAME+ "</td><td>"
				+CommentToMe.COMMENTCONTENT+ "</td><td>"
				+CommentToMe.COMMENTSCORE+"</td><td>"
				+CommentToMe.COMMENTDATE.substring(0,19)
				+"</td></tr>";				
				str=str+str2;
			});
			 var str3="</tbody></table>"
			 str=str+str3;
			$("#panel-commentToMe").append(str); 

			//循环显示页码
			$("#pagemes").append("<li><a class='pageLast'  >Prev</a></li>");
			//循环显示页码
			for(var i=1; i<=pd.totalPage;i++)
				{
				    if(pd.page == i)
				    	{
				    	 $("#pagemes").append("<li class='active'><a class='pageNo' >"+i+"</a></li>");
				    	}
				    else
				    	{
				    	 $("#pagemes").append("<li class=''><a class='pageNo' >"+i+"</a></li>");
				    	}
				}
			$("#pagemes").append("<li><a class='pageNext'  >Next</a></li>");
			/*偶数行和奇数行背景色变化*/
			/* $("tr:even").not(":first").attr("class", "info");
			$("tr:odd").attr("class", "success"); */
			}else{
				$("#panel-commentToMe").append("<div align='center'><img src='images/nocomment.jpg'></div>")
			}

		}
		/* showDataToMe结束 */
		
		//具体页数 点击
		$(document).on("click",".pageNo",function(){
			window.i=$(this).text();

			$.get("account_comment_servlet",{"op":"queryAllByPage","page":$(this).text(),"p_searchval":$("#searchtext").val(),"identity":"ToMe"},function(pd,status){
				
				//调用传过来的data
				showDataToMe(pd,status);
				if(window.i==1){
					$(".pageLast").css("color","#dddddd");
				}
				if(window.i==window.totalPage){
					$(".pageNext").css("color","#dddddd");
				}
			});
		});
		
		
		//前一页  后一页 
		$(document).on("click",".pageLast",function(){
			//判断当前页的全局变量值为多少，为1则链接无效
			if(window.i==1){
				$(".pageLast").css("color","#dddddd");
			}else{
				var index=window.i-1;
				
					$.get("account_comment_servlet",{"op":"queryAllByPage","page":index,"p_searchval":$("#searchtext").val(),"identity":"ToMe"},function(pd,status){
						//调用传过来的data
						window.i=index;
						showDataToMe(pd,status);
						if(window.i==1){
							$(".pageLast").css("color","#dddddd");
						}
					});
			}
		});
		
		
		$(document).on("click",".pageNext",function(){
			if(window.i==window.totalPage){
				$(".pageNext").css("color","#dddddd");
			}else{
				var index=window.i*1+1*1;
				
				if(index==window.totalPage){
					$(".pageNext").css("color","#dddddd");
				}
					$.get("account_comment_servlet",{"op":"queryAllByPage","page":index,"p_searchval":$("#searchtext").val(),"identity":"ToMe"},function(pd,status){
						//调用传过来的data
						window.i=index;
						showDataToMe(pd,status);
						if(window.i==window.totalPage){
							$(".pageNext").css("color","#dddddd");
						}
					});
			}
		});
	
		//检索功能
		$("#searchbtn").click(function(){
			var searchval=$("#searchtext").val();
			$.get("account_comment_servlet",{"op":"queryAllByPage","p_searchval":searchval,"identity":"ToMe"},function(pd,status){

				//调用传过来的data

				showDataToMe(pd,status);
				window.i=pd.page;//将当前页数赋值给全局变量
				window.totalPage=pd.totalPage;//将总页数赋值给全局变量
				//如果当前页为1，将prev颜色改变
				if(window.i==1){
					$(".pageLast").css("color","#dddddd");
				}
				//如果当前页为总页数，将next颜色改变
				if(window.i==window.totalPage){
					$(".pageNext").css("color","#dddddd");
				} 
			});
		});
		
		/* 我是卖家 评价我的结束 */

		/* 我是买家 我评价的开始 */
		$.get("account_comment_servlet",{"op":"queryAllByPage","identity":"FromMe"},function(pd,status){
			//调用传过来的data
			showDataFromMe(pd,status);
			window.i2=pd.page;//将当前页数赋值给全局变量
			window.totalPage2=pd.totalPage;//将总页数赋值给全局变量
			//如果当前页为1，将prev颜色改变
			if(window.i2==1){
				$(".pageLast2").css("color","#dddddd");
			}
			//如果当前页为总页数，将next颜色改变
			if(window.i2==window.totalPage2){
				$(".pageNext2").css("color","#dddddd");
			}
		});
		
		/* showDataFromMe开始 */
		function showDataFromMe(pd,status){
			//清除 ul中分页有关的部分
			$("#pagemes2").children().remove();
		
			//清除 表格中的分页数据内容
			$("#panel-commentFromMe").children().remove();
			//遍历pd.data的数据
			if(pd.total!=0){
			var str="";
			var str1="<table id='tableCommentToMe' class='table table-bordered table-hover'>"
				+"<thead><tr><th>卖家</th><th>评价内容</th><th>评分</th><th>评价日期</th></tr></thead><tbody>";
				str=str+str1;
		//	$("#panel-commentToMe").append(str1);
			
			$.each(pd.data,function(index,CommentFromMe){
				var str2="<tr><td>"
				+CommentFromMe.USERNAME+ "</td><td>"
				+CommentFromMe.COMMENTCONTENT+ "</td><td>"
				+CommentFromMe.COMMENTSCORE+"</td><td>"
				+CommentFromMe.COMMENTDATE.substring(0,19)
				+"</td></tr>";				
				str=str+str2;
			});
			 var str3="</tbody></table>"
			 str=str+str3;
			$("#panel-commentFromMe").append(str); 

			//循环显示页码
			$("#pagemes2").append("<li><a class='pageLast2' >Prev</a></li>");
			//循环显示页码
			for(var j=1; j<=pd.totalPage;j++)
				{
				    if(pd.page == j)
				    	{
				    	 $("#pagemes2").append("<li class='active'><a class='pageNo2' >"+j+"</a></li>");
				    	}
				    else
				    	{
				    	 $("#pagemes2").append("<li class=''><a class='pageNo2' >"+j+"</a></li>");
				    	}
				}
			$("#pagemes2").append("<li><a class='pageNext2'  >Next</a></li>");
			/*偶数行和奇数行背景色变化*/
			/* $("tr:even").not(":first").attr("class", "info");
			$("tr:odd").attr("class", "success"); */
			}else{
				$("#panel-commentFromMe").append("<div align='center'><img src='images/nocomment.jpg'></div>")
			}

		}
		/* showDataFromMe结束 */
		
		//具体页数 点击
		$(document).on("click",".pageNo2",function(){
			window.i2=$(this).text();

			$.get("account_comment_servlet",{"op":"queryAllByPage","page":$(this).text(),"p_searchval":$("#searchtext").val(),"identity":"FromMe"},function(pd,status){
				
				//调用传过来的data
				showDataFromMe(pd,status);
				if(window.i2==1){
					$(".pageLast2").css("color","#dddddd");
				}
				if(window.i2==window.totalPage2){
					$(".pageNext2").css("color","#dddddd");
				}
			});
		});
		//前一页  后一页 
		$(document).on("click",".pageLast2",function(){
			//判断当前页的全局变量值为多少，为1则链接无效
			if(window.i2==1){
				$(".pageLast2").css("color","#dddddd");
			}else{
				var index=window.i2-1;
				
					$.get("account_comment_servlet",{"op":"queryAllByPage","page":index,"p_searchval":$("#searchtext").val(),"identity":"FromMe"},function(pd,status){
						//调用传过来的data
						window.i2=index;
						showDataFromMe(pd,status);
						if(window.i2==1){
							$(".pageLast2").css("color","#dddddd");
						}
					});
			}
		});
		$(document).on("click",".pageNext2",function(){
			if(window.i2==window.totalPage2){
				$(".pageNext2").css("color","#dddddd");
			}else{
				var index=window.i2*1+1*1;
				
				if(index==window.totalPage2){
					$(".pageNext2").css("color","#dddddd");
				}
					$.get("account_comment_servlet",{"op":"queryAllByPage","page":index,"p_searchval":$("#searchtext").val(),"identity":"FromMe"},function(pd,status){
						//调用传过来的data
						window.i2=index;
						showDataFromMe(pd,status);
						if(window.i2==window.totalPage2){
							$(".pageNext2").css("color","#dddddd");
						}
					});
				
			}
		});
		
		//检索功能
				$("#searchbtn").click(function(){
	
					var searchval=$("#searchtext").val();
					$.get("account_comment_servlet",{"op":"queryAllByPage","p_searchval":searchval,"identity":"FromMe"},function(pd,status){

						//调用传过来的data

						showDataFromMe(pd,status);

						window.i2=pd.page;//将当前页数赋值给全局变量
						window.totalPage2=pd.totalPage;//将总页数赋值给全局变量
						//如果当前页为1，将prev颜色改变
						if(window.i2==1){
							$(".pageLast2").css("color","#dddddd");
						}
						//如果当前页为总页数，将next颜色改变
						if(window.i2==window.totalPage2){
							$(".pageNext2").css("color","#dddddd");
						} 			
					});		
				});
		/* 我是买家 我评价的结束 */
	});
</script>
</head>
<body style="background-color: #FAFAFA;">
	USER:${sessionScope.user1}
	<!-- 头 -->
	<div class="header">
		<div class="top-header">
			<div class="wrap">
				<div class="header-left">
					<ul>
						<li><a href="#">联系我们 </a></li> |
						<t:if test="${sessionScope.user1 != null}">

							<li><a id="usermes" href="">Hi~
									${sessionScope.user1}</a></li>
						</t:if>
						<t:if test="${sessionScope.user1 == null}">

							<li><a id="usermes" href="">Hi~ 游客</a></li>
						</t:if>
					</ul>
				</div>
				<div class="header-right">
					<ul>
						<li><a href="mainshow.jsp">HOME</a></li>
						<li><i class="user"></i> <a href="account_message.jsp">我的</a></li>
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

		<!-- 中间的侧边导航栏 -->
		<div class="col-md-12">

			<div class="col-md-3">
				<div class="login-page"
					style="position: absolute; left: 5%; top: 30%;">

					<div class="content">

						<div id="jquery-accordion-menu" class="jquery-accordion-menu ">

							<ul id="demo-list">

							<li class="active"><a><i class="fa fa-envelope"></i>消息中心 </a>
		   	<ul class="submenu">
					<li><a href="account_message.jsp">已读 </a></li>
					<li><a href="account_message.jsp">未读 </a></li>
					</li>
				</ul>
		  </li>
			<li><a class=""><i class="fa fa-home "></i>购入</a>
				<ul class="submenu">
				
					<li><a href="account.jsp?inorout=in&state=待发货">待发货</a></li>
					<li><a href="account.jsp?inorout=in&state=已发货">已发货</a></li>
					<li><a href="account.jsp?inorout=in&state=待评价">待评价</a></li>
					<li><a href="account.jsp?inorout=in&state=已完成">已完成</a></li>
				</ul>
			</li>
			<li><a ><i class="fa fa-home fa-"></i>贩出</a>
				<ul class="submenu">
				
					<li><a href="account.jsp?inorout=out&state=待发货">待发货</a></li>
					<li><a href="account.jsp?inorout=out&state=已发货">已发货</a></li>
					<li><a href="account.jsp?inorout=out&state=已完成">已完成</a></li>
				</ul>
			</li>
							<li><a><i class="fa fa-user"></i>个人中心</a>
								<ul class="submenu">
									<li><a href="mylike.jsp">我的收藏</a></li>
									<li><a href="account_comment.jsp">我的评价</a></li>
									<li><a href="UpdateInfo.jsp">个人资料</a></li>
								</ul></li>
							<li><a id="addBalance" href="addBalance.jsp"><i class="fa fa-money"></i>充值</a></li>
								<li><a ><i class="fa fa-home"></i>我的商品</a>
				<ul class="submenu">
					<li><a href="accountgoodsup.jsp">商品上架</a></li>
					<li><a href="Accountwaitaudit?flag=allup">待审核</a></li>
					<li><a href="Accountnopassaudit?flag=allup">审核失败</a></li>
					<li><a href="account_goods_goodstype_sevrlet?flag=allup">已上架</a></li>
				</ul>
			</li>
							</ul>

						</div>
					</div>
				</div>
			</div>

			<!--更改的ajax块-->
			<div class="col-md-8 personalajax" style="padding-left: 70px">
				<div id="content">
					<!-- 检索开始 -->
					<div class="input-group">
						<input type="text" class="form-control" id="searchtext"> <span
							class="input-group-btn">
							<button class="btn btn-default" type="button" id="searchbtn">检索</button>
						</span>
					</div>
					<!-- 检索结束 -->
					</br>
					</br>
					<!-- 表格开始 -->
					<div class="tabbable" id="tabs-595782">
						<ul class="nav nav-tabs">
							<li class="active"><a href="#panel" data-toggle="tab">评价我的</a>
							</li>
							<li><a href="#panel2" data-toggle="tab">我评价的</a></li>
						</ul>
						<div class="tab-content">
						
						<div class="tab-pane active" id="panel">
						
							<div class="tab-pane active" id="panel-commentToMe" style="height:240px">
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
						
							<div class="tab-pane" id="panel2">
							<div class="tab-pane" id="panel-commentFromMe" style="height:240px">
							</div>
							
							
							<!--page分页 begin-->
							<div class="text-center">
								<div class="col-md-1"></div>
								<div class="col-md-10 column">
									<ul class="pagination" id="pagemes2">
									</ul>
								</div>
								<div class="col-md-1"></div>
							</div>
							<!--page分页 end-->
							</div>
						</div>
					</div>
					<!-- 表格结束 -->

					</br>
					</br>
				</div>
			</div>


		</div>


	</div>

	<!--尾巴-->
	<div class="footer col-md-12" style="position: absolute; top: 110%;">
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
		/* ajax区域  */
		(function($) {
			$.expr[":"].Contains = function(a, i, m) {
				return (a.textContent || a.innerText || "").toUpperCase()
						.indexOf(m[3].toUpperCase()) >= 0;
			};
			function filterList(header, list) {
				//@header 头部元素
				//@list 无需列表
				//创建一个搜素表单
				var form = $("<form>").attr({
					"class" : "filterform",
					action : "#"
				}), input = $("<input>").attr({
					"class" : "filterinput",
					type : "text"
				});
				$(form).append(input).appendTo(header);
				$(input).change(
						function() {
							var filter = $(this).val();
							if (filter) {
								$matches = $(list).find(
										"a:Contains(" + filter + ")").parent();
								$("li", list).not($matches).slideUp();
								$matches.slideDown();
							} else {
								$(list).find("li").slideDown();
							}
							return false;
						}).keyup(function() {
					$(this).change();
				});
			}
			$(function() {
				filterList($("#form"), $("#demo-list"));
			});
		})(jQuery);
	</script>

	<script type="text/javascript">
		jQuery("#jquery-accordion-menu").jqueryAccordionMenu();
	</script>





</body>
</html>