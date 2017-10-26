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




 <!--  http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css-->
    <link rel="stylesheet" type="text/css" href="plugin/datatables/bootstrap.min.css"/>
    <!--<link rel="stylesheet" href="http://cdn.datatables.net/1.10.6/css/jquery.dataTables.min.css"/>-->
    <!--http://cdn.datatables.net/plug-ins/28e7751dbec/integration/bootstrap/3/dataTables.bootstrap.css-->
    <link rel="stylesheet" type="text/css" href="plugin/datatables/dataTables.bootstrap.css  "/>
    <!--http://cdn.gbtags.com/datatables/1.10.5/js/jquery.js-->
    <script src="plugin/datatables/jquery.js"></script>
    <!--http://cdn.gbtags.com/datatables/1.10.5/js/jquery.dataTables.min.js-->
    <script src="plugin/datatables/jquery.dataTables.min.js"></script>
    <!--<script src="dt.js"></script>-->
    <!--http://cdn.datatables.net/plug-ins/28e7751dbec/integration/bootstrap/3/dataTables.bootstrap.js-->
    <script type="text/javascript" language="javascript" src="plugin/datatables/dataTables.bootstrap.js"></script>
    <!--http://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js-->
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
					 <!--  <form>
						<input type="submit" value="">
						
						 <input type="text" value="Search for a product, category or brand" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search for a product, category or brand';}"/>
					  </form> -->
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
		<div class="login-page" style="position: absolute; left: 5%;top: 30%;">
			
			<div class="content">

	<div id="jquery-accordion-menu" class="jquery-accordion-menu ">
		
		<ul id="demo-list">
		 
		  <li class="active"><a href="account_message.jsp"><i class="fa fa-envelope"></i>消息中心 </a>
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
			
			
			<li><a ><i class="fa fa-user"></i>个人中心</a>
				<ul class="submenu">
					<li><a href="mylike.jsp">我的收藏</a></li>
					<li><a href="account.jsp">我的评价</a></li>
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
<p id="user" hidden="hidden">${sessionScope.user1}</p>
<p hidden="hidden" id="page">${requestScope.pd.page}</p>
<p hidden="hidden" id="pagetotal">${requestScope.pd.totalPage}</p>
<p hidden="hidden" id="pagesize">3</p>
<p hidden="hidden" id="blurry"></p>
<p hidden="hidden" id="order">asc</p>
<p hidden="hidden" id="state"></p>
<p hidden="hidden" id="upanddown">up</p>


<!-- 从重新上架传过来的值 -->
<!-- http://localhost:8080/textfile/accountgoodsup.jsp?title=1111&type=%E6%89%8B%E6%9C%BA&price=111.0&count=2remark=sds -->

 <%
request.setCharacterEncoding("utf-8");
 String title="";
 String remark="";
 if(request.getParameter("title")!=null){
title=request.getParameter("title");
}
if(request.getParameter("remark")!=null){
remark=request.getParameter("remark");
}

%> 

<p hidden="hidden" id="sendgdname"><%=title%></p>



<p hidden="hidden" id="sendgdprice"></p>


<p hidden="hidden" id="sendgdcount"></p>



<p hidden="hidden" id="sendgdtype"></p>


<p hidden="hidden" id="sendgdremark"><%=remark%></p>



<!--更改的ajax块-->
<div class="col-md-9 personalajax"   >

<div >
<form action="Goodsup" method="post" enctype="multipart/form-data" style="position: absolute;left:25%;" class="form">

<t:if test="${requestScope.tof!=null}">
<t:if test="${requestScope.tof}">
<strong style="color:red;">已发送管理员审核！</strong>
</t:if>
<t:if test="${requestScope.tof==false}">
<strong style="color:red;">上架失败，请联系管理员！</strong>
</t:if>

</t:if>


<div style="width: 400px;" align="left">
		<div class="form-inline">
