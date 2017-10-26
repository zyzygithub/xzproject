<%@page import="com.etc.entity.Types"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%--jstl标签库的导入 --%>
<%@ taglib prefix="t" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getLocalPort()
			+ request.getContextPath();
	application.setAttribute("path", path);
%>

<!DOCTYPE html>
<html>

<head>
<title>闲之| Home</title>
<!-- 主页的头部图标 -->
<link rel="apple-touch-icon"
	href="https://upzip.b0.upaiyun.com/website/3.6.0/icons/logo1@128.png">
<link rel="shortcut icon"
	href="https://upzip.b0.upaiyun.com/website/3.6.0/favicon.ico">

<link href="${path}/css/bootstrap.css" rel='stylesheet' type='text/css' />

<script src="${path}/js/jquery.min.js"></script>

<link href="${path}/css/mainshow.css" rel="stylesheet" type="text/css"
	media="all" />

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
<link href="${path}/css/megamenu.css" rel="stylesheet" type="text/css"
	media="all" />
<!-- bootstrap -->
<link rel="stylesheet" href="${path}/bootstrap/css/bootstrap.css" />
<link rel="stylesheet" href="${path}/css/bootstrap.css" />
<script type="text/javascript" src="${path}/js/jquery-2.1.0.js"></script>
<script type="text/javascript" src="${path}/bootstrap/js/bootstrap.js"></script>

<!-- bootstrap -->
<!-- toast  -->
<link rel="stylesheet" href="${path}/css/jquery.toast.css">
<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="${path}/js/jquery.toast.js"></script>

<script type="text/javascript" src="${path}/js/megamenu.js"></script>
<script>$(document).ready(function(){$(".megamenu").megamenu();});</script>

<!-- start slider -->
<script src="${path}/js/responsiveslides.min.js"></script>



<script>
    $(function () {
      $("#slider").responsiveSlides({
      	auto: true,
      	speed: 500,
        namespace: "callbacks",
        pager: true,
      });
    });
  </script>
<!--end slider -->

<!-- flexisel滚动商品显示开始 -->
<link rel="stylesheet" href="${path}/css/flexslider.css" type="text/css"
	media="screen" />
<script type="text/javascript">
			$(window).load(function() {
				$("#flexiselDemo").flexisel({
					/*选取数据库中最新的5条商品数据 滚动显示  */
					visibleItems: 5,
					animationSpeed: 1000,
					autoPlay: true,
					autoPlaySpeed: 2000,    		
					pauseOnHover: true,
					enableResponsiveBreakpoints: true,
			    	responsiveBreakpoints: { 
			    		portrait: { 
			    			changePoint:480,
			    			visibleItems: 1
			    		}, 
			    		landscape: { 
			    			changePoint:640,
			    			visibleItems: 2
			    		},
			    		tablet: { 
			    			changePoint:768,
			    			visibleItems: 3
			    		}
			    	}
			    });
			    
			});
		</script>
<!-- 滚动显示商品的js -->
<script type="text/javascript" src="${path}/js/jquery.flexisel.js"></script>

