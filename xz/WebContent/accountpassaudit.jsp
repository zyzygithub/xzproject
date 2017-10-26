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
input[type=button]{
	border: solid #017EBC;
	border-radius: 5px;
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
<p hidden="hidden" id="user">${sessionScope.user1}</p>
<p hidden="hidden" id="page">${requestScope.pd.page}</p>
<p hidden="hidden" id="pagetotal">${requestScope.pd.totalPage}</p>
<p hidden="hidden" id="pagesize">3</p>
<p hidden="hidden" id="blurry"></p>
<p hidden="hidden" id="order">asc</p>
<p hidden="hidden" id="state"></p>
<p hidden="hidden" id="upanddown">up</p>
<!--更改的ajax块-->
<div class="col-md-9 personalajax"  >
<div class=”form-inline“>
<input type="text" class="form-control form-group" id="search" placeholder="请输入关键字 自动检索 " style="width:200px;"><!-- <strong class="form-group">搜索：</strong> --> 
</div>
		 <div class="form-inline">
		 	<strong class="form-group" >每页显示 </strong>
		 	 <select name="" id="waitpagesize">
		 	 <option value="3">默认</option>
		 	 	<option value="1">1</option>
		 	 	<option value="2">2</option>
		 	 	<option value="3">3</option>
		 	 	<option value="4">4</option>
		 	 </select>
		 	<strong class="form-group">条 记录 </strong>
		 </div>
		 <table id="tablegood" class="table" style="width:100%" >
							<thead>
								<tr>
									<th>
										<input type="checkbox" name="" id="checkall" value="choseall" />全选
									</th>
									<th></th><th></th><th></th><th></th>
         							<th style="width:200px;">
										
										<button class='downgoods alert-info' style="width:70px;height:40px;"><a>下架</a></button>
										<button class=' alert-info' style="width:70px;height:40px;"><a id='modal-129482' href='#modal-container-12948299' role='button' class='btn' data-toggle='modal'>修改</a></button>
								</th>
								</tr><!--第一行-->
							</thead>	
							<tbody class="tbody">
							<t:if test="${requestScope.pd!=null}">
							<t:forEach items="${requestScope.pd.data}" var="ggt" begin="0" end="${requestScope.pd.total}">
								 
								 <tr style="height:120px;width:70%;">
								 <td style="width:15%px;"><a class="goodid">${ggt.GOODID}</a></td>
									<td hidden="hidden">${ggt.GOODTITLE}</td>
								    <td  hidden="hidden">${ggt.GOODPRICE}</td>
										<td  hidden="hidden">${ggt.GOODREMARK}</td>
										<td  hidden="hidden">${ggt.GOODCOUNT}</td>
										<td  hidden="hidden">${ggt.GOODPRICE}</td>
									<td style="width:15%px;">
										<div id="" class="imgchangecss table-bordered" style="text-align:center;width:120px; height:90px;">
											<img id="" class="imgclick" src="${ggt.GOODPIC}" style="border-radius:2px;width:180px; height:134px;margin:2px auto; border: solid #017EBC" />
											<input type='checkbox' id='checkone'>
										</div>
										
									</td>
										<td style="width:5%px;"><a hidden="hidden" class="goodid"></a></td>
									<td style="width:45%px;">
										商品名:<p id="gdname">${ggt.GOODTITLE}</p>
										商品类型:<p id="gdtype">${ggt.TYPEMESNAME}</p>
										<div class="goodcontent" >
											商品说明:<p id="goodsremark">${ggt.GOODREMARK}</p>
										</div>
									</td>
									
								</tr><!--第二行-->
								<tr >	
									<td>
										<strong>点击量:${ggt.GOODCLICK}</strong>
									</td>								
									<td>
										数量:<strong id="goodscount">${ggt.GOODCOUNT}</strong>
									</td>
									
									<td style="width:100px">
										价格:<strong id="goodsprice">${ggt.GOODPRICE}</strong>
									</td>								
									<td style="width:100px" >
										<strong>原价:${ggt.ORIGINALPRICE}</strong>
									</td>
										<td>
										<strong>上架时间:${ggt.GOODUP}</strong>
									</td>								
									<td>
									</td>
								</tr>
								 	<tr ><td></td><td></td><td style="width:100px"></td><td style="width:100px" ><strong></strong></td><td><strong></strong></td><td><strong id="downdate"></strong></td></tr>
								 
									 
									</t:forEach>
									
								</t:if>	
							
							</tbody>
						</table>
		  <t:if test="${requestScope.pd.totalPage==0}">
								<tr><strong>空空如也哦</strong></tr>
								</t:if>

<div class='col-md-12 column paging'>
<t:if test="${requestScope.pd.totalPage!=0}">
<ul class='pagination page' style='position: absolute; left: 55%;'>

<li><a class='1'>上一页</a></li>

 <t:forEach var="i" begin="1" end="${requestScope.pd.totalPage}">
 <t:if test="${requestScope.pd.page==i}">
<li class="active"><a class="pagenow">${i}</a></li>
</t:if>
 <t:if test="${requestScope.pd.page!=i}">
<li><a class="pagenow">${i}</a></li>
</t:if>


</t:forEach> 

<li><a class='1' >下一页</a></li>
</ul>
</t:if>
</div>
	


</div>


</div>
	
	
</div>
	</div>
	<!--尾巴-->
	<div class="footer col-md-12" style="position: absolute; top: 215%;">
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
	 
/* ajax区域  */ 
 
/* 这一块全是待发货的功能  */

	 
	 /* 搜索 页面 改变  */
	 $(document).on('change','#search',function(){
			var text=$("#search").val();
			// $(".tablegood").children.remove();
			 $(".paging").remove();
			 $(".tbody").remove();
			 
			 
			 $("#page").text(1);
			 $("#blurry").text(text);
			 
			 var user=$("#user").text();
			 var page=$("#page").text();
			 var pagesize=$("#pagesize").text();
			 var blurry=$("#blurry").text();
			 
			 var order=$("#order").text();
			
			 var upanddown=$("#upanddown").text();
			 $.post('account_goods_goodstype_sevrlet',{flag:"search",user:user,
				 page:page,
				 pagesize:pagesize,
				 blurry:blurry,
				 order:order,
				 upanddown:upanddown},function(pd,state){
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
						 
						var p="<strong>空空如也哦</strong>"
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
			 $(".paging").remove();
			 $(".tbody").remove();
			 
			 $("#pagesize").text(waitpagesize);
			 
			 var user=$("#user").text();
			 var page=$("#page").text();
			 var pagesize=$("#pagesize").text();
			
			 var blurry=$("#blurry").text();
			
			 var order=$("#order").text();
			// var state=$("#state").text();
			 var upanddown=$("#upanddown").text();
			 $.post('account_goods_goodstype_sevrlet',{flag:"search",user:user,
				 page:page,
				 pagesize:pagesize,
				 blurry:blurry,
				 order:order,
				 upanddown:upanddown},function(pd,state){
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
						 
						var p="<strong>空空如也哦</strong>"
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
		
			/* 修改 按钮数据读取  */
	$(document).on('click','#modal-129482',function(){
		var name=$("#gdname").text();
		var btn=$(".subdata").attr("disabled");
		if(btn!=null){
		$(".subdata").removeAttr("disabled");
		}
		var num=0;
		$("input[id='checkone']").each(function(){
			if(this.checked)	
			{
				num=num+1;
			}
		})
		if(num>1 || num==0){
			alert("请不要多选 ！或者不选 ")
			$(".subdata").attr({"disabled":"disabled"})
			          $("#gdid").val(id);
					  $("#gooname").val("");
					  $("#count").val("");
					  $("#price").val("");
					 // $("#downdate").val($("#downdate").text());
					  $("#text").val("")
		}else{
		$("input[id='checkone']").each(function(){
				
				if(this.checked)	
				{
					  var id=$(this).parents("tr").find("td").eq(0).text();
					  var name=$(this).parents("tr").find("td").eq(1).text();
					  var count=$(this).parents("tr").find("td").eq(3).text();
					  var price=$(this).parents("tr").find("td").eq(5).text();
					  var remark=$(this).parents("tr").find("td").eq(2).text();
					  alert(name+","+count+","+price+","+remark);
					  //alert(id);
					  $("#gdid").val(id);
					  $("#gooname").val(name);
					  $("#count").val(count);
					  $("#price").val(price);
					 // $("#downdate").val($("#downdate").text());
					  $("#text").val(remark);
					 /*  
					  */
					
				}
			})
		}
	}) 
	/* 提交修改信息  */
	
	$(document).on('click','.subdata',function(){
		var id= $("#gdid").val();
		var name=$("#gooname").val();
		 var price=$("#price").val();
		 var count=$("#count").val();
		
		 var text=$("#text").val(); 

		 
		 if(name=="" || price=="" || count==""  || text==""){
			 alert("关键 字不能放空 ");
		 }else{
			
			 $.post('account_goods_goodstype_sevrlet',{flag:"update",
				 id:id,
				 name:name,
				 price:price,
				 count:count,
				
				 text:text
			 },function(yon,state){
				 
				 var jsonpd = JSON.parse(yon);
				 if(yon){
				 alert("修改成功");
				 $(".paging").remove();
				 $(".tbody").remove();		
				
				 var user=$("#user").text();
				 var page=$("#page").text();
				 
				 var pagesize=$("#pagesize").text();
				 var blurry=$("#blurry").text();
				 var order=$("#order").text();

				 var upanddown=$("#upanddown").text();
				 $.post('account_goods_goodstype_sevrlet',{flag:"search",user:user,
					 page:page,
					 pagesize:pagesize,
					 blurry:blurry,
					 order:order,
					 upanddown:upanddown},function(pd,state){
						 var jsonpd = JSON.parse(pd);				
						$.each(jsonpd.data,function(index,GOODS_GOODSTYPE){
						persongood_in_body(GOODS_GOODSTYPE);
						})	
						/* 分页加载  */
					var pagee=jsonpd.page;
					var paget=jsonpd.totalPage;	
					paging(pagee,paget)
					 })
				 }else{
					alert("修改失败，请联系管理员 ！") 
				 }
			 })
		 }
	})
	$(document).on('change','#count',function(){

		 var count=$("#count").val();
		if(count<=0){
			
			$("#count").val("数量不能为小于0 ");
			$(".subdata").attr({"disabled":"disabled"});
		}
		 
	})
	$(document).on('change','#price',function(){

		 var price=$("#price").val();
		if(price<=0){
		$("#price").val("价格不能小于0 ");
		$(".subdata").attr({"disabled":"disabled"});
		}
		 
	})
		/* 下架商品  */
		$(document).on('click',".downgoods",function(){
			var yes_no= confirm("是否下架");
			if(yes_no){
				/* 先去删除  */
				$("input[id='checkone']").each(function(){
					if(this.checked)
					{
						/*  获取被选中的id */
					    var id=$(this).parents("tr").find("td").eq(0).text();
						
						 $.post('account_goods_goodstype_sevrlet',{flag:"downgoods",
							 goodid:id
							 },function(pd,state){
							 alert("更改成功 ");
							 })
					}				
				})
				/* 重新刷新  */
			 $(".paging").remove();
			 $(".tbody").remove();		
			
			 var user=$("#user").text();
			 var page=$("#page").text();
			 
			 var pagesize=$("#pagesize").text();
			 var blurry=$("#blurry").text();
			 var order=$("#order").text();

			 var upanddown=$("#upanddown").text();
			 $.post('account_goods_goodstype_sevrlet',{flag:"search",user:user,
				 page:page,
				 pagesize:pagesize,
				 blurry:blurry,
				 order:order,
				 upanddown:upanddown},function(pd,state){
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
						 
						var p="<strong>空空如也哦</strong>"
						 var pobj=$(p);
						 var ajax=$(".personalajax")
						
						
						pobj.appendTo(ajax);
					 }
				 })
				
			}
	
		})
		/* 分页 按钮  */
		$(document).on('click','.pagenow',function(){
			var pagenow=$(this).text();
	
			$("#page").text(pagenow);
			
			 $(".paging").remove();
			 $(".tbody").remove();		
			
			 var user=$("#user").text();
			 var page=$("#page").text();
			 
			 var pagesize=$("#pagesize").text();
			 var blurry=$("#blurry").text();
			 var order=$("#order").text();

			 var upanddown=$("#upanddown").text();
			 $.post('account_goods_goodstype_sevrlet',{flag:"search",user:user,
				 page:page,
				 pagesize:pagesize,
				 blurry:blurry,
				 order:order,
				 upanddown:upanddown},function(pd,state){
					 var jsonpd = JSON.parse(pd);
					
					$.each(jsonpd.data,function(index,GOODS_GOODSTYPE){
						
					persongood_in_body(GOODS_GOODSTYPE);
					})	
					/* 分页加载  */
				var pagee=jsonpd.page;
				var paget=jsonpd.totalPage;	
				paging(pagee,paget)
				 })
		})
		/* 上一页下一页  */
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
			 $(".paging").remove();
			 $(".tbody").remove();		
			 var user=$("#user").text();
			 var page=$("#page").text();
			 var pagesize=$("#pagesize").text();
			 var blurry=$("#blurry").text();
			 var order=$("#order").text();
			 var upanddown=$("#upanddown").text();
			 $.post('account_goods_goodstype_sevrlet',{flag:"search",user:user,
				 page:page,
				 pagesize:pagesize,
				 blurry:blurry,
				 order:order,
				 upanddown:upanddown},function(pd,state){
					 var jsonpd = JSON.parse(pd);
					
					$.each(jsonpd.data,function(index,GOODS_GOODSTYPE){
						
					persongood_in_body(GOODS_GOODSTYPE);
					})
					
					/* 分页加载  */
				var pagee=jsonpd.page;
				var paget=jsonpd.totalPage;	
				
				paging(pagee,paget)
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
		 var deleteo="<input type='button' class='btn btn-warning' value='删除'/>";
		 var pagesize="<div class='form-inline'><strong class='form-group'>每页显示 </strong>"+selectpagesize+"<strong class='form-group'>条 记录 </strong></div>";
		 var inorout=$("#inorout").text();
		 
		 if(inorout=="in"){
		 var th="<table id='example' class='table table-striped table-bordered'><thead><tr><th><input type='checkbox' id='checkall'></th><th>订单标号 </th><th>用户 </th><th>收货地址 </th><th>联系电话 </th><th>类型 </th><th>商品名</th><th>商品状态 </th><th>数量 </th><th>总价  </th><th id='buydate'>购买日期 <img id='updown' src='imgbutton/up.jpg'/></th><th>卖家编号 </th><th>详细 </th></tr></thead></table>"
		 }else if(inorout=="out"){
			 var th="<table id='example' class='table table-striped table-bordered'><thead><tr><th><input type='checkbox' id='checkall'></th><th>订单标号 </th><th>用户 </th><th>收货地址 </th><th>联系电话 </th><th>类型 </th><th>商品名</th><th>商品状态 </th><th>数量 </th><th>总价  </th><th id='buydate'>出售日期 <img id='updown' src='imgbutton/up.jpg'/></th><th>买家编号 </th><th>详细 </th></tr></thead></table>"
				  
		 }
		 var ajax=$(".personalajax")
		 var thobj=$(th);
		 var searchobj=$(search);
		 var deleteobj=$(deleteo);
		 var pagesizeobj=$(pagesize);
		
		 		 
		 searchobj.appendTo(ajax);
		 pagesizeobj.appendTo(ajax);
		 deleteobj.appendTo(ajax);
		 thobj.appendTo(ajax);

		 
	 }
	 
function persongood_in_body(GOODS_GOODSTYPE){
	
	   var  td10="<td style='width:5%px;'><a class='goodid'>"+GOODS_GOODSTYPE.GOODID+"</a></td><td hidden='hidden'>"+GOODS_GOODSTYPE.GOODTITLE+"</td><td  hidden='hidden'>"+GOODS_GOODSTYPE.GOODREMARK+"</td><td  hidden='hidden'>"+GOODS_GOODSTYPE.GOODCOUNT+"</td><td  hidden='hidden'>"+GOODS_GOODSTYPE.GOODREMARK+"</td><td  hidden='hidden'>"+GOODS_GOODSTYPE.GOODPRICE+"</td>";
	 var	td11="<td style='width:15%px;'><div id='' class='imgchangecss table-bordered' style='text-align:center;width:120px; height:90px;'><img id='' class='imgclick' src='"+GOODS_GOODSTYPE.GOODPIC+"' style='border-radius:2px;width:180px; height:134px;margin:2px auto; border: solid #017EBC' /><input type='checkbox' id='checkone'></div></td>"
	var	td12="<td style='width:45%px;'>商品名:<p id='gdname'>"+GOODS_GOODSTYPE.GOODTITLE+"</p><a hidden='hidden' >"+GOODS_GOODSTYPE.GOODID+"</a><div class='goodcontent' >商品说明:<p id='goodsremark'>"+GOODS_GOODSTYPE.GOODREMARK+"</p></div></td>"	
			
		var tr1="<tr >"+td10+td11+"<td style='width:5%px;'><a ></a></td>"+td12+"</tr>"	
		
		 var td21="<td><strong>点击量:"+GOODS_GOODSTYPE.GOODCLICK+"</strong></td><td>数量:<strong id='goodscount'>"+GOODS_GOODSTYPE.GOODCOUNT+"</strong></td>"
		var td22="<td style='width:100px'>价格 :<strong id='goodsprice'>"+GOODS_GOODSTYPE.GOODPRICE+"</strong></td><td style='width:100px'><strong>原价 :"+GOODS_GOODSTYPE.ORIGINALPRICE+"</strong></td>"
		var td23="<td><strong>上架时间 :"+GOODS_GOODSTYPE.GOODUP+"</strong></td><td></td>"
		var tr2="<tr >"+td21+td22+td23+"</tr>"
		
		
		
		var tbody="<tbody class='tbody'>"+tr1+tr2+"<tr ><td></td><td></td><td style='width:100px'></td><td style='width:100px' ><strong></strong></td><td><strong></strong></td><td><strong id='downdate'></strong></td></tr></tbody>";
		var tbodyobj=$(tbody); 
		 
		
		var table=$("#tablegood");

		tbodyobj.appendTo(table);  
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
		<div class="modal fade modal11" id="modal-container-12948299" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						
						<input type="text" hidden="hidden"  class="form-control form-group" id="gdid" value="" />
							<div class="modal-body form-inline">
								<strong class="form-group" >商品名</strong>
								<input type="text"   class="form-control form-group" id="gooname" value="" />
							</div>
							<div class="modal-body form-inline">
								<strong class="form-group">商品价格</strong>
								<input type="text"   class="form-control form-group" id="price" value="" />
							</div>
							<div class="modal-body form-inline">
								<strong class="form-group">数量</strong>
								<input type="text" class="form-control form-group" id="count" value="" />
							</div>

							<div class="modal-body form-inline">
								<strong class="form-group">说明</strong>
								<textarea name="" rows="3" cols="60" class="form-group" id="text"></textarea>
							</div>
						<div class="modal-footer" align="center">
							 <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button> <button type="button" class="btn btn-primary subdata" data-dismiss="modal">提交</button>
						</div>
					</div>		
				</div>	
			</div>	
			</div>
</body>
</html>