<strong class="form-group" > 请选择种类</strong>

		<select id="typebig" name="typebig" class="form-group">
			<option value="电子产品">--电子产品--</option>
			<option value="旧书籍">-旧书籍-</option>
			<option value="服饰鞋履">--服饰鞋履--</option>
			<option value="母婴">-母婴-</option>
			<option value="家具生活">--家具生活--</option>
			<option value="男生">-男生-</option>
			<option value="女生">-女生-</option>
		</select>
		<select id="typesmall" name="typesamll" class="form-group">

<option value="二手游戏">二手游戏</option>
<option value="手机">手机</option>
		</select>
		</div>
	<br />
	
<div class="form-inline">

		<strong class="form-group">商品名：</strong>
	    <input type="text" id="name" name="name" value="" class="form-control"  />
</div>

<br />
<div class="form-inline">
		<strong class="form-group">商品数量</strong>
	    <input type="text" id="count" name="count" value="" class="form-control"  />
</div>

<br />
<div class="form-inline">
		<strong class="form-group">商品单价</strong>
	    <input type="text" id="price" name="price" value="" class="form-control"  />
</div>
<br />
<div class="form-inline">
		<strong class="form-group">商品原价</strong>
	    <input type="text" id="oldprice" name="price" value="" class="form-control"  />
</div>
<br />
<div class="form-inline">
		<strong class="form-group">商品说明：</strong>
	    <textarea name="remark" id="remark" rows="4" cols="50" class="form-group form-control"></textarea>
</div>
	<br />
		

<input type="file" name="imgup" id="img" value="" />
<input type="text" hidden="hidden" id="username" readonly="readonly" name="username" value="" class="form-control" style="width:150px;" />
<input type="submit" class="btn btn-info" id="up" value="上架" disabled="disabled"/>
<p id="jm" style="color:red;">不能放空！</p>

</form>
</div>

</div>


