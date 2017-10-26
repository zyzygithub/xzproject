<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>BOX SHOP a E-commerce online Shopping Category Flat
	Bootstarp responsive Website Template| Single :: w3layouts</title>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<link rel="stylesheet" type="text/css" href="css/css_single.css" />

<script src="js/jquery-2.1.0.js" type="text/javascript" charset="utf-8"></script>
<script src="js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
<!-- Custom Theme files -->
<link href="css/mainshow.css" rel="stylesheet" type="text/css"
	media="all" />
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="BOX SHOP Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<style>
#demo {
	display: none;
}
</style>
<script type="application/x-javascript">
	

			addEventListener("load", function() {
				setTimeout(hideURLbar, 0);
			}, false);

			function hideURLbar() {
				window.scrollTo(0, 1);
			}




</script>
<!--webfont-->
<link
	href='http://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic'
	rel='stylesheet' type='text/css'>
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>
<!-- start menu -->
<link href="css/megamenu.css" rel="stylesheet" type="text/css"
	media="all" />
<script type="text/javascript" src="js/megamenu.js"></script>
<script>
	$(document).ready(function() {
		$(".megamenu").megamenu();
	});
</script>
<link rel="stylesheet" href="css/etalage.css">
<script src="js/jquery.etalage.min.js"></script>
<script>
	jQuery(document)
			.ready(
					function($) {

						$('#etalage')
								.etalage(
										{
											thumb_image_width : 400,
											thumb_image_height : 500,
											source_image_width : 800,
											source_image_height : 1000,
											show_hint : true,
											click_callback : function(
													image_anchor, instance_id) {
												alert('Callback example:\nYou clicked on an image with the anchor: "'
														+ image_anchor
														+ '"\n(in Etalage instance: "'
														+ instance_id + '")');
											}
										});

					});
</script>
<link rel="stylesheet" href="css/flexslider.css" type="text/css"
	media="screen" />
<script type="text/javascript">
	$(window).load(function() {	

		
		$("#flexiselDemo").flexisel({
			visibleItems : 4,
			animationSpeed : 100,
			autoPlay : true,
			autoPlaySpeed : 3000,
			pauseOnHover : true,
			enableResponsiveBreakpoints : true,
			responsiveBreakpoints : {
				portrait : {
					changePoint : 480,
					visibleItems : 1
				},
				landscape : {
					changePoint : 640,
					visibleItems : 2
				},
				tablet : {
					changePoint : 768,
					visibleItems : 3
				}
			}
		}); 	

	});
