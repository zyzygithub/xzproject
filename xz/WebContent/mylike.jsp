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
<link href="${path }/css/bootstrap.css" rel='stylesheet' type='text/css' />
<script src="${path }/js/jquery.min.js"></script>
<link href="${path }/css/mainshow.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" type="text/css" href="${path }/css/default.css">
<link href="${path }/cssleft/jquery-accordion-menu.css" rel="stylesheet"
	type="text/css" />
<link href="${path }/cssleft/font-awesome.css" rel="stylesheet" type="text/css" />

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

#tablegood{
margin-top:-20px;
} 
#tablegood a{
	color: black;
}
#tablegood a:hover{
	color: #017EBC;
	cursor: pointer;
}

input[type=button]{
	border: solid #017EBC;
	border-radius: 5px;
}
.changecss{
	background-color:#017EBC;
	border-radius:8px;
}
td a{
	display: block;
	margin-left: 30px;
}
.goodcontent{
	display: -webkit-box;
	text-overflow: -o-ellipsis-lastline;
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 3;
	-webkit-box-orient: vertical;
	
}
table{
	margin-top: 0px;
	
}
#choseallgood{
	float: right;
}


</style>

<script src="${path }/js/jquery-1.11.2.min.js" type="text/javascript"></script>
<script src="${path }/js/jquery-accordion-menu.js" type="text/javascript"></script>
<script type="text/javascript">
<!--ajax区域-->
 $(function(){
	//初始化like信息
	//设置全局变量
		window.i=0;//当前页数
		window.totalPage=0;//总页数
	
		$.get("LikeServlet",{"op":"queryAllByPage"},function(pd,status){
			//调用传过来的data
			if(pd.totalPage == 0){
				clearall();
			}else{
				showData(pd,status);
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
			}
			
		});
		function showData(pd,status){
			//清除 ul中分页有关的部分
			$("#pagemes").children().remove();
			
			//清除 表格中的分页数据内容
			$("#panel-good").children().remove();
			//遍历pd.data的数据
			$.each(pd.data,function(index,LikeMes){
				var str="<table id='tablegood' class='table'>"
				+"<thead><tr><th style='width:10%;' >用户名:"
				+"<a class='taname'>"+LikeMes.SELERNAME+"</a>"
				+"</th><th style='width:60%;'>￥"
				+LikeMes.GOODPRICE
				+"</th><th><input type='checkbox'  class='cks' name='' id='' value="
				+LikeMes.LIKEID+" />选择</th></tr></thead>"
				+"<tbody><tr><td><input type='hidden' value='"+LikeMes.GOODID+"'/></td><td  style='display: inline-block;"
				+"width:120px; height:90px;text-align: center;align-content: center;'>"
				+"<div id='' class='changecss' style='margin-left:-80px;text-align:center;width:120px; height:90px;'>"
				+"<img id='' class='imgclick' src='"
				+LikeMes.GOODPIC+ "'style='border-radius:5px;width:116px; height:86px;margin:2px auto;'/>"
				+"</div></td><td style='height:117px' ><a>[转卖]"+LikeMes.GOODTITLE
				+"</a><div class='goodcontent' ><a>"
				+LikeMes.GOODREMARK+
				"</a></div></td><td></td></tr><tr><td><a class='message' data-toggle='modal'>联系他</a></td><td><p>点击数 :"+LikeMes.GOODCLICK+"</p>"
				+"</td><td><input class='cancel' type='button' value='取消收藏' />"
				+"</td><td><input type='button' style='float:right;' class='ilike' value='去看看' /></td></tr></tbody></table>"
			
				+"<hr style='background-color: #3694C7;height: 1px;'/>"
				$("#panel-good").append(str);
			});
			//循环显示页码
			$("#pagemes").append("<li><a class='pageLast' >Prev</a></li>");
			//循环显示页码
			for(var i=1; i<=pd.totalPage;i++)
				{
				    if(pd.page == i)
				    	{
				    	 $("#pagemes").append("<li class='active'><a class='pageNo'>"+i+"</a></li>");
				    	}
				    else
				    	{
				    	 $("#pagemes").append("<li class=''><a class='pageNo'>"+i+"</a></li>");
				    	}
				}
			$("#pagemes").append("<li><a class='pageNext' >Next</a></li>");
			
		}
		$(document).on("click",".taname",function(){
			location.href="GoodsServlet?op=getSellGood&taname="+$(this).text();
		})
		
		//具体页数 点击
		$(document).on("click",".pageNo",function(){
			window.i=$(this).text();
			$.get("LikeServlet",{"op":"queryAllByPage","page":$(this).text()},function(pd,status){
				//调用传过来的data
				showData(pd,status);
				if(window.i==1){
					$(".pageLast").css("color","#dddddd");
				}
				if(window.i==window.totalPage){
					$(".pageNext").css("color","#dddddd");
				}
			});
		});
		function clearall(){
			//清除 ul中分页有关的部分
			$("#pagemes").children().remove();
			
			//清除 表格中的分页数据内容
			$("#panel-good").children().remove();
			$("#panel-good").append("<div><img src='images/nosearch.jpg'></div>");
		}
		//前一页  后一页 
		$(document).on("click",".pageLast",function(){
			//判断当前页的全局变量值为多少，为1则链接无效
			if(window.i==1){
				$(".pageLast").css("color","#dddddd");
			}else{
				var index=window.i-1;
				
					$.get("LikeServlet",{"op":"queryAllByPage","page":index},function(pd,status){
						//调用传过来的data
						window.i=index;
						showData(pd,status);
						if(window.i==1){
							$(".pageLast").css("color","#dddddd");
						}
					});
			}
		});
		//点击sendMessage发送信息
		$("#sendmessage").click(function(){
			var messageContent = $("#mycontent").val();
			
			var goodId = $("#goodid").val();
			$.get("MessageServlet", {"op" : "sendGoodMessage","goodId":goodId,"messageContent":messageContent}, function(data, status) {
				
			});
		});
		//联系他 传商品ID 跳出模态框
		$(document).on("click",".message",function() {
			var goodid = $(this).parents('table').find('input[type=hidden]').val();
			$("#mycontent").val("");
			$(this).attr("href","#myModal");
			$("#goodid").val(goodid);
		});
		$(document).on("click",".pageNext",function(){
			if(window.i==window.totalPage){
				$(".pageNext").css("color","#dddddd");
			}else{
				var index=window.i*1+1*1;
				
				if(index==window.totalPage){
					$(".pageNext").css("color","#dddddd");
				}
					$.get("LikeServlet",{"op":"queryAllByPage","page":index},function(pd,status){
						//调用传过来的data
						window.i=index;
						showData(pd,status);
						if(window.i==window.totalPage){
							$(".pageNext").css("color","#dddddd");
						}
					});
				
			}
			
		});
		
		//点击我去看
		$(document).on(
				"click",
				".ilike",
				function() {
				
					var goodId = $(this).parents('table').find('input[type=hidden]').val();
					location.href = "GoodsServlet?op=getGD&goodId=" + goodId;
				});
		
		
	//點擊圖片
	$(document).on("click",".imgclick",function() {
		//得到对应的商品id
		//如果选中了
			if ($(this).parents('table').find('input[type=checkbox]').prop('checked')) {
		//设置这个不被选中
			$(this).parents('table').find('input[type=checkbox]').prop("checked", "");
			} 
			else{
			//选中
			$(this).parents('table').find('input[type=checkbox]').prop("checked", "true");
			}
	});
	//选择复选框 
	$(document).on("click",".cks",function() {
		//得到对应的商品id
		
		var flag=$(this).prop("checked");
		if(flag){
			$(this).attr("checked",true);
		}else{
			$(this).attr("checked",false);
		}
	
	});
	
	//点击取消
	$(document).on("click",".cancel",function(){
		if (confirm("你确定提交吗？")) {  
            alert("点击了确定");  
           var likeid = $(this).parents('table').find('input[type=checkbox]').val();
         	
	           $.get("LikeServlet",{"op":"deleteone","likeid":likeid},function(pd,status){
	       		
	       		if(pd.total==0){
	       			clearall();
	       		}else{
	       			showData(pd,status);
	       		}
	       		
	       	});
           
        }  
        else {  
            alert("点击了取消");  
        }
	});
	
	
	$(document).on("click","#clear",function(){
		if (confirm("你确定清空购物车吗吗？")) {  
            alert("点击了确定");  
         
	        $.get("LikeServlet",{"op":"clear"},function(pd,status){
	       
	       		clearall();
	       		showData(pd,status);
	       	});
           
        }  
        else {  
            alert("点击了取消");  
        }
	});
		
		
		//点击全选清除按钮
		
		//清空购物车
		
		$("#choseallgood").click(function(){
			//设置全选中
			$(this).parents('body').find('input[type=checkbox]').prop("checked", "true");
			//得到选中的值id放在数组中
			obj = $(this).parents('body').find('input[type=checkbox]');
			if (confirm("你确定删除吗？")) {  
	            alert("点击了确定");  
	            check_val = [];
				 for(k in obj){
		       	//删除掉
		        	check_val.push(obj[k].value);
		       		var likeid = obj[k].value;
		       	 	$.get("LikeServlet",{"op":"deleteone","likeid":likeid},function(pd,status){
			       		//调用showData(pd,satus)
			       		
			       		clearall();
			       		
			    	});
		       }
	        }  
	        else {  
	            alert("点击了取消");  
	        }
			
		});
		$.ajaxSetup({
			  async: false
			  });
		$("#chosegood").click(function(){
			if (confirm("你确定删除吗？")){  
	             alert("点击了确定");
				$(":checked").each(function(){
					var likeid=$(this).val();
		
					$.get("LikeServlet",{"op":"deleteone","likeid":likeid},function(pd,status){
			       		
			       		if(pd.total==0){
			       			clearall();
			       		}else{
			       			showData(pd,status);
			       		}
			       		
			    	});
				}); 
	        }else {  
	            alert("点击了取消");  
	        }
			
		});

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
			<div class="col-md-9 personalajax">
				<div id="content" style="height: 800px;">

						
<div>
	<div>
		<input type="search" placeholder="搜索具体的商品"/>
		<input class="cancel" type="button" value="检索" />
	<input id="choseallgood" type="button" value="全选删除" />
	<input id="chosegood" type="button" value="选中删除" />

	
	</div>
	
	<!--表格 begin-->
	
	<br /><div class="tabbable" id="tabs-650261">
				<ul class="nav nav-tabs">
					<li class="active">
						 <a href="#panel-good" data-toggle="tab">收藏闲置</a>
					</li>
					
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="panel-good">
					
					</div>
					
				</div>
			</div>	<!--表格 end-->
			
		
</div>

				</div>
					<!--page分页 begin-->
       <div class="text-center">
       	<div class="col-md-1"></div>
			<div class="col-md-10 column">
				<ul class="pagination" id="pagemes">
					
				</ul>
			</div>
		<div class="col-md-1"></div>
		</div> <!--page分页 end-->
			</div>

		</div>


	</div>
	</div>
	<!--尾巴-->
	<div class="footer col-md-12" style="clear: both;">
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

<!--  回复的弹窗 -->
<div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
						<!--  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×<tton>
							 -->

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