<!-- flexisel滚动商品显示结束 -->
<script type="text/javascript"> 
$(function() {
	/*初始化页面begin*/
	//得到大类型
		 $.get("${path}/TypesServlet",{"op":"unittype"},function(TypesData,status){
			
			$.each(TypesData,function(index,type){
				var goodtypes = "goodtypes"+index+"";
				
				$(".typeshow").append("<div class='col1'><div id="+goodtypes+" class='h_nav'><h4>"+type.TYPENAME+"</h4></div></div>");
				//得到小类型 
				var typename = type.TYPENAME;
				
				 $.get("${path}/TypesServlet",{"op":"unittypemes","typename":typename},function(TypemesData,status){
						
					$.each(TypemesData,function(index,typemes){
						$("#"+goodtypes+"").append("<li><a  href='products.html' style='color: gray;text-decoration: underline;'>"
						+typemes.TYPEMESNAME+"</a></li>");
						$("#"+goodtypes+"").append("</br>");			
					   });
				});
				
				
			});
			
		});
	
	//获取人气商品
	function gethostlikelist(type){
		
		$("#hostlikelist div").remove();
		$.post("GoodsServlet",{"op":"getGoodsByTypePage","key":type},function(pd,states){
			$.each(pd.data,function(index,goods){
				$("#hostlikelist").append("<div class=' ipad text-center '"+
						"style='display: inline-block; width: 18%; height: 300px; background-color:; margin: 10px; font-family: ms sans serif, arial; font-size: 8pt; width: 100; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;'>"
				+"<a class='' href='GoodsServlet?op=getGD&goodId="+goods.GOODID+"'><img src='"+goods.GOODPIC+"' alt=''style='width: 95%; height: 170px;' />"
				+" <h4>"+goods.GOODTITLE+"</h4></a><h3 style='display: inline'>$"+goods.GOODPRICE+" </h3>"
				+"<h4 style='text-decoration: line-through; display: inline'> $"+goods.ORIGINALPRICE+"</h4>"
				+"<input type='hidden' value='"+goods.GOODID+"'><br />"+goods.GOODREMARK
				+"<br /><ul><li><i class='cart-1'></i><a class='cart' style='cursor:pointer;'>Go Cart</a><i class='heart'></i><a class='like' style='cursor:pointer;'>I Like</a></li></ul></div>");
				})
			})
			}
		

	//初始化函数
	(function ini(){
		 if(${sessionScope.user1!=null}){
			  $("#userName").val("${sessionScope.user1}");
			  $("#login").css("display","none");
			  
			  $("#Writeoff").css("display","display");
			  //动态显示收藏数量 
				 $.get("${path}/LikeServlet",{"op":"unitlike"},function(Likecount,status){
					 
					 $("#mylikecount").text(Likecount);
				 });
				//动态显示购物车 数量 
				 $.get("${path}/CartServlet",{"op":"unitcart"},function(cartcount,status){
					 $("#mysccount").text(cartcount==null? 0:cartcount);
				 });
		  }else{
			  //未登录，注销键隐藏
			  $("#Writeoff").css("display","none");
		  }
		 //当UserServlet有消息传回时，弹出消息
		  if(${sessionScope.mainmsg!=null}){
			  alert("${sessionScope.mainmsg}");
			  
		  }
		 //消息弹出后移除
		  <%session.removeAttribute("mainmsg");%>
		  var type=$(".hostliketype").eq(0).text();
		  gethostlikelist(type);
		  type=$(".newgoodtype").eq(0).text();
		  getHostGoods(type);
		  //是否为记住账号标记
		  if (localStorage["userName"]!=null) {
				$("#userName").val(localStorage["userName"]);
				$("#rember").attr("checked",true);
			}else{
				$("#rember").attr("checked",false);
			}
	})();
	//登录按钮
	$("#loginbtn").click(function(){
		//判断是否要记住账号
		 if($("#rember").attr("checked")){
			localStorage.removeItem("userName");
		}else{
			localStorage["userName"] = $("#userName").val();
		} 
		//请求UserServlet 验证用户信息
		//location.href="UserServlet?up=login&userName="+$("#userName").val()+"&userPassword="+$("#userPassword").val();
		$.post("UserServlet",{"up":"login","userName":$("#userName").val(),"userPassword":$("#userPassword").val()},function(msg,states){
			if(msg=="登陆成功"){
				location.href="mainshow.jsp";
			}
			alert(msg);
		})
	
	})
	//注销按钮
	$("#Writeoff").click(function(){
		if(confirm("确认要注销？")){
			//location.href="UserServlet?up=writeOff";
			$.post("UserServlet",{"up":"writeOff"},function(msg,states){
				location.reload(true);
				alert(msg);
			})
		}
		
	})
	//人气收藏种类按钮
	$(".hostliketype").click(function(){
		$(".hostliketype").removeClass("active");
		$(this).addClass("active");
		var type=$(this).text();
		gethostlikelist(type);
	})
	//最新商品种类按钮
	$(".newgoodtype").click(function(){
		$(".newgoodtype").removeClass("active");
		$(this).addClass("active");
		var type=$(this).text();
		getHostGoods(type);
	})
	//登录按钮修改模态框标题为LOGIN
	$("#login").click(function(){
		$("#myModalLabel").text("LOGIN");
	})
	//最畅销商品类型点击事件
	$(".showhosttype").click(function(){
		key=$(this).find("h3").text();
		location.href="GoodsServlet?op=getGoodsByType&key="+key;
	})
	//2、加入收藏
	$(document).on("click",".like",function( e ){
		var userName = "${sessionScope.user1}";
		//得到商品的id
		if(userName!=null){
		var $input = $(this).parents("div").children("input").val();
		
	  		$.post("LikeServlet",{"op":"addLike","goodId":$input},function(data,status){
	  			alert(data.substr(data.length-3,data.length));
	  			$("#mylikecount").text(parseInt(data));
		
	});}else{
		alert("请先登录，再尝试操作");
	}
	});
	//下方轮播栏获取信息
	function getHostGoods(type){
		idg=["one","two","three","four","five","six"];
		$.post("GoodsServlet",{"op":"getHostGoods","type":type},function(data,state){
			$.each(data,function(index,goods){
				var id="#ipad"+idg[index];
				$(id+" div img").attr("src",goods.GOODPIC);
				$(id+" div h4").text(goods.GOODTITLE);
				//$(id+" div h4").val(goods.GOODID);
				$(id+" div h3").text("￥"+goods.GOODPRICE);
				$(id+" div input").val(goods.GOODID);
			})
		})
	}
	
	$("#pbtn").click(function(){
		location.href="GoodsServlet?op=getSellGood&taname="+$("#keytext").val();
	})
	
	//搜索按钮事件
	$("#rbtn").click(function(){
		var key=$("#keytext").val();
		location.href="GoodsServlet?op=searchGoods&key="+key;
	})
	
	//进入我的中心按钮点击事件
	$("#mycenter").click(function(){
		//未登录时弹出登陆框并修改其标题为“请先登录”
		 if(${sessionScope.user1==null}){
			$("#myModalLabel").text("请先登录");
		}else{
			//登录时直接跳转至我的中心消息管理页面
			$(this).attr("data-toggle","")
			$(this).attr("href","account_message.jsp");
			
		} 
	})
	
	
	
	
	//下方轮播加入购物车
	$(document).on("click",".cart",function( e ){
		if(${sessionScope.user1!=null}){
			var userName = "${sessionScope.user1}";
			//得到商品的id
		    var $input = $(this).parents("div").children("input").val();
		    addToSC($input);
		   
			         
		}else{
			alert("请先登录，在尝试操作");
		}
		
	});
	//最新商品图片点击事件
	$(".hostpic").click(function(){
		$id=$(this).parent("div").children("input").val();
		location.href="GoodsServlet?op=getGD&goodId="+$id;
	})
	//view all点击事件
	$(".getall").click(function(){
		location.href="GoodsServlet?op=searchGoods&key=";
	})
	
	
	//加入购物车函数
	function addToSC(goodId){
		$.post("GoodsServlet",{"op":"addToSC","goodId":goodId,"goodCount":1},function(count,states){
			$("#mysccount").text(count);
			alert("商品已加入购物车");
		});
	}
}); 



