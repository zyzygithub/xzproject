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

    <link rel="stylesheet" type="text/css" href="plugin/datatables/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="plugin/datatables/dataTables.bootstrap.css  "/>
    <script src="plugin/datatables/jquery.js"></script>
    <script src="plugin/datatables/jquery.dataTables.min.js"></script>
    <script type="text/javascript" language="javascript" src="plugin/datatables/dataTables.bootstrap.js"></script>
    <script src="plugin/datatables/bootstrap.min.js"></script>
    <script src="plugin/date/bootstrap-datetimepicker.min.js"></script>
    <script src="plugin/handlebars-v3.0.1.js"></script>
<link href="cssleft/jquery-accordion-menu.css" rel="stylesheet"
	type="text/css" />
<link href="cssleft/font-awesome.css" rel="stylesheet" type="text/css" />

<style type="text/css">
* {
	box-sizing: border-box;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
}

 .goodcontent{
  height:80px;
	width:600% ;word-break: break-all;
    text-overflow: ellipsis;
    display: -webkit-box; /** 对象作为伸缩盒子模型显示 **/
    -webkit-box-orient: vertical; /** 设置或检索伸缩盒对象的子元素的排列方式 **/
    -webkit-line-clamp: 3; /** 显示的行数 **/
    overflow: hidden; 
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





<!--ajax区域-->
<script type="text/javascript">
	
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
						<li><a href="">欢迎你：${sessionScope.user1}</a></li>
					</ul>
				</div>
				<div class="header-right">
					<ul>
						<li>
							<a href="mainshow.jsp">HOME</a>
						</li>
						<li>
							<i class="user"></i>
							<a href="addBalance.jsp">我的</a>
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
				<li><a href="index.html">首页</a></li> &nbsp;&nbsp;/&nbsp;
				<li class="act">&nbsp;个人中心</li>
			</ul>
		</div>

		<!-- 中间的侧边导航栏 -->
		<div class="col-md-12">
			
		<div class="col-md-3">
		<div class="login-page" style="position: absolute; left: 5%;top: 30%;">
			
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
					
					<li><a class="buyin">待发货</a></li>
					<li><a class="buyin">已发货</a></li>
					<li><a class="buyin">待评价</a></li>
					<li><a class="buyin">已完成</a></li>
				</ul>
			</li>
			<li><a ><i class="fa fa-home fa-"></i>贩出</a>
				<ul class="submenu">
					
					<li><a class="out">待发货</a></li>
					<li><a class="out">已发货</a></li>
					<li><a class="out">已完成</a></li>
				</ul>
			</li>
			
			
			<li><a ><i class="fa fa-user"></i>个人中心</a>
				<ul class="submenu">
					<li><a href="mylike.jsp">我的收藏</a></li>
					<li><a href="account_comment.jsp">我的评价</a></li>
					<li><a href="UpdateInfo.jsp">个人资料</a></li>
				</ul>
			</li>
			<li><a href="addBalance.jsp"><i class="fa fa-money" ></i>充值</a>
			</li>
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


<!-- 隐藏属性 -->
<!--主要进行数据传递，从上到下一次为   当前用户、当前分页位置，当前分页大小，模糊检索，排序  -->
<p hidden="hidden" id="user">${sessionScope.user1}</p>
<p hidden="hidden" id="page">1</p>

<p hidden="hidden" id="pagesize"></p>
<p hidden="hidden" id="blurry"></p>
<p hidden="hidden" id="order">asc</p>

<%
String inorout=request.getParameter("inorout");
String state=request.getParameter("state");
%>


<p hidden="hidden" id="inorout"><%=inorout%></p>
<p hidden="hidden" id="state"><%=state%></p>
<p hidden="hidden" id="pagetotal"></p>

<!--更改的ajax块-->
<div class="col-md-9 personalajax"  >


		
		 
	

</div>


</div>
	
	
</div>
	</div>
	<!--尾巴-->
	<div class="footer col-md-12" style="position: absolute; top: 150%;">
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
 
/* 这一块全是待发货的功能  */


/* 点击购入后的所有按钮   */
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
})





	 $(".buyin").click(function(){
		
		 $(".personalajax").children().remove(); 
		 
		 
		 $("#blurry").text("");
		 
		 persongood_in_header();
		 
		 $("#page").text(1);
		 $("#pagesize").text(5);
		 $("#inorout").text("in");
		 
		 var inorout=$("#inorout").text();
		 var user=$("#user").text();
		 var page=$("#page").text();
		 var pagesize=$("#pagesize").text();
		 var blurry=$("#blurry").text();
		 var order=$("#order").text();
		
		
		 var state=$(this).text();
		 $("#state").text(state);
		 $.post('account_buy_servlet',{flag:"search",user:user,
			 page:page,
			 pagesize:pagesize,
			 blurry:blurry,
			 order:order,
			 state:state,
			 inorout:inorout},function(pd,state){
				 var jsonpd = JSON.parse(pd);
				
				 if(jsonpd.totalPage!=0){
					 
				$.each(jsonpd.data,function(index,PERSONGOODS_IN){
					persongood_in_body(PERSONGOODS_IN);
				
				
				})
				/* 分页加载  */
				var pagee=jsonpd.page;
				var paget=jsonpd.totalPage;	
				$("#pagetotal").text(paget);
				paging(pagee,paget)
				 }if(jsonpd.totalPage==0){
					 
					var p="<strong align='center'><img src='images/nocomment.jpg' ></strong>"
					 var pobj=$(p);
					 var ajax=$(".personalajax")
					
					
					pobj.appendTo(ajax);
				 }
			 })
	 })
	 
	 /* 点击贩出 后的所有按钮   */

	 $(".out").click(function(){
		 $(".personalajax").children().remove();
		 
		 
		 $("#blurry").text("");
		 persongood_in_header();
		 $("#page").text(1);
		 $("#pagesize").text(5);
		 $("#inorout").text("out");
		 var inorout=$("#inorout").text();
		 var user=$("#user").text();
		 var page=$("#page").text();
		 var pagesize=$("#pagesize").text();
		 var blurry=$("#blurry").text();
		 var order=$("#order").text();
		
		
		 var state=$(this).text();
		
		 $("#state").text(state);
		 $.post('account_buy_servlet',{flag:"search",user:user,
			 page:page,
			 pagesize:pagesize,
			 blurry:blurry,
			 order:order,
			 state:state,
			 inorout:inorout},function(pd,state){
				 var jsonpd = JSON.parse(pd);
				
				 if(jsonpd.totalPage!=0){
					 
				$.each(jsonpd.data,function(index,PERSONGOODS_IN){
					persongood_in_body(PERSONGOODS_IN);
				
				
				})
				/* 分页加载  */
				var pagee=jsonpd.page;
				var paget=jsonpd.totalPage;	
				$("#pagetotal").text(paget);
				paging(pagee,paget)
				 }if(jsonpd.totalPage==0){
					 
					var p="<strong align='center'><img src='images/nocomment.jpg' ></strong>"
					 var pobj=$(p);
					 var ajax=$(".personalajax")
					
					
					pobj.appendTo(ajax);
				 }
			 })
	 })
	 
	
	 
	 
	 
	 
	 /* 搜索 页面 改变  */
	 $(document).on('change','#search',function(){
			var text=$("#search").val();
			 $(".persongood_in_body").remove();
			 $(".paging").remove();
			 $("#page").text(1);
			 $("#blurry").text(text);
			 
			 var user=$("#user").text();
			 var page=$("#page").text();
			 var pagesize=$("#pagesize").text();
			 var blurry=$("#blurry").text();
			
			 var order=$("#order").text();
			 var state=$("#state").text();
			 
			 var inorout=$("#inorout").text();
			 $.post('account_buy_servlet',{flag:"search",user:user,
				 page:page,
				 pagesize:pagesize,
				 blurry:blurry,
				 order:order,
				 state:state,
				 inorout:inorout},function(pd,state){
					  var jsonpd = JSON.parse(pd);
				
				 if(jsonpd.totalPage!=0){
					 
				$.each(jsonpd.data,function(index,PERSONGOODS_IN){
					persongood_in_body(PERSONGOODS_IN);
				
				
				})
				/* 分页加载  */
				var pagee=jsonpd.page;
				var paget=jsonpd.totalPage;	
				$("#pagetotal").text(paget);
				paging(pagee,paget)
				 }if(jsonpd.totalPage==0){
					
					var p="<strong align='center' ><img src='images/nocomment.jpg' ></strong>"
					 var pobj=$(p);
					 var ajax=$(".personalajax")
					
					
					pobj.appendTo(ajax);
				 }
				 })
			
		})
		
		 /* 搜索 页数 改变  */
	 $(document).on('change','#waitpagesize',function(){
			var waitpagesize=$("#waitpagesize").val();
			
			$("#page").text(1);
			 $(".persongood_in_body").remove();
			 $(".paging").remove();
			 
			 $("#pagesize").text(waitpagesize);
			 
			 var user=$("#user").text();
			 var page=$("#page").text();
			 var pagesize=$("#pagesize").text();
			
			 var blurry=$("#blurry").text();
			
			 var order=$("#order").text();
			 var state=$("#state").text();
			 var inorout=$("#inorout").text();
			 $.post('account_buy_servlet',{flag:"search",user:user,
				 page:page,
				 pagesize:pagesize,
				 blurry:blurry,
				 order:order,
				 state:state,
				 inorout:inorout},function(pd,state){
					 var jsonpd = JSON.parse(pd);
				
				 if(jsonpd.totalPage!=0){
					 
				$.each(jsonpd.data,function(index,PERSONGOODS_IN){
					persongood_in_body(PERSONGOODS_IN);
				})
				/* 分页加载  */
				var pagee=jsonpd.page;
				var paget=jsonpd.totalPage;	
				$("#pagetotal").text(paget);
				paging(pagee,paget)
				 }if(jsonpd.totalPage==0){
					 
					var p="<strong align='center' ><img src='images/nocomment.jpg' ></strong>"
					 var pobj=$(p);
					 var ajax=$(".personalajax")
					
					pobj.appendTo(ajax);
				 }
				 }) 
			
		})
			/* 全选按钮  */
		
		$(document).on('click','#checkall',function(){
			var big=this.checked;
			
			$("input[id='checkone']").each(function(){
	         $(this).prop('checked',big);
		
				})	
		})
		/*  评价按钮 */
		
		$(document).on('click','.evaluate',function(){
			var username=$("#user").text();
			var sendid=$("#hename").text();
			
			$("#usernamedata").val(username);
			$("#sendiddata").val(sendid);
			
		
		})
		/*  评价提交 */
		
		$(document).on('click','.subdata',function(){
			
		
			 var username=$("#usernamedata").val();
			var sendid=$("#sendiddata").val();
			var score=$("#scoredata").val();
			var text=$("#textdata").val();
			var orderid=$("#orderid").text();
		
			if(score=="" || text==""){
				alert("不能放空 ");
			}else{
				var yesorno=confirm("是否评价 ");
				if(yesorno==true){
				
				 $.post('account_buy_servlet',{flag:"evaluate",username:username,
					 sendid:sendid,
					 score:score,
					 text:text,
					 orderid:orderid},function(){
						 
							
				alert("评价成功 ");
				
				 })
				 }else{
					 alert("评价失败  "); 
				 }
				 }
			$(".personalajax").children().remove();				 				 
			 persongood_in_header();
			 var inorout=$("#inorout").text();
			 var user=$("#user").text();
			 var page=$("#page").text();
			 var pagesize=$("#pagesize").text();
			 var blurry=$("#blurry").text();
			 var order=$("#order").text();
			 var state=$("#state").text();
			 $("#state").text(state);
			 $.post('account_buy_servlet',{flag:"search",user:user,
				 page:page,
				 pagesize:pagesize,
				 blurry:blurry,
				 order:order,
				 state:state,
				 inorout:inorout},function(pd,state){
					  var jsonpd = JSON.parse(pd);
				
				 if(jsonpd.totalPage!=0){
					 
				$.each(jsonpd.data,function(index,PERSONGOODS_IN){
					persongood_in_body(PERSONGOODS_IN);
				
				
				})
				/* 分页加载  */
				var pagee=jsonpd.page;
				var paget=jsonpd.totalPage;	
				$("#pagetotal").text(paget);
				paging(pagee,paget)
				 }if(jsonpd.totalPage==0){
					
					var p="<strong align='center' ><img src='images/nocomment.jpg' ></strong>"
					 var pobj=$(p);
					 var ajax=$(".personalajax")
					
					
					pobj.appendTo(ajax);
				 }
				 })
			
			
		
		})
		
		
		
			/* 日期 排序   */
		
		$(document).on('click','#updown',function(){
			var src=$(this).attr('src');
			var orderd=$("#order").text();
			$("#page").text(1);
			ascdesc(orderd);
			if(src=='imgbutton/up.jpg'){
				$(this).attr('src','imgbutton/down.jpg');
				
			}else if(src=='imgbutton/down.jpg'){
				$(this).attr('src','imgbutton/up.jpg');
				
			}

            $(".persongood_in_body").remove();
            $(".paging").remove();
            
			 var user=$("#user").text();
			 var page=$("#page").text();
			 var pagesize=$("#pagesize").text();
			 var blurry=$("#blurry").text();
			 var order=$("#order").text();
			 var state=$("#state").text();
			 var inorout=$("#inorout").text();
			 $.post('account_buy_servlet',{flag:"search",user:user,
				 page:page,
				 pagesize:pagesize,
				 blurry:blurry,
				 order:order,
				 state:state,
				 inorout:inorout},function(pd,state){
					 var jsonpd = JSON.parse(pd);
				
				 if(jsonpd.totalPage!=0){
					 
				$.each(jsonpd.data,function(index,PERSONGOODS_IN){
					persongood_in_body(PERSONGOODS_IN);
				
				
				})
				/* 分页加载  */
				var pagee=jsonpd.page;
				var paget=jsonpd.totalPage;	
				$("#pagetotal").text(paget);
				paging(pagee,paget)
				 }if(jsonpd.totalPage==0){
					 
					var p="<strong align='center' ><img src='images/nocomment.jpg' ></strong>"
					 var pobj=$(p);
					 var ajax=$(".personalajax")
					
					
					pobj.appendTo(ajax);
				 }
				
				 }) 
		})
		
		/* 分页 按钮  */
		$(document).on('click','.pagenow',function(){
			var pagenow=$(this).text();
			$("#page").text(pagenow);
			
		    $(".persongood_in_body").remove();
            $(".paging").remove();			
			
			 var user=$("#user").text();
			 var page=$("#page").text();
			 var pagesize=$("#pagesize").text();
			 var blurry=$("#blurry").text();
			 var order=$("#order").text();
			 var state=$("#state").text();
			 var inorout=$("#inorout").text();
			 $.post('account_buy_servlet',{flag:"search",user:user,
				 page:page,
				 pagesize:pagesize,
				 blurry:blurry,
				 order:order,
				 state:state,
				 inorout:inorout},function(pd,state){
					 var jsonpd = JSON.parse(pd);
					$.each(jsonpd.data,function(index,PERSONGOODS_IN){
						persongood_in_body(PERSONGOODS_IN);
					})
					/* 分页加载  */
				var pagee=jsonpd.page;
				var paget=jsonpd.totalPage;
				paging(pagee,paget)
				
				 }) 
		})
		/* 扇一页下一页  */
		$(document).on('click','.1',function(){
			var pagenow=$(this).text();
			
			var pageold=$("#page").text();
			var x = parseInt(pageold);
			var t=$("#pagetotal").text();

	 	 if(pagenow=='上一页'){
			 if(x>=2){
				x=x-1;
			 }else{
				 alert("当前页不是是0 ！")
			 }
			}if(pagenow=='下一页'){
				if(x<=t-1){
				x=x+1;
				}else{
					 alert("超过总页数 ！")
				 }
			} 
			$("#page").text(x);
			
		    $(".persongood_in_body").remove();
            $(".paging").remove();			
			
			 var user=$("#user").text();
			 var page=$("#page").text();
			 var pagesize=$("#pagesize").text();
			 var blurry=$("#blurry").text();
			 var order=$("#order").text();
			 var state=$("#state").text();
			 var inorout=$("#inorout").text();
			 $.post('account_buy_servlet',{flag:"search",user:user,
				 page:page,
				 pagesize:pagesize,
				 blurry:blurry,
				 order:order,
				 state:state,
				 inorout:inorout},function(pd,state){
					 var jsonpd = JSON.parse(pd);

					$.each(jsonpd.data,function(index,PERSONGOODS_IN){
						persongood_in_body(PERSONGOODS_IN);
					})
					/* 分页加载  */
				var pagee=jsonpd.page;
				var paget=jsonpd.totalPage;
				paging(pagee,paget)
				
				 }) 
			
		
		})
		
		$(document).on('click','.affirm',function(){
			var orderid=$(this).parents("tr").find("td").eq(1).text();
			 var me=$("#user").text();
			 var gdname=$(this).parents("tr").find("td").eq(6).text();
			 var he=$(this).parents("tr").find("td").eq(11).text();
			 $.post('account_buy_servlet',{flag:"affirm",
				 orderid:orderid,
				 me:me,
				 gdname:gdname,
				 he:he},function(pd,state){
					 var b = JSON.parse(pd);
					 if(b){
						 alert("操作成功"); 
					 }else{
						 alert("系统问题，请稍后重试");
					 }
			 })
			  /* 页面刷新 */
						 $(".personalajax").children().remove();				 				 
						 persongood_in_header();
						 var inorout=$("#inorout").text();
						 var user=$("#user").text();
						 var page=$("#page").text();
						 var pagesize=$("#pagesize").text();
						 var blurry=$("#blurry").text();
						 var order=$("#order").text();
						 var state=$("#state").text();
						 $("#state").text(state);
						 $.post('account_buy_servlet',{flag:"search",user:user,
							 page:page,
							 pagesize:pagesize,
							 blurry:blurry,
							 order:order,
							 state:state,
							 inorout:inorout},function(pd,state){
								  var jsonpd = JSON.parse(pd);
				
				 if(jsonpd.totalPage!=0){
					 
				$.each(jsonpd.data,function(index,PERSONGOODS_IN){
					persongood_in_body(PERSONGOODS_IN);
				
				
				})
				/* 分页加载  */
				var pagee=jsonpd.page;
				var paget=jsonpd.totalPage;	
				$("#pagetotal").text(paget);
				paging(pagee,paget)
				 }if(jsonpd.totalPage==0){
					
					var p="<strong align='center' ><img src='images/nocomment.jpg' ></strong>"
					 var pobj=$(p);
					 var ajax=$(".personalajax")
					
					
					pobj.appendTo(ajax);
				 }
								
								
							 })
		})
	
		
	 
