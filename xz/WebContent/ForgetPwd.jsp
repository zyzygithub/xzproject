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
<title>找回密码</title>

<!-- 主页的头部图标 -->
<link rel="apple-touch-icon"
	href="https://upzip.b0.upaiyun.com/website/3.6.0/icons/logo1@128.png">
<link rel="shortcut icon"
	href="https://upzip.b0.upaiyun.com/website/3.6.0/favicon.ico">

<link href="${path}/css/bootstrap.css" rel='stylesheet' type='text/css' />
<script src="${path}/js/jquery.min.js"></script>
<link href="${path}/css/mainshow.css" rel="stylesheet" type="text/css"
	media="all" />

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

<link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
<link rel="stylesheet" href="css/bootstrap.css" />
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>

<script type="text/javascript">
<!--ajax区域-->
	$(function() {
		/* 根据用户名失焦得到密保问题 */

		$("#userName").blur(function() {
			$("#FogetPwdState").html("");
	
			var UserName = $("#userName").val();
			if (UserName != null && UserName != "") {
			
				$.get("account_updateInfo_servlet", {
					"op" : "getQuestion",
					"userName" : UserName
				}, function(nameState, status) {
					

					$("#userQuestion").val(nameState);

				});
			} else {
				

				$("#FogetPwdState").html("请输入用户名");
				

			}

		});

		/* 判断密保答案是否正确 */
		$("#FogetPwdbtn").click(
				function() {
					$("#FogetPwdState").html("");
					
					var UserName = $("#userName").val();
					var UserQuestion = $("#userQuestion").val();
					
					var UserAnswer = $("#userAnswer").val();
					
					if (UserName != "" && UserQuestion != ""
							&& UserQuestion != "用户名不存在，请输入正确的用户名!") {
					
						$.get("account_updateInfo_servlet", {
							"op" : "checkAnswer",
							"userName" : UserName,
							"userAnswer" : UserAnswer
						}, function(checkAnswerState, status) {
							
							$("#FogetPwdState").html(checkAnswerState);

						});
					} else {
						$("#FogetPwdState").html("请先填写正确的用户名和密保答案");
					}

				});

	});

	/* 返回之前的页面 */

	function goBack() {
		
		window.history.back();

	}
</script>














</head>
<body style="background-color: #FAFAFA;">
	USER:${sessionScope.user1}

	<!-- 头 -->
	</br>
	</br>
	<div class="col-md-12 column">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="row clearfix">
					<div class="col-md-3 column"></div>
					<div class="col-md-4 column">
						<div class="logo">
							<a href="mainshow.jsp"><img src="images/logo.png"
								class="img-responsive" alt="200*200" /></a>
						</div>


					</div>
					<div class="col-md-4 column">
						<h3>找回密码</h3>
					</div>
				</div>
			</div>
		</div>
		</br>
		<hr style="background-color: #3694C7; height: 2px;" />
		<div class="row clearfix">
			<div class="col-md-3 column"></div>
			<div class="col-md-6 column">
				<div style="padding: 80px 100px 10px;">
					<form class="bs-example bs-example-form" role="form">
						<div class="input-group input-group-lg">
							<span class="input-group-addon">用户昵称</span> <input type="text"
								class="form-control" id="userName" placeholder="请输入用户昵称">
						</div>
						<br>
						<div class="input-group  input-group-lg">
							<span class="input-group-addon">密保问题</span> <input type="text"
								class="form-control" id="userQuestion" readonly="true"
								placeholder="请输入用户名用以获取密保问题">
						</div>
						<br>
						<div class="input-group  input-group-lg">
							<span class="input-group-addon">密保答案</span> <input type="text"
								class="form-control" id="userAnswer" placeholder="请输入密保答案">
						</div>

						</br> </br>
						<div class="form-group">
							<div class="col-sm-offset-4 col-sm-10">

								<span id="FogetPwdState"></span>
							</div>
						</div>
						</br> </br>
						<div class="form-group">
							<div class="col-sm-offset-4 col-sm-10">
								<button type="button" class="btn btn-primary btn-lg"
									style="margin: 0px 50px 0px 0px" id="FogetPwdbtn">确定</button>

								<span> <input type="button"
									class="btn btn-primary btn-lg" value="返回" onclick="goBack()"></span>

							</div>
						</div>



					</form>
				</div>
			</div>
			<div class="col-md-3 column"></div>
		</div>
	</div>














	<div class="footer col-md-12" style="position: absolute; top: 70%;">
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