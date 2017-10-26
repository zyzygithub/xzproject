<%@page import="com.etc.entity.Types"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%--jstl标签库的导入 --%>
<%@ taglib prefix="t" uri="http://java.sun.com/jsp/jstl/core" %>
<%String path = request.getScheme()+"://"+request.getServerName()+":"+request.getLocalPort()+request.getContextPath();
application.setAttribute("path", path);
%>

<!DOCTYPE html>
<html>

<head>
<title>闲之| Home</title>
<!-- 主页的头部图标 -->
<link rel="apple-touch-icon" href="https://upzip.b0.upaiyun.com/website/3.6.0/icons/logo1@128.png">
<link rel="shortcut icon" href="https://upzip.b0.upaiyun.com/website/3.6.0/favicon.ico">
<link href="https://upzip.b0.upaiyun.com/website/3.6.0/styles/showindex.css?1ea0a1186d1c01821d51" rel="stylesheet">
<link href="css/mainshow.css" rel="stylesheet" type="text/css" media="all" />
<link href="${path}/css/bootstrap.css" rel='stylesheet' type='text/css' />
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script src="${path}/js/jquery.min.js"></script>
<link href="${path}/css/mainshow.css" rel="stylesheet" type="text/css" media="all" />

</head>

<script type="text/javascript"> 
$(function() {
	key="${requestScope.key}";
	page=${requestScope.goodPd.page==null? 1:requestScope.goodPd.page};
	maxpage=${requestScope.goodPd.totalPage==null? 1:requestScope.goodPd.totalPage};
	typekey="${requestScope.typeKey}";
	flag=key==null? false:true;
	priceDown=0;
	priceUp=99999;
	(function ini(){
		if(${requestScope.key!=null}){
			$("#keytext").val("${requestScope.key}");
		}
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
			  $("#Writeoff").css("display","none");
		  }
	})();
	
	
	$("#Writeoff").click(function(){
		if(confirm("确认要注销？")){
			$.post("UserServlet",{"up":"writeOff"},function(msg,states){
				location.reload(true);
				alert(msg);
			})
		}
		
	})
	//
	$(document).on("click",".cart",function( e ){
		if(${sessionScope.user1!=null}){
			var userName = "${sessionScope.user1}";
			//得到商品的id
		    var $input = $(this).parents("div").children("a").children("input").val();
			addToSC($input);
			        
		}else{
			alert("请先登录，在尝试操作");
		}
		
	});
	
	//2、加入收藏
	$(document).on("click",".like",function( e ){
		var userName = "${sessionScope.user1}";
		//得到商品的id
	
		var $input = $(this).parents("div").children("a").children("input").val();
		$.post("LikeServlet",{"op":"addLike","goodId":$input},function(data,status){
	  			$("#mylikecount").text(parseInt(data));
	  			alert(data.substr(data.length-3,data.length));
		
	});
	});

	//得到大类型
		 $.get("${path}/TypesServlet",{"op":"unittype"},function(TypesData,status){
			
			$.each(TypesData,function(index,type){
				$("#type").append("<a href='GoodsServlet?op=getGoodsByType&key="+type.TYPENAME+"'>"+" "+type.TYPENAME+" "+"</a>");
			});
			
		}); 
	
	$("#btnprice").click(function(){
		
		if(parseInt($("#textdown").val())==$("#textdown").val()&&parseInt($("#textup").val())==$("#textup").val())
		{
		priceDown=$("#textdown").val();
		priceUp=$("#textup").val();
		if(typekey.length>0){
			key=typekey;
			op="getGoodsByTypePage"
		}else{
		op="searchGoodsPage";
		key=flag==true? $("#keytext").val():"";
		}
		
		getGoods(op,1,key,priceDown,priceUp);
		}else{
			alert("请输入正确的价格格式");
		}
	})
	
	$(document).on("click",".gogood",function(){
		var goodId=$(this).children("input").val();
		location.href="GoodsServlet?op=getGD&goodId="+goodId;
	});
	
	//搜索商品按钮点击事件
	$("#rbtn").click(function(){
		typekey="";
		key=$("#keytext").val();
		op="searchGoodsPage";
		getGoods(op,1,key,priceDown,priceUp);
		
	})
	$("#pbtn").click(function(){
		location.href="GoodsServlet?op=getSellGood&taname="+$("#keytext").val();
	})
	$(document).on("click",".pageA",function(){
		 if(typekey.length>0){
			op="getGoodsByTypePage";
			key=typekey;
		}else{
			op="searchGoodsPage";
			key=flag==true? $("#keytext").val():"";
		}
		getGoods(op,$(this).text(),key,priceDown,priceUp);
	})
	$(document).on("click",".pageprev",function(){
		if(page>1){
			if(typekey.length>0){
				op="getGoodsByTypePage";
				key=typekey;
			}else{
				op="searchGoodsPage";
			}
			getGoods(op,page-1,key,priceDown,priceUp);
			}
	})
	
	$(document).on("click",".pagenext",function(){
		if(page<maxpage){
		if(typekey.length>0){
			op="getGoodsByTypePage";
			key=typekey;
		}else{
			op="searchGoodsPage";
			key=flag==true? $("#keytext").val():"";
		}
		getGoods(op,page+1,key,priceDown,priceUp);
		}
	})
	
	function getGoods(op,p,key,pD,pU){
		$.post("GoodsServlet",{"op":op,"page":p,"key":key,"priceDown":pD,"priceUp":pU},function(pd,states){
			$("#goodlist div").remove();
			$("#pageul li").remove();
			if(pd.total!=0){
			$.each(pd.data,function(index,goods){
				
				$("#goodlist").append("<div class=' ipad text-center ' style='display: inline-block;width: 18%;height:300px;background-color: ;margin: 8px;font-family: ms sans serif, arial; font-size: 8pt; width: 100; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;'>"
						+"<a class='gogood' ><img src='"+goods.GOODPIC+"' alt='' style='width: 95%;height: 170px;' />"
						+"<input type='hidden' value='"+goods.GOODID+"'/><h4>"+goods.GOODTITLE+"</h4></a>"
						+"<h3 style='display: inline'>$"+goods.GOODPRICE+" </h3>"
						+"<h4 style='text-decoration:line-through;display: inline'>$"+goods.ORIGINALPRICE+"</h4>"
						+"<br/>"+goods.GOODREMARK
						+"<br/>"
						+"<ul>"
							+"<li><i class='cart-1'></i><a class='cart' >Go Cart</a><i class='heart'></i><a  class='like'>I Like</a></li>"
						+"</ul></div>"
						)	
			});
			
			$("#pageul").append("<li><a class='pageprev'><</a></li>");
			for(var i=1;i<=pd.totalPage;i++){
				if(pd.page==i){
					$("#pageul").append("<li class='active'><a class='pageA '>"+i+"</a></li>");
				}else{
					$("#pageul").append("<li ><a class='pageA '>"+i+"</a></li>");
				}
			}
			
			$("#pageul").append("<li><a class='pagenext'>></a></li>");
			page=pd.page;
			maxpage=pd.totalPage;
			}else{
				$("#goodlist").append("	<div align='center'><img src='images/nosearch.jpg'></div>");
			}
		})
		
	}
	
	function addToSC(goodId){
		$.post("GoodsServlet",{"op":"addToSC","goodId":goodId,"goodCount":$(".input-number").val()},function(count,states){
			$("#mysccount").text(count);
			alert("商品已加入购物车！");
		});
	}
}); 
</script>