function ascdesc(orderd){
		 if(orderd=='asc'){
				$("#order").text('desc');
			}else{
				$("#order").text('asc');
			} 
}		
		
function persongood_in_header(){
		
		 var search="<div class='form-inline'><strong class='form-group'>搜索：</strong> <input type='text' class='form-control form-group' id='search' placeholder='请输入关键字 自动检索 '></div>";
		 var selectpagesize="<input type='text' list='browsers' name='browser' value='5' id='waitpagesize' form-control style='width:50px;'><datalist id='browsers' ><option value='1'><option value='5'><option value='10'><option value='15'></datalist>";
		 
		 var pagesize="<div class='form-inline'><strong class='form-group'>每页显示 </strong>"+selectpagesize+"<strong class='form-group'>条 记录 </strong></div>";
		 var inorout=$("#inorout").text();
		 var state=$("#state").text();
		 
		 if(inorout=="in"){
		 if(state=="已发货" || state=="待评价"){
			 var th="<table id='example' class='table table-striped table-bordered'><thead><tr><th><input type='checkbox' id='checkall'></th><th>订单编号 </th><th>用户 </th><th>收货地址 </th><th>联系电话 </th><th>类型 </th><th>商品名</th><th>商品状态 </th><th>数量 </th><th>总价  </th><th id='buydate'>购买日期 <img id='updown' src='imgbutton/up.jpg'/></th><th>卖家用户名</th><th></th></tr></thead></table>"
		 }else{
			 var th="<table id='example' class='table table-striped table-bordered'><thead><tr><th><input type='checkbox' id='checkall'></th><th>订单编号 </th><th>用户 </th><th>收货地址 </th><th>联系电话 </th><th>类型 </th><th>商品名</th><th>商品状态 </th><th>数量 </th><th>总价  </th><th id='buydate'>购买日期 <img id='updown' src='imgbutton/up.jpg'/></th><th>卖家用户名</th><th></th></tr></thead></table>"
				 	 
		 }
		 }else if(inorout=="out"){
				 if(state=="已发货" || state=="待评价"){
					 var th="<table id='example' class='table table-striped table-bordered'><thead><tr><th><input type='checkbox' id='checkall'></th><th>订单编号 </th><th>用户 </th><th>收货地址 </th><th>联系电话 </th><th>类型 </th><th>商品名</th><th>商品状态 </th><th>数量 </th><th>总价  </th><th id='buydate'>出售日期 <img id='updown' src='imgbutton/up.jpg'/></th><th>买家用户名 </th><th></th></tr></thead></table>"
							}else{
								 var th="<table id='example' class='table table-striped table-bordered'><thead><tr><th><input type='checkbox' id='checkall'></th><th>订单编号 </th><th>用户 </th><th>收货地址 </th><th>联系电话 </th><th>类型 </th><th>商品名</th><th>商品状态 </th><th>数量 </th><th>总价  </th><th id='buydate'>出售日期 <img id='updown' src='imgbutton/up.jpg'/></th><th>买家用户名 </th><th></th></tr></thead></table>"
										}	  
		 }
		 var ajax=$(".personalajax")
		 var thobj=$(th);
		 var searchobj=$(search);

		 var pagesizeobj=$(pagesize);
		
		 		 
		 searchobj.appendTo(ajax);
		 pagesizeobj.appendTo(ajax);
		 thobj.appendTo(ajax);

		 
	 }
	 
