<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%--jstl标签库的导入 --%>
<%@ taglib prefix="t" uri="http://java.sun.com/jsp/jstl/core" %>
<%String path = request.getScheme()+"://"+request.getServerName()+":"+request.getLocalPort()+request.getContextPath();
application.setAttribute("path", path);
%>   
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>闲之 |个人中心</title>

<!-- 主页的头部图标 -->
<link rel="apple-touch-icon" href="https://upzip.b0.upaiyun.com/website/3.6.0/icons/logo1@128.png">
<link rel="shortcut icon" href="https://upzip.b0.upaiyun.com/website/3.6.0/favicon.ico">

<link href="${path}/css/bootstrap.css" rel='stylesheet' type='text/css' />
<script src="${path}/js/jquery.min.js"></script>
<link href="${path}/css/mainshow.css" rel="stylesheet" type="text/css" media="all" />
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


<script type="text/javascript">
<!--ajax区域-->

 $(function(){
	var Name1=true;
	var Name2=false;
	
	//判断用户名是否存在
	$("#userName").blur(function(){
		 
		 var p_userName = $("#userName").val();
		 $.get("Account_Servlet_money",{"op":"isUser","p_userName":p_userName},function(NameState,status){
		 
			 $("#balanceState").html(NameState);
			 if(NameState!=""){
					Name1=false;
				}else{
					Name1=true;
				} 
	 
		 }); 
	 });
	
	 //判断两次用户名是否一致
	 $("#userCheckName").blur(function(){
	 
		 var p_userName = $("#userName").val();
		 var p_userCheckName = $("#userCheckName").val();
		 $.get("Account_Servlet_money",{"op":"checkName","p_userName":p_userName,"p_userCheckName":p_userCheckName},function(checkNameState,status){
		 
			 $("#balanceState").html(checkNameState);
			 if(checkNameState!=""){
					Name2=false;
				}else{
					Name2=true;
				} 
	 
		 }); 
	 });
	 
	//判断是否充值成功
		$("#balancebtn").click(function(){
		
			 if(Name1==true && Name2==true){
				 var p_userCheckName = $("#userCheckName").val();
					var p_balance = $("#balance").val();
		
					$.get("Account_Servlet_money",{"op":"addMoney","p_userCheckName":p_userCheckName,"p_balance":p_balance},function(balanceState,status){
						
						$("#balanceState").html(balanceState);
						$("#userName").val("");
						$("#userCheckName").val("");
						$("#balance").val("");
							
					});  
			 }
		
		});

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
				
						<li><a id="usermes" href="">Hi~ ${sessionScope.user1}</a></li>
						</t:if>
						<t:if test="${sessionScope.user1 == null}">
				
						<li><a id="usermes" href="">Hi~ 游客</a></li>
						</t:if>
					</ul>
				</div>
				<div class="header-right">
					<ul>
						<li>
							<a href="mainshow.jsp">HOME</a>
						</li>
						<li>
							<i class="user"></i>
							<a href="account_message.jsp">我的</a>
						</li>
						<li class="login">
							<i class="lock"></i>
							<a id="login">登录</a>|
							<a id="Writeoff" >注销</a> 
							<a href="reg.jsp">我要注册</a>
						</li>
						<li>
							<i class="heart"></i>
							<a href="mylike.jsp">收藏</a>
							<!-- 动态显示收藏数量 -->
							<li class="last" id="mylikecount">0</li>
						</li>
						<li>
							<i class="cart"></i>
							<a href="shoppingcart.jsp">购物车</a>
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
					<a href="mainshow.jsp"><img src="images/logo.png" class="img-responsive" alt="" /></a>
				</div>
				<div class="search">
					<div class="search2">
						<form>
		            	<input type="search" placeholder="请输入您要搜索的内容...">
		            	<input type="button"   value="搜用户"/>
		            	<input id="rbtn"  type="button" value="搜商品"/>
	        			</form>
					
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>

	</div>
	<!-- header-section-ends -->
	<hr style="background-color: #3694C7;height: 1px;"/>
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


							<li><a href="#"><i class="fa fa-user"></i>个人中心</a>
								<ul class="submenu">
									<li><a href="mylike.jsp">我的收藏</a></li>
									<li><a href="account_comment.jsp">我的评价</a></li>
									<li><a href="UpdateInfo.jsp">个人资料</a></li>
								</ul></li>
							<li><a id="addBalance"><i class="fa fa-money"></i>充值</a></li>
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
			<div class="col-md-9 personalajax">
				<div id="content">
						 <div style="padding: 100px 100px 10px;">
							<form class="bs-example bs-example-form" role="form">
								<div class="input-group input-group-lg">
									<span class="input-group-addon">#</span>
									<input type="text" class="form-control" id="userName" placeholder="请输入您要充值的用户名">
									
								</div><br>
								
								<div class="input-group input-group-lg">
									<span class="input-group-addon">#</span>
									<input type="text" class="form-control" id="userCheckName" placeholder="请确认您要充值的用户名">
									
								</div><br>
						
								<div class="input-group input-group-lg">
									<span class="input-group-addon">￥</span>
									<input type="number" class="form-control" id="balance" placeholder="请输入充值金额">
								</div><br>
									
								<div class="form-group">
									<div class="col-sm-offset-4 col-sm-10">
											<button type="button" class="btn btn-primary btn-lg" id="balancebtn">充值</button>
											<span id="balanceState"></span>
									</div>
								</div>								
									
							</form>
						</div> 
					

				</div>
			</div>


		</div>


	</div>
	</div>
	<!--尾巴-->
	<div class="footer col-md-12" style="position: absolute; top: 110%;">
		<div class="wrap">
			<div class="contact-section">
				<div class="col-md-4 follow text-center">
				<h3><i class="shipping-icon"></i>免费购物</h3>
				<p>足不出户就能看到网站上的动态信息，根据商品的真实照片，性能介绍，买卖家信息，卖出或买到自己闲置商品。</p>
				</div>
				<div class="col-md-4 subscribe text-center">
					<h3><i class="correct-icon"></i>100 %便捷可靠</h3>
				<p>随时随刻发布自己闲置物品，换取等值物品或者出售得到经济利益。</p>
				</div>
				<div class="col-md-4 help text-center">
						<h3><i class="return-icon"></i>社交方式</h3>
				<p>不仅能让物品“值”起来，而且能促进人与人之间的沟通。二手购物是一种效率很高的社交方式。</p>
			
				</div>
				<div class="clearfix"></div>
			</div>
			
			<div class="cards text-center">
				<img src="images/cards.jpg" alt="" />
			</div>
			<div class="copyright text-center">
				<p>Copyright &copy; 中软国际开发九 | Projects by <a
							href="daomai.jsp"> 倒买倒卖组</a>
				</p>
			</div>

		</div>
	 </div>

	<script type="text/javascript">	
 	/* ajax区域  */
		(function($) {
		$.expr[":"].Contains = function(a, i, m) {
			return (a.textContent || a.innerText || "").toUpperCase().indexOf(m[3].toUpperCase()) >= 0;
		};
		function filterList(header, list) {
			//@header 头部元素
			//@list 无需列表
			//创建一个搜素表单
			var form = $("<form>").attr({
				"class":"filterform",
				action:"#"
			}), input = $("<input>").attr({
				"class":"filterinput",
				type:"text"
			});
			$(form).append(input).appendTo(header);
			$(input).change(function() {
				var filter = $(this).val();
				if (filter) {
					$matches = $(list).find("a:Contains(" + filter + ")").parent();
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
		})(jQuery);	
</script>
<script type="text/javascript">
	jQuery("#jquery-accordion-menu").jqueryAccordionMenu();
</script>
	
</body>
</html>