</script>
<script type="text/javascript" src="js/jquery.flexisel.js"></script>
<script type="text/javascript">
	$(function() {
		maxcount = ${requestScope.gd.GOODCOUNT};
		nowPage=1;
		maxPage=1;

		//获取地址栏信息
		(function(){
			if(${requestScope.gd.GOODCOUNT<=0}){
				
				$("#btngoshopping").prop("disabled","disabled");
				$("#btnshoppingcar").prop("disabled","disabled");
				$("#btnmessage").prop("disabled","disabled");
				$(".input-number").val(0);
			}
			var url=document.location.href;
			url=url.replace("localhost","192.168.9.224");
			$("#urlarea").val(url);
			getHostGoods();
			//加载表情包
			addbq();
			 if(${sessionScope.user1!=null}){
				  $("#userName").val("${sessionScope.user1}");
				  $("#login").css("display","none");
				 
				  $("#Writeoff").css("display","display");
				  getinfo();
			  }else{
				  $("#Writeoff").css("display","none");
			  }
			
		})();
		
		$("#rbtn").click(function(){
			location.href="GoodsServlet?op=searchGoods&key="+$("#keytext").val();
		})
		
		$("#pbtn").click(function(){
			location.href="GoodsServlet?op=getSellGood&taname="+$("#keytext").val();
		})
		
		
		
		//注销点击事件
		$("#Writeoff").click(function(){
			if(confirm("确认要注销？")){
				$.post("UserServlet",{"up":"writeOff"},function(msg,states){
					location.reload(true);
					alert(msg);
				})
			}
			
		})
		//下方轮播栏获取信息
		function getHostGoods(){
			idg=["one","two","three","four","five","six"];
			$.post("GoodsServlet",{"op":"getHostGoods","type":"${requestScope.gd.TYPENAME}"},function(data,state){
				$.each(data,function(index,goods){
					var id="#ipad"+idg[index];
					$(id+" div img").attr("src",goods.GOODPIC);
					$(id+" div h4").text(goods.GOODTITLE);
					$(id+" div a:not('.cart')").attr("href","GoodsServlet?op=getGD&goodId="+goods.GOODID);
					$(id+" div h3").text("￥"+goods.GOODPRICE);
					$(id+" div input").val(goods.GOODID);
				})
			})
		}
		
		//加载表情图片至表情列表
		function addbq(){
			for(var i=0;i<5;i++){
				$(".table-bq tbody").append("<tr>");
				for(var j=1;j<=9;j++){
					$(".table-bq tbody").append("<td><img src='images/pic/i_f"+i+j+".png' class='bq'/></td>");
				}
				var n=i+1;
				$(".table-bq tbody").append("<td><img src='images/pic/i_f"+n+0+".png' class='bq'/></td>");
				$(".table-bq tbody").append("</tr>");
			}
		}
	
		
		//获取留言数据
		function getMsg(page){
			$("#messagetable tbody tr").remove();
			$(".pagination li").remove();
			$.post("MessageServlet",{"op":"getMsgByGoodId","goodId":${requestScope.gd.GOODID},"page":page},function(pd,status){
				if(pd.data.length>0){
				$("#messagetablediv").css("height","620px");
				$("#messagetable").append("<tr><td colspan='2'></td></tr>");
				$.each(pd.data,function(index,msgd){
					$("#messagetable tbody").append("<tr><td class='text-center messagetable_left_a' rowspan='2'>"+msgd.FROMNAME+"</td><td class='messagetable_right_a'>"+msgd.MESSAGECONTENT+"</td></tr><tr><td class='messagetable_right_b' colspan='2'><a class='deletemsga' >删除 </a>| 发表于"+msgd.MESSAGEDATE+"<a class='returngmsga'> 回复</a></td></tr>");
				});
				
				$(".pagination").append("<li><a class='getmsga_prev'>Prev</a></li>");
				for(var i=1;i<=pd.totalPage;i++){
					if(i==pd.page)
					{
					$(".pagination").append("<li class='active'><a class='getmsga_page'>"+i+"</a></li>");
					}else{
					$(".pagination").append("<li><a class='getmsga_page'>"+i+"</a></li>");
					}
				}
				$(".pagination").append("<li><a class='getmsga_next'>Next</a></li>");
				nowPage=pd.page;
				maxPage=pd.totalPage;
				}else{
					$("#messagetable").append("<tr><td ></td></tr><td><h1 class='text-center'><img src='images/nomessage.png'></h1></td></tr>");
					$("#messagetablediv").css("height","400px");
				}
			});
		}
		
		
		//获取类型
		$.get("TypesServlet",{"op":"unittype"},function(TypesData,status){
				$.each(TypesData,function(index,type){
					var goodtypes = "goodtypes"+index+"";

					$(".typeshow").append("<div class='col1'><div id="+goodtypes+" class='h_nav'><a class='typea'><h4 >"+type.TYPENAME+"</h4></a></div></div>");
					//得到小类型 
					var typename = type.TYPENAME;
					
					 $.get("TypesServlet",{"op":"unittypemes","typename":typename},function(TypemesData,status){
							
						$.each(TypemesData,function(index,typemes){
						
							$("#"+goodtypes+"").append("<li><a  href='' style='color: gray;'>"
							+typemes.TYPEMESNAME+"</a></li>");
							$("#"+goodtypes+"").append("</br>");			
						   });
					});	
				})
		})
		$(document).on("click",".typea",function(){
			location.href="GoodsServlet?op=getGoodsByType&key="+$(this).text();
		})			
		//回复点击事件
		$(document).on("click",".returngmsga",function(){
			alert("该功能管理员没时间实现，请直接使用留言");
		})
		
		//商品数量减号按钮
		$(document).on("click", ".input-number-decrement", function() {
			if ($(".input-number").val() > 1) {
				$(".input-number").val($(".input-number").val() - 1);
			}
		});
		//商品数量加号按钮
		$(document).on("click", ".input-number-increment", function() {
			if ($(".input-number").val() < maxcount) {
				$(".input-number").val(parseInt($(".input-number").val()) + 1);
			}
		});
		//商品数量编辑框事件
		$(document).on("change", ".input-number", function() {
			if ($(this).val() <= 1) {
				$(".input-number-decrement").attr("disabled", "disabled");
			}
			if ($(this).val() >= maxcount) {
				$(".input-number-increment").attr("disabled", "disabled");
				$(this).val(maxcount);
			}
		});
		//收藏a标签事件
		$("#likegood").click(function(){
			addlike(${requestScope.gd.GOODID});
		});
		//留言选项卡按钮事件
		$("#getmessage").click(function(){
			getMsg(1);
		});
		
		
		
		
		//留言分页页码点击事件
		$(document).on("click",".getmsga_page",function(){
			getMsg($(this).text());
		});
		//留言Prev点击事件
		$(document).on("click",".getmsga_prev",function(){
			if(nowPage>1){
				getMsg(nowPage-1);
				
			}
		});
		//留言Next点击事件
		$(document).on("click",".getmsga_next",function(){
			if(nowPage<maxPage){
				getMsg(nowPage+1);
			}
		});
		
	//收藏商品函数
	function addlike(goodId){
		if(${requestScope.gd.SELERNAME!=sessionScope.user1}&&${sessionScope.user1!=null}){
			$.post("LikeServlet",{"op":"likeGood","goodId":goodId},function(data,status){
				alert(data.substr(data.length-3,data.length));
				$("#likecount").text(parseInt(data));
				getinfo();
			});
			}else if(${requestScope.gd.SELERNAME==sessionScope.user1}){
				alert("无法收藏自己的商品");
			}else{
				alert("请先登录");
			}
	}
	
	//加入购物车
	$("#btnshoppingcar").click(function(){
		if(${sessionScope.user1==null}){
			alert("请先登录，在尝试操作");
		}else{
		var goodId=${requestScope.gd.GOODID};
		addToSC(goodId);
		}
	});

	//获取收藏数与购物车数
	function getinfo(){
	//获取个人收藏数目
	 $.get("LikeServlet",{"op":"unitlike"},function(Likecount,status){
		 
		 $("#mylikecount").text(Likecount);
	 });
	
	//动态显示购物车 数量 
	 $.get("CartServlet",{"op":"unitcart"},function(cartcount,status){
		 $("#mysccount").text(cartcount);
	 });};
		
		//立即购买
		$("#btngoshopping").click(function(){
			if(${sessionScope.user1!=null})
			{
				var count=$(".input-number").val();
				var goodid=${requestScope.gd.GOODID};
				location.href="CartServlet2?op=zhijie&count="+count+"&goodid="+goodid;
				
			}else{
				alert("请先登录，再尝试操作！");
			}
			
		});
		
		//发送留言 "userName":${sessionScope.userName},
		$("#btnmessage").click(function(){
			if(${sessionScope.user1!=null}){
				if($("#sendmessagecontent").html().length>0){
					$.post("MessageServlet",{"op":"sendGoodMessage","goodId":${requestScope.gd.GOODID},"messageContent":$("#sendmessagecontent").html()},function(data,status){
					$("#sendmessagecontent").html("");
					getMsg(1);
				});
					}else{
					alert("发送内容不能为空");
				}
			}else{
				alert("请先登录")
			}
		});	
		//联系卖家超链接点击事件
		$("#contactseler").click(function(){
			location.href="#gcontent";
			$("#goodsremarkli").removeClass("active");
			$("#getmessageli").addClass("active");
			getMsg(1);
		});
		
		//复制按钮事件
		$("#btncopy").click(function(){
			$("#urlarea").select();
			document.execCommand("Copy");
		});
		
		//表情列表点击输入表情事件;
		$(document).on("click",".bq",function(){
			$("#sendmessagecontent").html($("#sendmessagecontent").html()+"<img src="+$(this).attr("src")+">");
			$("#modal-bqcontainer").modal("hide");
		});
		
		$(document).on("click",".addsc",function( e ){
			if(${sessionScope.user1!=null}){
				var id=$(this).parents("div").children("input").val();
				
				//得到商品的id
				addToSC(id);
			}else{
				alert("请先登录，在尝试操作");
			}
			
		});
		
	$(".addtwl").click(function(){
		var id=$(this).parents("div").children("input").val();
		
		addlike(id);
		})
		
		
		
		//加入购物车方法
		function addToSC(goodId){
			$.post("GoodsServlet",{"op":"addToSC","goodId":goodId,"goodCount":$(".input-number").val()},function(count,states){
				$("#mysccount").text(count);
				alert("商品已加入购物车！");
				 
			});
		}
		
		
		
		
		
	})