function persongood_in_body(PERSONGOODS_IN){
	
	var td1="<td><input type='checkbox' id='checkone'></td>";
	var td2="<td id='orderid'>"+PERSONGOODS_IN.ORDERID+"</td>";
	var td3="<td id='username'>"+PERSONGOODS_IN.GPNAME+"</td>";
	var td4="<td>"+PERSONGOODS_IN.GPPOSITOIN+"</td>";
	var td5="<td>"+PERSONGOODS_IN.GPPHONE+"</td>";
	var td6="<td>"+PERSONGOODS_IN.TYPEMESNAME+"</td>";
	var td7="<td id='gdname'>"+PERSONGOODS_IN.GOODTITLE+"</td>";
	var td8="<td>"+PERSONGOODS_IN.ORDERSTATE+"</td>";
	var td9="<td>"+PERSONGOODS_IN.BUYCOUNT+"</td>";
	var count=parseInt(PERSONGOODS_IN.BUYCOUNT);
	var price=parseFloat(PERSONGOODS_IN.GOODPRICE);
	
	var td10="<td>"+count*price+"</td>";
	var td11="<td>"+PERSONGOODS_IN.ORDERDATE.substring(0, 19)+"</td>";
	var inorout=$("#inorout").text();
	 if(inorout=="in"){
	var td12="<td id='hename'>"+PERSONGOODS_IN.SENDPOSITION+"</td>";}
	 else if(inorout=="out"){
		 var td12="<td id='hename'>"+PERSONGOODS_IN.USERID+"</td>";} 
	 
	var state=$("#state").text();
	var td13="<td></td>";	
	if(state=='待评价'){
	td13="<td><button class='btn btn-info evaluate'><a id='modal-129482' href='#modal-container-129482' role='button' class='btn' data-toggle='modal'>去评价</a></button></td>";
	}else if(state=='已发货'){
		if(inorout=="in"){
		td13="<td><input type='button' class='btn btn-info affirm' value='确认收货'/></td>";
		}
		}else if(state=='待发货'){
			if(inorout=="out"){
				td13="<td><input type='button' class='btn btn-info realsend' value='发货'/></td>";
				}else if(inorout=="in"){
				td13="<td></td>";
				}
		}
	var tr="<tr class='persongood_in_body'>"+td1+td2+td3+td4+td5+td6+td7+td8+td9+td10+td11+td12+td13+"</tr>";
	
 var tableajax=$("#example");
	 var trobj=$(tr);
	
	trobj.appendTo(tableajax);


	}

