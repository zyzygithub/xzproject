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
		 <!-- class="msg" -->
		   <li ><a ><i class="fa fa-envelope"></i>消息中心 </a>
		   	<ul class="submenu">
					<li><a id="read" class="msgbtn">已读</a></li>
					<li><a id="noread" class="msgbtn">未读</a></li>
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
							<li><a href="addBalance.jsp" id="addBalance"><i class="fa fa-money"></i>充值</a></li>
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
<p hidden="hidden" id="user"></p>
<p hidden="hidden" id="page">1</p>

<p hidden="hidden" id="pagesize"></p>
<p hidden="hidden" id="blurry"></p>
<p hidden="hidden" id="order">asc</p>
<p hidden="hidden" id="state"></p>
<p hidden="hidden" id="inorout"></p>
<!--更改的ajax块-->
<div class="col-md-9 personalajax"  >
</div>
</div>
</div>
	</div>
	<!--尾巴-->
	 <div class="footer col-md-12" style="position: absolute;top: 180%;">
		<div class="wrap">
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
	 
	 
	 
	 
/* ajax区域  */ 
 
/* 这一块全是待发货的功能  */


/* 点击购入后的所有按钮   */

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

				$.each(jsonpd.data,function(index,PERSONGOODS_IN){
					persongood_in_body(PERSONGOODS_IN);
				})
				
				/* 分页加载  */
				var pagee=jsonpd.page;
				var paget=jsonpd.TotalPage;				
				paging(pagee,paget)
			 })
	 })
	 /*点击消息的说有按钮*/
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

					$.each(jsonpd.data,function(index,PERSONGOODS_IN){
						persongood_in_body(PERSONGOODS_IN);
					})
					/* 分页加载  */
				var pagee=jsonpd.page;
				var paget=jsonpd.TotalPage;				
				paging(pagee,paget)
				 }) 
			
		})
			/* 全选按钮  */
		
		$(document).on('click','#checkall',function(){
			var big=this.checked;
			
			$("input[id='checkone']").each(function(){
	         $(this).prop('checked',big);
		
				})	
		})
		/* 个人消息全选按钮 */
		$(document).on('click','#allbox',function(){
			var big=this.checked;
			
			$("input[id='box']").each(function(){
	         $(this).prop('checked',big);
		
				})	
		})
		/*  评价按钮 */
		
		$(document).on('click','.evaluate',function(){
			var username=$("#username").text();
			var sendid=$("#sendid").text();
			
			$("#usernamedata").val(username);
			$("#sendiddata").val(sendid);
			
		
		})
		/*  评价提交 */
		
		$(document).on('click','.subdata',function(){
			var username=$("#usernamedata").val();
			var sendid=$("#sendiddata").val();
			var date=$("#datedata").val();
			var score=$("#scoredata").text();
			var text=$("#textdata").val();
		})
		/* 消息回复 */
		$(document).on('click','.btn-primary1',function(){
			
			var goodid=$(this).parent().parent().find("#goodid").text();
			var username=$(this).parent().parent().find("#username").text();
			var goodtitle=$(this).parent().parent().find("#goodtitle").text();
			var messagecontent=$(this).parent().parent().find("#messagecontent").text();
			var fromid=$(this).parent().parent().find("#fromid").text();
			var messageid=$(this).parent().parent().find("#messageid").text();
			$.get("x_messageservlet",{"op":"updatemes","messageid":messageid},function(pd,status){
				 
			 })
			
			$("#goodiddata").val(goodid);
			$("#usernamedata1").val(username);
			$("#messagecontentdata").val(messagecontent);
			$("#goodtitledata").val(goodtitle);
			
		
			
		})
		/*消息回复提交  */
		$(document).on('click','.subdata1',function(){
			
			var goodid=$("#goodiddata").val();
			
			var username=$("#usernamedata1").val();
			var content=$("#textdata1").val();
		
			//接受人的id
			var toid1=$("body").find("#toid").text();
			//发送人的id
			var fromid2=$("body").find("#fromid").text();
			 $.get("x_messageservlet",{"op":"addmes","toid1":fromid2,"fromid2":toid1,"content":content,"goodid":goodid},function(pd,status){
				 
			 })
			 
			 alert("提交成功");

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

					$.each(jsonpd.data,function(index,PERSONGOODS_IN){
						persongood_in_body(PERSONGOODS_IN);
					})
					/* 分页加载  */
				var pagee=jsonpd.page;
				var paget=jsonpd.TotalPage;				
				paging(pagee,paget)
				
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
				var paget=jsonpd.TotalPage;
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
		 //<input type='button' class='btn btn-info' id='detail'>详细 </button>
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


function paging(pagee,pagetotal){
	/*假的分页    */
	
	 
	 var divpage="<div class='col-md-12 column paging'><ul class='pagination page' style='position: absolute; left: 55%;'></ul></div>";
	// <li><a>上一页</a></li><li><a>1</a></li><li><a>2</a></li><li><a>3</a></li><li><a>4</a></li><li><a>....</a></li><li><a>8</a></li><li><a>下一页</a></li>
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
	 var up="<li><a class='+1' >上一页 </a></li>";
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
	 var down="<li><a class='-1' >下一页 </a></li>";
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
		<div class="modal fade" id="modal-container-129482" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						
						
							<div class="modal-body form-inline">
								<strong class="form-group" >用户名</strong>
								<input type="text"  readonly="readonly" class="form-control form-group" id="usernamedata" value="" />
							</div>
							<div class="modal-body form-inline">
								<strong class="form-group">商家编号</strong>
								<input type="text"  readonly="readonly" class="form-control form-group" id="sendiddata" value="" />
							</div>
							<div class="modal-body form-inline">
								<strong class="form-group">日期选择</strong>
								<input type="date" class="form-control form-group" id="datedata" value="" />
							</div>
							<div class="modal-body form-inline">
								<strong class="form-group" id="scoredata">评分</strong>
								<select name="" class="form-group">
									<option value="">1</option>
									<option value="">2</option>
									<option value="">3</option>
									<option value="">4</option>
									<option value="">5</option>
								</select>
							</div>
							<div class="modal-body form-inline">
								<strong class="form-group">内容</strong>
								<textarea name="" rows="3" cols="80" class="form-group" id="textdata"></textarea>
							</div>
						<div class="modal-footer" align="center">
							 <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button> <button type="button" class="btn btn-primary subdata">提交</button>
						</div>
					</div>
					
				</div>
				
			</div>
			<!--  回复的弹窗 -->
			<div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						
						
						    
							<div class="modal-body form-inline">
								<strong class="form-group" >商品编号</strong>
								<input type="text"  readonly="readonly" class="form-control form-group" id="goodiddata" value="" />
							</div>
							<div class="modal-body form-inline">
								<strong class="form-group">发件人名称</strong>
								<input type="text"  readonly="readonly" class="form-control form-group" id="usernamedata1" value="" />
							</div>
							<div class="modal-body form-inline">
								<strong class="form-group">商品名称</strong>
								<input type="text"  readonly="readonly" class="form-control form-group" id="goodtitledata" value="" />
							</div>
							<div class="modal-body form-inline">
								<strong class="form-group">留言内容</strong>
								<textarea name="" rows="3" cols="60"  readonly="readonly" class="form-control form-group" id="messagecontentdata" value="" ></textarea>
							</div>
							<div class="modal-body form-inline">
								<strong class="form-group">回复内容</strong>
								<textarea name="" rows="3" cols="60" class="form-group1" id="textdata1" resize="none" value=""></textarea>
							</div>
						<div class="modal-footer" align="center">
							 <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button> <button type="button" class="btn btn-primary subdata1" data-dismiss="modal">提交</button>
						</div>
					</div>
					
				</div>
				
			</div>
				
			</div>



<!--ajax区域-->
<script type="text/javascript">
/*  */
rflag=false;
lflag=false;
kflag=false;
	$(function(){
		$(document).keydown(function(event){
			  if(event.keyCode ==13){
				  var key1=$("#search7").val();
				     rflag=false;
					 lflag=false;
					getmsg("allmes",1,key1); 
					
					
			  }
			 	
			});
	
		/* 显示个人消息的的界面 */
		 $(".msg").click(function(){
			 rflag=false;
			 lflag=false;
			 getmsg("allmes",1,""); 
		 })
		$(".msgbtn").click(function(){
			
				 var key1=$(this).text();
				 rflag=key1=="已读"?true:false;
				 lflag=key1=="未读"?true:false;
				 getmsg("find",1,key1)
			 });
		
$(document).on("click",".pageNoAjax",function(){
	if(rflag==false&&lflag==false){
		op="find";
		ls=$("#search7").val();
		key1=ls;
	}else{
			op="find";
			key1=rflag==true? "已读":"未读";
			key1=lflag==true? "未读":"已读";
			}
			 getmsg(op,$(this).text(),key1);
		 })
				 
		
		 //分页查询，显示
		 
		 /* 搜索查询 */
		 /* 分页 */        
		 function getmsg(op,page,key1){
		
				//清除 ul中分页有关的部分
				 $(".personalajax").children().remove();
				//清除 表格中的分页数据内容 
	 $(".personalajax").append("<div class='form-inline'><strong class='form-group'>搜索：</strong> <input type='text' class='form-control form-group' id='search7' values='未读' placeholder='请输入关键字 自动检索 '></div>");
	 $(".personalajax").append("<input type='button' class='btn btn-warning' value='删除'/>");
	 $(".personalajax").append("<table class='table table-bordered table-hover '><thead><tr><th> <input type='checkbox' id='allbox'/></th><th>商品编号</th><th>商品名称</th><th>发信人姓名</th><th>留言时间</th><th>留言状态</th><th>操作</th></tr></thead><tbody></tbody></table>");
	$(".personalajax").append("<div class='row'><div class='col-md-2'></div><div class='col-md-6' id='msgpagination'><ul class='pagination'></ul></div></div>");

	$.get("x_messageservlet",{"page":page,"op":op,"key1":key1},function (pd,satus){
					

					//遍历pd中data（集合）
					//因为在服务器端已经返回json对象，所以这里不用使用JSON.parse
					$.each(pd.data,function(index,news){
						$("tbody").append("<tr><td><input type='checkbox' id='box' value='news.MESSAGEID'></td><td id='goodid'>"+news.GOODID+"</td><td id='goodtitle'>"+news.GOODTITLE+"</td><td id='username'>"+news.FROMID+"</td><td>"+news.MESSAGEDATE+"</td><td id='messagestate'>"+news.MESSAGESTATE+"</td>"+
								"<td><button type='button' class='btn btn-primary1' data-toggle='modal' data-target='#myModal'>查看信息</button></td><td hidden='hidden' id='messagecontent'>"+news.MESSAGECONTENT+"</td><td hidden='hidden' id='fromid'>"+news.FROMID+"</td><td hidden='hidden' id='toid'>"+news.TOID+"</td><td hidden='hidden' id='messageid'>"+news.MESSAGEID+"</td></tr>");

					});
					/*分页的页码显示*/
					$("#msgpagination ul").append("<li><a href='#'>上一页</a></li>");

					for(var i=1; i<=pd.totalPage;i++)
						{
						    if(pd.page == i)
						    	{
						    	 $("#msgpagination ul").append("<li class='active'><a class='pageNoAjax'>"+i+"</a></li>");
						    	
						    	}
						    else
						    	{
						    	 $("#msgpagination ul").append("<li class=''><a class='pageNoAjax'>"+i+"</a></li>");
						    	
						    	}
						}
					$("#msgpagination ul").append("<li><a href='#'>下一页</a></li>");
					//$("tbody").append();
					$("tr:even").not(":first").attr("class", "info");
					$("tr:odd").attr("class", "success");
					 $("#search7").val(key1);

	 });
}
	})
</script>

</body>
<script type="text/javascript">

(function(){
	var op='find';
	 var page=1;
	 var key1='未读';

		//清除 ul中分页有关的部分
	 $(".personalajax").children().remove();
	//清除 表格中的分页数据内容 
$(".personalajax").append("<div class='form-inline'><strong class='form-group'>搜索：</strong> <input type='text' class='form-control form-group' id='search7' values='' placeholder='请输入关键字 自动检索 '></div>");
$(".personalajax").append("<input type='button' class='btn btn-warning' value='删除'/>");
$(".personalajax").append("<table class='table table-bordered table-hover '><thead><tr><th> <input type='checkbox' id='allbox'/></th><th>商品编号</th><th>商品名称</th><th>发信人姓名</th><th>留言时间</th><th>留言状态</th><th>操作</th></tr></thead><tbody></tbody></table>");
$(".personalajax").append("<div class='row'><div class='col-md-2'></div><div class='col-md-6' id='msgpagination'><ul class='pagination'></ul></div></div>");

$.get("x_messageservlet",{"page":page,"op":op,"key1":key1},function (pd,satus){

		//遍历pd中data（集合）
		//因为在服务器端已经返回json对象，所以这里不用使用JSON.parse
		$.each(pd.data,function(index,news){

			$("tbody").append("<tr><td><input type='checkbox' id='box' value='news.MESSAGEID'></td><td id='goodid'>"+news.GOODID+"</td><td id='goodtitle'>"+news.GOODTITLE+"</td><td id='username'>"+news.FROMID+"</td><td>"+news.MESSAGEDATE+"</td><td id='messagestate'>"+news.MESSAGESTATE+"</td>"+
					"<td><button type='button' class='btn btn-primary1' data-toggle='modal' data-target='#myModal'>回复</button></td><td hidden='hidden' id='messagecontent'>"+news.MESSAGECONTENT+"</td><td hidden='hidden' id='fromid'>"+news.FROMID+"</td><td hidden='hidden' id='toid'>"+news.TOID+"</td><td hidden='hidden' id='messageid'>"+news.MESSAGEID+"</td></tr>");
		});
		/*分页的页码显示*/
		$("#msgpagination ul").append("<li><a href='#'>上一页</a></li>");

		for(var i=1; i<=pd.totalPage;i++)
			{
			    if(pd.page == i)
			    	{
			    	 $("#msgpagination ul").append("<li class='active'><a class='pageNoAjax'>"+i+"</a></li>");
			    	
			    	}
			    else
			    	{
			    	 $("#msgpagination ul").append("<li class=''><a class='pageNoAjax'>"+i+"</a></li>");
			    	
			    	}
			  
			}
	
		$("#msgpagination ul").append("<li><a href='#'>下一页</a></li>");
		//$("tbody").append();
		$("tr:even").not(":first").attr("class", "info");
		$("tr:odd").attr("class", "success");
        $("#search7").val(key1);
});
	
})();

</script>

</html>