</script>
</head>
<body>
	
	<!-- header-section-starts -->
	<div class="header">
		<div class="top-header">
			<div class="wrap">
				<div class="header-left">
					<ul>
						<li><a>联系我们 </a></li> |
						<t:if test="${sessionScope.user1 != null}">

							<li><a id="usermes" href="order.html">Hi~
									${sessionScope.user1}</a></li>
						</t:if>
						<t:if test="${sessionScope.user1 == null}">

							<li><a id="usermes" href="order.html">Hi~ 游客</a></li>
						</t:if>
					</ul>
				</div>
				<div class="header-right">
					<ul>
						<li><a href="${path }/mainshow.jsp">HOME</a></li>
						<li><i class="user"></i> <!-- 先默认去充钱的个人中心 --> <a
							id="mycenter" href="#loginModal" data-toggle="modal">我的</a></li>
						<li class="login"><i class="lock"></i> 


							<a id="login" href="#loginModal" data-toggle="modal">[hi~]登录</a>
							<a id="Writeoff">注销</a> <a href="${path }/reg.jsp" id="reg">我要注册</a>
						</li>
						<li id="collection"><i class="heart"></i> <a
							href="mylike.jsp">收藏</a> <!-- 动态显示收藏数量 -->
						<li class="last" id="mylikecount">0</li>
						</li>
						<li id="shopingcart"><i class="cart"></i> <a
							href="shoppingcart.jsp">购物车</a> <!-- 动态显示购物车数量 -->
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
					<li><a class="color1">All We off</a> <!-- 导航第一列 -->
						<div class="megapanel" style="background: #f7f7f7;">
							<div class="row typeshow"></div>

						</div> <!-- 导航第一列 结束--></li>
					<li class="grid"><a class="color2">首页</a></li>
					<li class="grid"><a class="color3">降降降</a></li>
					<li><a class="color7" href="#">二手商品</a></li>
					<li><a class="color8" href="#">周边</a></li>
					<li><a class="color4" href="#">免费送 | </a></li>
					<li><a class="color5" href="#">我的闲置</a> <!-- 修改位置 -->
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
					<li><a class="color6" href="#">发布闲置</a></li>


				</ul>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="main-top" style="border-left: 1px solid #B9B9B9;">
			<div class="col-md-8 banner">
				
				<div class="slider" style="margin-left: -15px;">
					
					<div class="callbacks_container">
						<ul class="rslides" id="slider">
							<li><a><img src="images/slider1.jpg" alt="" /></a>
								<div class="row text-center">
									<div class="clearfix"></div>
									<h3></h3>
									<a hr></a></li>
							<li><a><img src="images/slider2.jpg" alt="" /></a>
								<div class="row text-center">
									<div class="clearfix"></div>
									<h3></h3>
								</div></li>
							<li><a><img src="images/slider3.jpg" alt="" /></a>
								<div class="row text-center">
									<div class="clearfix"></div>
									<!-- <h3>良品铺子：科技以人为本， 网聚人的力量。</h3> -->
								</div></li>
							<li><a><img src="images/slider4.jpg" alt="" /></a>
								<div class="row text-center">
									<div class="clearfix"></div>
									<h3>微购 高管团队全程协助运营,专业服务,平台入驻,运营,交易,物流一站式服务</h3>
								</div></li>
						</ul>
					</div>
				</div>
				<!----->
				<!-- end  slider -->
			</div>
			<div class="col-md-4 right-grid">
				<div class="right-grid-top">
					<div class="r-sale text-center">
						<h6>Winter wear</h6>
						<h2>Sale</h2>
					</div>
					<div class="r-discount">
						<span>upto</span>
						<h2>50%</h2>
						<p>OFF</p>
						<a>shop now<i class="go"></i></a>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="right-grid-bottom">
					<div class="right-grid-bottom-left">
						<h3>Deal of the Day</h3>
						<p>Expires in 3:42:56</p>
						<h5>Wireless Headphones</h5>
						<h2>Extra 33% OFF</h2>
						<a href="single.html">shop now<i class="go"></i></a>
					</div>
					<div class="right-grid-bottom-right">
						<img src="images/headset.png" alt="" />
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
		<!-- 类型展示模块 -->
		<div class="new-arrivals text-center">
			<div class="col-md-3 new-arrival-head">
				<h3>最畅销类型</h3>
				<a class="btn btn-1 btn-1d getall"html">View All</a>
			</div>
			<div class="col-md-3 product-item">
				<a class="showhosttype"><img src="images/connection.jpg"
					class="img-responsive geshi1" alt="" />
					<h3>电子产品</h3></a> <a class="showhosttype">Shop Now<i class="go"></i></a>
			</div>

			<div class="col-md-3 product-item">
				<a class="showhosttype"><img src="images/cloths.jpg"
					class="img-responsive  geshi1" alt="" />
					<h3 class="showhosttype">服饰鞋履</h3></a> <a class="showhosttype">Shop
					Now<i class="go"></i>
				</a>
			</div>
			<div class="col-md-3 product-item">
				<a class="showhosttype"><img src="images/jiaju.jpg"
					class="img-responsive zoom-img geshi1" alt="" />
					<h3>家居生活</h3></a> <a class="showhosttype">Shop Now<i class="go"></i></a>
			</div>
			<div class="clearfix"></div>
		</div>
		<!-- 类型展示模块end -->
		<!-- 商品展示模块begin -->
		<div class="best-sellers">
			<div class="best-sellers-head">
				<h3>最新闲置</h3>
			</div>
			<div class="best-sellers-menu">
				<ul>
					<li><a class="active newgoodtype">电子产品</a></li>
					<li><a class="newgoodtype">服饰鞋履</a></li>
					<li><a class="newgoodtype">家居生活</a></li>
					<li><a class="newgoodtype">母婴</a></li>
					<li><a class="newgoodtype">旧书籍</a></li>
					<li><a class="getall">View All</a></li>
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>
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
		<input type="hidden" class="toastvallike"
			value="$.toast({
    heading: 'Information',
    text: '已经收藏啦啦',
    showHideTransition: 'slide',
    icon: 'success',
     position: 'top-center',
    textAlign: 'center', 
    hideAfter: 1000
})" />


		<!--商品展示导航  -->

		<div class="device">
			<div class="course_demo">
				<ul id="flexiselDemo">
					<li id="ipadone">
						<div class="ipad text-center">
							<a class="hostpic"><img alt="" />
								<h4></h4></a>
							<h3></h3>
							<input type="hidden" />
							<ul>
								<li><i class="cart-1"></i></li>
								<li><a class="cart">Add To Cart</a></li>
							</ul>
							<div class="clearfix"></div>
							<ul>
								<li><i class="heart"></i></li>
								<li><a class="like">Add To Wishlist</a></li>
							</ul>
						</div>
					</li>
					<li id="ipadtwo">
						<div class="ipad text-center">
							<a class="hostpic"><img alt="" />
								<h4></h4></a>
							<h3></h3>
							<input type="hidden" />
							<ul>
								<li><i class="cart-1"></i></li>
								<li><a class="cart">Add To Cart</a></li>
							</ul>
							<div class="clearfix"></div>
							<ul>
								<li><i class="heart"></i></li>
								<li><a class="like">Add To Wishlist</a></li>
							</ul>
						</div>
					</li>
					<li id="ipadthree">
						<div class="ipad text-center">
							<a class="hostpic"><img alt="" />
								<h4></h4></a>
							<h3></h3>
							<input type="hidden" />
							<ul>
								<li><i class="cart-1"></i></li>
								<li><a class="cart">Add To Cart</a></li>
							</ul>
							<div class="clearfix"></div>
							<ul>
								<li><i class="heart"></i></li>
								<li><a class="like">Add To Wishlist</a></li>
							</ul>
						</div>
					</li>
					<li id="ipadfour">
						<div class="ipad text-center">
							<a class="hostpic"><img alt="" />
								<h4></h4></a>
							<h3></h3>
							<input type="hidden" />
							<ul>
								<li><i class="cart-1"></i></li>
								<li><a class="cart">Add To Cart</a></li>
							</ul>
							<div class="clearfix"></div>
							<ul>
								<li><i class="heart"></i></li>
								<li><a class="like" href="#">Add To Wishlist</a></li>
							</ul>
						</div>
					</li>
					<li id="ipadfive">
						<div class="ipad text-center">
							<a class="hostpic"><img alt="" />
								<h4></h4></a>
							<h3></h3>
							<input type="hidden" />
							<ul>
								<li><i class="cart-1"></i></li>
								<li><a class="cart">Add To Cart</a></li>
							</ul>
							<div class="clearfix"></div>
							<ul>
								<li><i class="heart"></i></li>
								<li><a class="like">Add To Wishlist</a></li>
							</ul>
						</div>
					</li>
					<li id="ipadsix">
						<div class="ipad text-center">
							<a class="hostpic"><img alt="" />
								<h4></h4></a>
							<h3></h3>
							<input type="hidden" />
							<ul>
								<li><i class="cart-1"></i></li>
								<li><a class="cart">Add To Cart</a></li>
							</ul>
							<div class="clearfix"></div>
							<ul>
								<li><i class="heart"></i></li>
								<li><a class="like">Add To Wishlist</a></li>
							</ul>
						</div>
					</li>
				</ul>
			</div>
		</div>
		<!-- 收藏商品导航 -->
		<div class="best-sellers">
			<div class="best-sellers-head">
				<h3>人气商品</h3>
			</div>
			<div class="best-sellers-menu">
				<ul>
					<li><a class="active hostliketype">电子产品</a></li>
					<li><a class="hostliketype">服饰鞋履</a></li>
					<li><a class="hostliketype">家居生活</a></li>
					<li><a class="hostliketype">母婴</a></li>
					<li><a class="hostliketype">旧书籍</a></li>
					<li><a class="getall">View All</a></li>
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>
		<!--收藏展示导航end  -->
		<div id="hostlikelist" class=" device"></div>
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

		<!-- 登录模态开始 -->


		<div class="modal fade" id="loginModal" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						
						<h2 class="modal-title" id="myModalLabel"
							style="text-align: center;">LOGIN</h2>
					</div>
					<div class="modal-body">
						<!--内容...-->

						<br />
						<div class="row clearfix">
							<div class="col-md-12 column">
								<div class="row clearfix">
									<div class="col-md-1 column"></div>
									<div class="col-md-10 column">

										<form class="form-horizontal" role="form" method="post">
											<div class="form-group">
												<label for="inputEmail3" class="col-sm-2 control-label">用户名</label>
												<div class="col-sm-10">
												
													<input type="text" class="form-control" id="userName"
														name="userName" />
													
												</div>
											</div>
											<div class="form-group">
												<label for="inputPassword3" class="col-sm-2 control-label">密码</label>
												<div class="col-sm-10">
													<input type="password" class="form-control"
														id="userPassword" name="userPassword" />
												</div>
											</div>
											<div class="form-group">
												<div class="col-sm-offset-2 col-sm-10">

													<div class="row clearfix">
														<div class="col-md-2 column"></div>
														<div class="col-md-4 column">
															<h4>
																<input type="checkbox" id="rember" /> 记住账号
															</h4>
														</div>
														<div class="col-md-6 column">
															<h4>
																<a href="ForgetPwd.jsp" style="margin-left: 30px">忘记密码</a>
															</h4>
														</div>
													</div>
												</div>
											</div>
											<div class="form-group">
												<div class="col-sm-offset-2 col-sm-10">
													<button type="button" class="btn btn-block" id="loginbtn">
														登录
														<tton>
												</div>
											</div>
										</form>
									</div>
									<div class="col-md-1 column"></div>
								</div>
							</div>
						</div>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">
							关闭
							<tton>
					</div>
				</div>

			</div>

		</div>


		<!-- 登录模态结束 -->

		<div class="modal fade" id="youkeModal" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header"></div>
					<div class="modal-body">
						<!--内容...-->

						<br />
						<div class="row clearfix">
							<div class="col-md-12 column">
								<div class="row clearfix">
									<div class="col-md-1 column"></div>
									<div class="col-md-10 column">
										<h1>校方认证失败！欢迎游客！</h1>
									</div>
									<div class="col-md-1 column"></div>
								</div>
							</div>
						</div>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">
							关闭
							<tton>
					</div>
				</div>

			</div>

		</div>
</body>
</html>