function paging(pagee,pagetotal){
	/*假的分页    */
	
	 
	 var divpage="<div class='col-md-12 column paging'><ul class='pagination page' style='position: absolute; left: 55%;'></ul></div>";
	 var total=0;
	 if(pagetotal==0){
		 total=1;
	 }else{
			 total=pagetotal;
	 }
	 
	 var ajax=$(".personalajax");
	 var pageobj=$(divpage);
	 pageobj.appendTo(ajax);
     var ul=$(".page");
	 var up="<li><a class='1' >上一页</a></li>";
	 var upobj=$(up);
	 upobj.appendTo(ul);
	 
	  for(var i=1;i<=total;i++){
		
			if(pagee==i){ 		
				var page="<li class='active'><a class='pagenow' >"+i+"</a></li>"
				var pageli=$(page);
				var ul=$(".page");
				pageli.appendTo(ul);
			}else{
				var page="<li ><a class='pagenow' >"+i+"</a></li>"
				var pageli=$(page);
				var ul=$(".page");
				pageli.appendTo(ul);
			}
		}
	 var down="<li><a class='1' >下一页</a></li>";
	 var downobj=$(down);
	 downobj.appendTo(ul); 
	 
}
/* 这一块全是待发货的功能  */


/* 发货功能 */
 $(document).on('click','.realsend',function(){
	 var orderid=$(this).parents("tr").find("td").eq(1).text();
	 var me=$("#user").text();
	 var gdname=$(this).parents("tr").find("td").eq(6).text();
	 var he=$(this).parents("tr").find("td").eq(11).text();

	 $.post('account_buy_servlet',{flag:"realsend",
		 orderid:orderid,
		 me:me,
		 gdname:gdname,
		 he:he},function(pd,state){
			 var b = JSON.parse(pd);
			 if(b){
				 /* 页面刷新 */
				
					 alert("操作成功");
					 
			 }else{
				 alert("系统问题，请稍后重试");
			 }
			 $(".personalajax").children().remove();				 				 
			 persongood_in_header();
			 var inorout=$("#inorout").text();
			 var user=$("#user").text();
			 var page=$("#page").text();
			 var pagesize=$("#pagesize").text();
			 var blurry=$("#blurry").text();
			 var order=$("#order").text();
			 var state=$("#state").text();
			 $("#state").text(state);
			 $.post('account_buy_servlet',{flag:"search",user:user,
				 page:page,
				 pagesize:pagesize,
				 blurry:blurry,
				 order:order,
				 state:state,
				 inorout:inorout},function(pd,state){
					  var jsonpd = JSON.parse(pd);
				
				 if(jsonpd.totalPage!=0){
					 
				$.each(jsonpd.data,function(index,PERSONGOODS_IN){
					persongood_in_body(PERSONGOODS_IN);
				
				
				})
				/* 分页加载  */
				var pagee=jsonpd.page;
				var paget=jsonpd.totalPage;	
				$("#pagetotal").text(paget);
				paging(pagee,paget)
				 }if(jsonpd.totalPage==0){
					
					var p="<strong align='center' ><img src='images/nocomment.jpg' ></strong>"
					 var pobj=$(p);
					 var ajax=$(".personalajax")
					
					
					pobj.appendTo(ajax);
				 }
				 })
	 })
 })
 /*确认收货  */
 


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
});
})(jQuery);	
</script>