</script>
</head>

<body>
	<input type="hidden" class="toastvaladd"
						value="$.toast({
    heading: 'Information',
    text: '成功加入购物车',
    showHideTransition: 'slide',
    icon: 'success',
     position: 'top-center',
    textAlign: 'center', 
    hideAfter: 1000
})" />
<input type="hidden" class="toastvallike" value="$.toast({
    heading: 'Information',
    text: '已经收藏啦啦',
    showHideTransition: 'slide',
    icon: 'success',
     position: 'top-center',
    textAlign: 'center', 
    hideAfter: 1000
})" />
	<!-- header-section-starts -->
	<div class="header">
		<div class="top-header">
			<div class="wrap">
				<div class="header-left">
					<ul>
						<li><a >联系我们 </a></li>
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
						<li class="login"><i class="lock"></i> <a id="login" href="#loginModal" data-toggle="modal">[hi~]登录</a> 
						<a id="Writeoff" >注销</a> 
						<a href="${path }/reg.jsp" id="reg">我要注册</a></li>
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

						<input type="search" placeholder="请输入您要搜索的内容..." id="keytext">
						<input type="button" value="搜用户" id="pbtn" /> <input id="rbtn"
							type="button" value="搜商品" />

						
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!-- header-section-ends -->
	<div class="wrap">
		<div class="navigation-strip">
			<h4>
				网站导航<i class="arrow"></i>
			</h4>
			<div class="top-menu">
				<!-- start header menu -->
				<ul class="megamenu skyblue">
					<!-- li1我们网站全部提供商品 -->
					<li><a class="color1" >All We off</a> <!-- 导航第一列 -->
						<div class="megapanel"background: #f7f7f7;">
							<div class="row typeshow"></div>

						</div> <!-- 导航第一列 结束--></li>
					<li class="grid"><a class="color2" >首页</a></li>
					<li class="grid"><a class="color3" >降降降</a></li>
					<li><a class="color7" >二手商品</a></li>
					<li><a class="color8" >周边</a></li>
					<li><a class="color4" >免费送 | </a></li>
					<li><a class="color5" >我的闲置</a> <!-- 修改位置 -->
						<div class="megapanel" style="width: 18%; left: 498px;">
							<div class="row">

								<div class="h_nav">
									<ul>
										<li><a href="">出售中：</a>0</li>
										<li><a href="">交易中：</a>0</li>
										<li><a href="">新留言：</a>0</li>
									</ul>
								</div>


							</div>

						</div></li>
					<li><a class="color6" >发布闲置</a></li>
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>
		<!-- start main -->
		<div class="main_bg">
			<div class="main">
			
				<div>
					<div class="picdiv col-md-5">
						<ul id="etalage">
							<li class="etalageli"><img class="etalage_thumb_image"
								src="${requestScope.gd.GOODPIC }" class="img-responsive" /> <img
								class="etalage_source_image" src="${requestScope.gd.GOODPIC }"
								class="img-responsive" title="" /></li>
							
						</ul>

						<div class="clearfix"></div>
					</div>

					<!-- start span1_of_1 -->
					<!--line-height: 10px-->
					<div class="col-md-7">
						<div class="">
							<table id="right_a">
								<tbody>
									<tr>
										<td colspan="2">
											<h2>${requestScope.gd.GOODTITLE}</h2>
										</td>
									</tr>
									<tr>
										<td>
											<h4>原价：</h4>
										</td>
										<td>
											<h4>
												￥<s>${requestScope.gd.ORIGINALPRICE}</s>
											</h4>
										</td>
									</tr>
									<tr id="resaleprice">
										<td>
											<h4>转卖价：</h4>
										</td>
										<td>
											<h2 class="text-danger">￥${requestScope.gd.GOODPRICE}</h2>
										</td>
									</tr>
									<tr>
										<td>
											<h4>卖家：</h4>
										</td>
										<td>
											<h4>
												<a
													href="GoodsServlet?op=getSellGood&taname=${requestScope.gd.SELERNAME}">${requestScope.gd.SELERNAME}</a>
											</h4>
										</td>
									</tr>
									<tr>
										<td width="15%">
											<h4>联系卖家：</h4>
										</td>
										<td><i class="user"></i> <a id="contactseler"
											href="#messagearea" data-toggle="tab">发送留言</a></td>
									</tr>

									<tr>
										<td>成色：</td>
										<td>非全新</td>
									</tr>
									<tr>
										<td>交易方式：</td>
										<td>在线交易</td>
									</tr>
								</tbody>
								<tfoot>
									<tr>
										<td><label class="control-label">数量：</label></td>

										<td><span class="input-number-decrement">–</span><input
											class="input-number" type="text" value="1" min="0" max="10"><span
											class="input-number-increment">+</span><span id="">
												库存为（${requestScope.gd.GOODCOUNT}）个</span></td>
									</tr>
								</tfoot>
							</table>
							<br />
							<div id="right_b">
								<button id="btnshoppingcar" class="btn-lg btn">加入购物车</button>
								<button id="btngoshopping" class="btn-lg btn btn-default">立即购买</button>
							</div>
						</div>
						<br />
						<div id="right_c">
							<ul class="nav nav-pills">
								<li class="active"><a>浏览 <span class="badge">${requestScope.gd.GOODCLICK}</span></a>
								</li>
								<li class="active"><a id="likegood">收藏<span
										class="badge" id="likecount">${requestScope.gd.LIKECOUNT}</span></a>
								</li>
								<li class="active" id="sharea" href="#modal-container-512052"
									role="button" class="btn" data-toggle="modal"><a>分享</a></li>
							</ul>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>

				<div class="row">
					<div class="col-md-12 column">
						<div class="tabbable" id="tabs-602747">
							<ul class="nav nav-tabs">
								<li class="active" id="goodsremarkli"><a
									href="#goodsremarkarea" data-toggle="tab">商品详情</a></li>
								<li id="getmessageli"><a href="#messagearea"
									data-toggle="tab" id="getmessage">留言</a></li>
							</ul>
							<div class="tab-content" id="gcontent">
								<div class="tab-pane active" id="goodsremarkarea">
									<br />
									<div id="goodsremark">
										<p class="lead text-center">${requestScope.gd.GOODREMARK}</p>
									</div>
									<div id="goodspicdiv" align="center">
									<img id="goodspic" src="${requestScope.gd.GOODPIC }" />
										<img src="${requestScope.gd.PICFIRST }" /> <img
											src="${requestScope.gd.PICSECOND }" /> <img
											src="${requestScope.gd.PICTHIRD }" />
									</div>
								</div>
								<br />
								<div class="tab-pane" id="messagearea" align="center">
									<div>
										<div id="messagetablediv">
											<table id="messagetable">
												<tbody>

												</tbody>
											</table>
										</div>
										<div id="pageare" align="right">
											<ul class="pagination">

											</ul>
										</div>
										<div>
											<a href="#modal-bqcontainer" role="button" class="btn"
												data-toggle="modal"><i class="bqico"></i></a>
										</div>
										<div contenteditable="true" id="sendmessagecontent"></div>
										<br />
										<div id="btnmessagearea" align="center">
											<button class="btn btn-lg " id="btnmessage">留言</button>
										</div>
										<br />

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!--中间快速浏览栏-->
				<div class="device">
					<div class="course_demo">
						<ul id="flexiselDemo">
							<li id="ipadone">
								<div class="ipad text-center">
									<a><img src="images/phone.jpg" alt="" />
									<h4></h4></a>
									<h3></h3>
									<input type="hidden">
									<ul>
										<li><i class="cart-1"></i></li>
										<li><a class="cart addsc">Add To Cart</a></li>
									</ul>
									<div class="clearfix"></div>
									<ul>
										<li><i class="heart"></i></li>
										<li><a class="cart addtwl">Add To Wishlist</a></li>
									</ul>
								</div>
								
							</li>
							<li id="ipadtwo">
								<div class="ipad text-center">
									<a><img alt="" />
									<h4></h4></a>
									<h3></h3>
									<input type="hidden">
									<ul>
										<li><i class="cart-1"></i></li>
										<li><a class="cart addsc">Add To Cart</a></li>
									</ul>
									<div class="clearfix"></div>
									<ul>
										<li><i class="heart"></i></li>
										<li><a class="cart addtwl">Add To Wishlist</a></li>
									</ul>
								</div>
							</li>
							<li id="ipadthree">
								<div class="ipad text-center">
									<a><img alt="" />
									<h4></h4></a>
									<h3></h3>
									<input type="hidden">
									<ul>
										<li><i class="cart-1"></i></li>
										<li><a class="cart addsc">Add To Cart</a></li>
									</ul>
									<div class="clearfix"></div>
									<ul>
										<li><i class="heart"></i></li>
										<li><a class="cart addtwl">Add To Wishlist</a></li>
									</ul>
								</div>
							</li>
							<li id="ipadfour">
								<div class="ipad text-center">
									<a><img alt="" />
									<h4></h4></a>
									<h3></h3>
									<input type="hidden">
									<ul>
										<li><i class="cart-1"></i></li>
										<li><a class="cart addsc">Add To Cart</a></li>
									</ul>
									<div class="clearfix"></div>
									<ul>
										<li><i class="heart"></i></li>
										<li><a class="cart addtwl">Add To Wishlist</a></li>
									</ul>
								</div>
							</li>
							<li id="ipadfive">
								<div class="ipad text-center">
									<a><img alt="" />
									<h4></h4></a>
									<h3></h3>
									<input type="hidden">
									<ul>
										<li><i class="cart-1"></i></li>
										<li><a class="cart addsc">Add To Cart</a></li>
									</ul>
									<div class="clearfix"></div>
									<ul>
										<li><i class="heart"></i></li>
										<li><a class="cart addtwl">Add To Wishlist</a></li>
									</ul>
								</div>
							</li>
							<li id="ipadsix">
								<div class="ipad text-center">
									<a><img alt="" />
									<h4></h4></a>
									<h3></h3>
									<input type="hidden">
									<ul>
										<li><i class="cart-1"></i></li>
										<li><a class="cart addsc">Add To Cart</a></li>
									</ul>
									<div class="clearfix"></div>
									<ul>
										<li><i class="heart"></i></li>
										<li><a class="cart addtwl">Add To Wishlist</a></li>
									</ul>
								</div>
							</li>

						</ul>
					</div>
				</div>
				<!--中间快速浏览栏-->
				<!--</div>-->

				<div class="clearfix"></div>
			</div>
		</div>
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
	<!--遮罩窗体  -->
	<div class="col-md-12 column">
		<div class="modal fade" id="modal-container-512052" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
						<h4 class="modal-title" id="myModalLabel">请复制地址：</h4>
					</div>
					<div class="modal-body">
						<input tpye="text" id="urlarea" class="form-control">
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-lg" id="btncopy"
							data-dismiss="modal">复制</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--遮罩窗体  -->

	<!--表情  -->
	<div class="col-md-12 column">
			<div class="modal fade" id="modal-bqcontainer" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
							<br/>
						</div>
						<div class="modal-body">
							<table class="table table-condensed table-hover table-bq">
								<tbody>

								</tbody>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>


</html>