</div>
	
	
</div>
	</div>
	<!--尾巴-->
	<div class="footer col-md-12" style="position: absolute; top: 190%;">
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
 /* 级联 */
 f1=0;
 f2=0;
 f3=0;
 f4=0;
 f5=0;
 f6=0;


 /* 预加载  */
 (function(){
   var title=$("#sendgdname").text();
   var type=$("#sendgdtype").text();
   var price=$("#sendgdprice").text();
   var count=$("#sendgdcount").text();
   var remark=$("#sendgdremark").text();
   //alert(title);
   if(title!=""){
	   $("#name").val(title);
   }if(type!=""){
	   $("#typesmall").val(type);
   }if(count!=""){
	   $("#count").val(count);
   }if(price!=""){
	   $("#price").val(price);
   }if(remark!=""){
	   $("#remark").val(remark);
   }
  // alert("ok");
   
 })();
 (function(){
	 var user=$("#user").text();
	 $("#username").val(user);
	 
	 var typesmall=$("#typesmall").val();
	 //alert(name+"name");
	 if(typesmall==""){
		 f5=0;
	 }else{
		f5=1;
	 }
	 var name=$("#name").val();
	 //alert(name+"name");
	 if(name==""){
		 f1=0;
	 }else{
		f1=1;
	 }

	 if(f1==1 && f2==1 && f3==1&& f4==1 && f5==1 && f6==1){
		 //alert(f1+""+f2+""+f3+""+f4+""+f5)
		 $("#up").removeAttr("disabled");
		 $("#jm").remove();
	 }else{ 
	//alert(f1+""+f2+""+f3+""+f4+""+f5)
		 $("#up").attr({"disabled":"disabled"})
		 }
 })();
 
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
 
 
 
 
 
 $(document).on('change','#name',function(){
	 var name=$("#name").val();
	 //alert(name+"name");
	 if(name==""){
		f1=0;
	 }else{
		f1=1;
	 }
	 
	 if(f1==1 && f2==1 && f3==1&& f4==1 && f5==1 && f6==1){
		// alert(f1+""+f2+""+f3+""+f4)
		 $("#up").removeAttr("disabled");
		
	 }else{ 
		 //alert(f1+""+f2+""+f3+""+f4)
		 $("#up").attr({"disabled":"disabled"})
		 }
	
	
 })
  $(document).on('change','#count',function(){
	 var count=$("#count").val();
	 //alert(name+"name");
	 if(count==""){
		 f2=0;
	 }else{
		 var r = /^\+?[1-9][0-9]*$/;
		 if ((r.test(count))){
			 f2=1;
		 }else{
			 alert("请输入正整数");
			 $("#count").val("");
		 }
		
	 }
	 

	
	 
	 
	 if(f1==1 && f2==1 && f3==1&& f4==1 && f5==1 && f6==1){
		 $("#up").removeAttr("disabled");
		 $("#jm").remove();
	 }else{ $("#up").attr({"disabled":"disabled"})
		 }
 })
 
 
  $(document).on('change','#price',function(){
	 var price=$("#price").val();
	 
	 //alert(name+"name");
	 if(price==""){
		f3=0;
	 }else{
		 var r = /^\+?[1-9][0-9]*$/;
		 if ((r.test(price))){
			 f3=1;
		 }else{
			 alert("本店不支持非法价格,必须是正整数");
			 $("#price").val("");
		 }
		 
		
		

	 }
	 
	 if(f1==1 && f2==1 && f3==1&& f4==1 && f5==1 && f6==1){
		 $("#up").removeAttr("disabled");
		 $("#jm").remove();
	 }else{ $("#up").attr({"disabled":"disabled"})
		 
		 }
 })
  $(document).on('change','#remark',function(){
	 var remark=$("#remark").val();
	 //alert(name+"name");
	 if(remark==""){
		 f4=0;
	 }else{
		f4=1;
	 }
	 
	 if(f1==1 && f2==1 && f3==1&& f4==1 && f5==1 && f6==1){
		// alert(f1+""+f2+""+f3+""+f4)
		 $("#up").removeAttr("disabled");
		 $("#jm").remove();
	 }else{ 
	// alert(f1+""+f2+""+f3+""+f4)
		 $("#up").attr({"disabled":"disabled"})
		 }
 })
 
   $(document).on('change','#typesmall',function(){
	 var typesmall=$("#typesmall").val();
	 //alert(name+"name");
	 if(typesmall==""){
		 f5=0;
	 }else{
		f5=1;
	 }
	 
	 if(f1==1 && f2==1 && f3==1 && f4==1 && f5==1 && f6==1){
		 //alert(f1+""+f2+""+f3+""+f4+""+f5)
		 $("#up").removeAttr("disabled");
		 $("#jm").remove();
	 }else{ 
	//alert(f1+""+f2+""+f3+""+f4+""+f5)
		 $("#up").attr({"disabled":"disabled"})
		 }
 })
    
 $(document).on('change','#img',function(){
	 var img=$("#img").val();
	 //alert(name+"name");
	 if(remark==""){
		 f6=0;
	 }else{
		f6=1;
	 }
	 
	 if(f1==1 && f2==1 && f3==1&& f4==1 && f5==1 && f6==1){
		 //alert(f1+""+f2+""+f3+""+f4+""+f5+""+f6)
		 $("#up").removeAttr("disabled");
		 $("#jm").remove();
	 }else{ 
	     //alert(f1+""+f2+""+f3+""+f4+""+f5+""+f6)
		 $("#up").attr({"disabled":"disabled"})
		 }
 })
 
 
var types = new Array("电子产品","旧书籍","服饰鞋履","母婴","家具生活","男生","女生");

types["电子产品"] = ["二手游戏", "手机"];
types["旧书籍"] = ["杂志", "漫画"];
types["服饰鞋履"] = ["上衣", "连衣裙","裤子"];
types["母婴"] = [ "婴儿玩具","新生儿服饰"];
types["家居生活"] = ["家具","生活用品"];
types["男生"] = ["护肤品"];
types["女生"] = ["化妆品"];

$(document).on('change','#typebig',function(){
	var big=$("#typebig").val();
	document.getElementById("typesmall").options.length = 0;
	for (var i = 0; i <types[big].length; i++) {
		//向city选项中增加新的option
		var ops = new Option(types[big][i], types[big][i]);
		document.getElementById("typesmall").options.add(ops);
	}

})




	
/* 这一块全是待发货的功能  */


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




</body>
</html>