<body style="background-color: #FAFAFA;">

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
						<li>
							<a href="mainshow.jsp">HOME</a>
						</li>
						<li>
							<i class="user"></i>
							<a href="account_message.jsp">我的</a>
						</li>
						<li class="login">
							<i class="lock"></i>
							<a id="login" href="#loginModal" data-toggle="modal">[hi~]登录</a> <a id="Writeoff" >注销</a> <a href="${path }/reg.jsp" id="reg">我要注册</a>
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
						<a href="login.html"></a>
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
						
		            	<input type="search" placeholder="请输入您要搜索的内容..." id="keytext">
		            	<input type="button"  style="margin-left: -15px;"   value="搜用户" id="pbtn"/>
		            	<input id="rbtn"   style="margin-left: -7px;" type="button" value="搜商品"/>
	        			
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!-- header-section-ends -->
	<hr style="background-color: #3694C7;height: 1px;"/>
	<!--检索begin -->
	<div class="clearfix"></div>
	
	<div>
		
		<br />
		<div class="col-md-1"></div>
		<div class="table-responsive col-md-10" >
			
			<table class="table table-bordered">
					<tbody> 
						<tr class="active">
							<td  id="type">类型分类</td>
						</tr>
						<tr class="active">
							<td>筛选条件：<a href="#">学生党  </a><a href="#">上班族    </a><a href="#">潮人   </a><a href="#">宝妈   </a></td>
						
						</tr>
					</tbody>
			</table>
			<table class="table table-bordered table-condensed">
					<tbody> 
						<tr class="active">
							<td  style="text-align:center;vertical-align:middle;" class="active">最新排序</td>
							<td>价格：<input type="text" placeholder="￥" id="textdown"/> -
	    						<input type="text" placeholder="￥" id="textup"/><button id="btnprice">搜索</button>
	    						<i class="heart"></i><a href="#">收藏最多</a>
	    				
							</td>
						
						</tr>
						
					</tbody>
			</table>
		</div>
		<div class="col-md-1"></div>
	</div><!--检索end -->
	
       <div class="" style="margin-top: 0px; ">
       	<div class="col-md-1"></div>
			<!-- 5个商品轮播最新闲置显示 -->
		    <div id="goodlist"class="col-md-10 device" >
		      	<t:if test="${requestScope.goodPd.total==0}">
		      	<div align="center">
		      	<img src="images/nosearch.jpg" id="nosearch">
		      	</div>
		      	</t:if>
		      	<t:forEach items="${requestScope.goodPd.data }" var="good">
		      	<div class=" ipad text-center " style="display: inline-block;width: 18%;height:300px;background-color: ;margin: 8px;font-family: ms sans serif, arial; font-size: 8pt; width: 100; text-overflow: ellipsis; overflow: hidden; white-space: nowrap; ">
							<a class='gogood' >
							<img src="${good.GOODPIC}" alt="" style="width: 95%;height: 170px;" />
							<input type="hidden" value="${good.GOODID }"/><h4>${good.GOODTITLE }</h4></a>
							
							<h3 style="display: inline">$${good.GOODPRICE } </h3>
					<h4 style="text-decoration:line-through;display: inline"> $${good.ORIGINALPRICE }</h4>
							<br/>${good.GOODREMARK }
							
							<br/>
							<ul>
								<li><i class="cart-1"></i><a class="cart" >Go Cart</a><i class="heart"></i><a  class="like">I Like</a></li>
							</ul>
				</div>
				
				</t:forEach>
				</div>
				
	  	<div class="col-md-1"></div>
	</div>
	<!--page分页 begin-->
       <div class="text-center">
       	<div class="col-md-1"></div>
			<div class="col-md-10 column">
				<ul class="pagination" id="pageul">
				 	<li>
						 <t:if test="${goodPd.total!=0 }">
						 <a class="pageprev"><</a>
						 </t:if>
					</li>
					<t:forEach begin="1" end="${goodPd.totalPage}" var="index">
					<t:if test="${goodPd.page==index }">
					<li class='active'>
						 <a  class="pageA ">${index }</a>
					</li>
					</t:if>
					<t:if test="${goodPd.page!=index }">
					<li >
						 <a  class="pageA ">${index }</a>
					</li>
					</t:if>
					</t:forEach>
					
					<li>
						 <t:if test="${goodPd.total!=0 }">
						 <a class="pagenext">></a>
						</t:if>
					</li> 
				</ul>
			</div>
		<div class="col-md-1"></div>
		</div> <!--page分页 end-->
    <div class="footer">
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

</body>
	
		
</html>