<script type="text/javascript">

	jQuery("#jquery-accordion-menu").jqueryAccordionMenu();
	
</script>
<!--  评价的弹窗 -->
		<div class="modal fade modal11" id="modal-container-129482" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						
						
							<div class="modal-body form-inline">
								<strong class="form-group" >用户名</strong>
								<input type="text"  readonly="readonly" class="form-control form-group" id="usernamedata" value="" />
							</div>
							<div class="modal-body form-inline">
								<strong class="form-group">商家名</strong>
								<input type="text"  readonly="readonly" class="form-control form-group" id="sendiddata" value="" />
							</div>
						
							<div class="modal-body form-inline">
								<strong class="form-group" >评分</strong>
								<select name="" class="form-group" id="scoredata">
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
								</select>
							</div>
							<div class="modal-body form-inline">
								<strong class="form-group">内容</strong>
								<textarea name="" rows="3" cols="60" class="form-group" id="textdata"></textarea>
							</div>
						<div class="modal-footer" align="center">
							 <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button> <button type="button" class="btn btn-primary subdata" data-dismiss="modal">提交</button>
						</div>
					</div>
					
				</div>
				
			</div>
				
			</div>

</body>
<script type="text/javascript">
(function(){
	 $(".personalajax").children().remove(); 
		 $("#blurry").text("");
		 persongood_in_header(); 
		 $("#page").text(1);
		 $("#pagesize").text(5);
		 var order=$("#order").text();
		 var inorout=$("#inorout").text();
		 var user=$("#user").text();
		 var page=$("#page").text();
		 var pagesize=$("#pagesize").text();
		 var blurry=$("#blurry").text();
		 var state=$("#state").text();	 
		 $.post('account_buy_servlet',{flag:"search",
			 user:user,
			 page:page,
			 pagesize:pagesize,
			 blurry:blurry,
			 order:order,
			 state:state,
			 inorout:inorout},function(pd,state){
				 var jsonpd = JSON.parse(pd);
				
				 if(jsonpd.totalPage!=0){
					 
				$.each(jsonpd.data,function(index,PERSONGOODS_IN){
					persongood_in_body(PERSONGOODS_IN);
				
				
				})
				/* 分页加载  */
				var pagee=jsonpd.page;
				var paget=jsonpd.totalPage;	
				$("#pagetotal").text(paget);
				paging(pagee,paget)
				 }if(jsonpd.totalPage==0){
					 
					var p="<strong align='center' ><img src='images/nocomment.jpg' ></strong>"
					 var pobj=$(p);
					 var ajax=$(".personalajax")
					
					
					pobj.appendTo(ajax);
				 }
	
			 }) 
 })();
</script>
</html>