
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" %>
<%--jstl标签库的导入 --%>
<%@ taglib prefix="t" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getLocalPort()
			+ request.getContextPath();
	application.setAttribute("path", path);
%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<head>
<title>闲之| Register</title>
<link rel="stylesheet" href="${path }/css/reg.css">
<!-- CSS reset -->
<style type="text/css">
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button{
    -webkit-appearance: none !important;
    margin: 0; 
}</style>

<script id="jquery_183" type="text/javascript" class="library"
	src="${path }/js/jquery-1.8.3.min.js"></script>

<script type="text/javascript">
	function enableSubmit(bool) {

		if (bool)
			$("#submit").removeAttr("disabled");

		else
			$("#submit").attr("disabled", "disabled");

	}

	function v_submitbutton() {

		if ($("#agree").attr("checked") != "checked") {

			enableSubmit(false);

			$(".readagreement-wrap").css("outline", "1px solid #f99");

			return;

		} else {
			$(".readagreement-wrap").css("outline", "1px solid #9f9");
		}

		for (f in flags)
			if (!flags[f]) {
				enableSubmit(false);
				return;
			}

		enableSubmit(true);

	}

	function showAgreement() {

		$("#readagreement").removeAttr("onclick");

		$("#agreement").show();

		$("#agreement iframe").attr("src", "http://www.baidu.com");//此处为链接地址

	}

	function agree() {

		$("#agreement").hide();

		$("#readagreement").attr("onclick", "showAgreement();");

		if ($("#agree").attr("checked") != "checked")
			$("#agree").trigger("click");

	}

	function onReadAgreementClick() {

		return;

		if ($("#agree").attr("checked")) {

			$("#agree").removeAttr("checked");

		} else {

			$("#agree").attr("checked", "checked");

		}

		v_submitbutton();

	}

	var flags = [ false, false, false, false, false,false ];

	//真实姓名判断
	var Regrealname = /^[\u4e00-\u9fa5]{2,}$/;

	function lineState(name, state, msg) {

		if (state == "none") {
			$("#line_" + name + " .input div").attr("class", "none");
			return;
		}

		if (state == "corect") {
			$("#line_" + name + " .input div").attr("class", "corect");
			return;
		}

		$("#line_" + name + " .input span").text(msg);
		$("#line_" + name + " .input div").attr("class", "error");

	}

	function v_account() {

		var account = $("#account").val();
		
		if (!Regrealname.test(account)) {
			lineState("account", "error", "不符合姓名的格式 ");
			flags[0] = false;
			enableSubmit(false);
		}

		else {
			lineState("account", "corect", "");
			flags[0] = true;
		}

		v_submitbutton();

	}

	//用户名验证
	
	
	function v_name() {

		var name = $("#name").val();

		if (name.length == 0) {
			lineState("name", "error", "不得为空");
			flags[1] = false;
		}

		else {

			if (name.length > 24) {
				lineState("name", "error", "必须少于24个字符");
				flags[1] = false;
			}

			else {
				lineState("name", "corect", "");
				flags[1] = true;
			}

		}

		v_submitbutton();

	}
//18位身份证验证
	
	var Regcd = /^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/;
	
	function v_cd() {

		var cd = $("#cd").val();

		if (cd.length == 0) {
			lineState("cd", "error", "不得为空");
			flags[5] = false;
		}

		else {

			if (cd.length != 18) {
				lineState("cd", "error", "身份证字符数错误");
				flags[5] = false;
			}

			else {
				if (!Regcd.test(cd)) {
					lineState("cd", "error", "不符合身份证的格式 ");
					flags[5] = false;
					enableSubmit(false);
				}else{
					lineState("cd", "corect", "");
					flags[5] = true;
				}
			}

		}

		v_submitbutton();

	}
	
	//学号验证
	var RegXuehao = /^[0-9]{1,12}$/;

	function lineState1(xuehao, state, msg) {

		if (state == "none") {
			$("#line_" + xuehao + " .input div").attr("class", "none");
			return;
		}

		if (state == "corect") {
			$("#line_" + xuehao + " .input div").attr("class", "corect");
			return;
		}

		$("#line_" + xuehao + " .input span").text(msg);
		$("#line_" + xuehao + " .input div").attr("class", "error");

	}

	function v_xuehao() {

		var xuehao = $("#xuehao").val();
		if (!RegXuehao.test(xuehao)) {
			lineState1("xuehao", "error", "学号格式不正确");
			flags[2] = false;
			enableSubmit(false);
		}

		else {
			lineState("xuehao", "corect", "");
			flags[2] = true;
		}

		v_submitbutton();

	}

	//密码
	function v_password() {

		var password = $("#password").val();

		if (password.length < 6) {
			lineState("password", "error", "必须多于或等于6个字符");
			flags[3] = false;
		}

		else {

			if (password.length > 16) {
				lineState("password", "error", "必须少于或等于16个字符");
				flags[3] = false;
			}

			else {

				lineState("password", "corect", "");

				flags[3] = true;

			}

		}

		v_repeat();

		v_submitbutton();

	}
	//确认密码验证
	function v_repeat() {

		if (!flags[2]) {
			lineState("repeat", "none", "");
			return;
		}

		if ($("#password").val() != $("#repeat").val()) {
			lineState("repeat", "error", "密码不一致");
			flags[4] = false;
		}

		else {

			lineState("repeat", "corect", "");

			flags[4] = true;

		}

		v_submitbutton();

	}

	function adaptValue() {

		return true;

	}
</script>
<script type="text/javascript"> 
$(function() {
	
	
	//用户名失去焦点 的判断 
		$("#name").blur(function() {

			var $name = $("#name").val();

			$.post("UserServlet?up=isRightusername", {
				"username_reg" : $name
			}, function(data, status) {
				/* alert(data); */
				//var mes = data;
				if(data == "用户名可以使用"){
					/* alert("用户名可以使用111"); */
					lineState("name", "corect", "");
					flags[1] = true;
					
				}
				 else if(data == "用户名已经存在"){ 
					/* alert("用户名已经存在1111"); */
					lineState("name", "error", data);
					
					flags[1] = false;
					enableSubmit(false);
				}
				

			});
		});

		//身份证失去焦点 的判断 
		$("#cd").blur(function() {

			var $cd = $("#cd").val();

			$.post("UserServlet?up=isRightusercd", {
				"usercd_reg" : $cd
			}, function(data, status) {
				/* alert(data); */
				//var mes = data;
				if(data == "身份证信息已证实"){
					/* alert("用户名可以使用111"); */
					lineState("cd", "corect", "");
					flags[5] = true;
					
				}
				 else if(data == "身份证已被注册"){ 
					
					lineState("cd", "error", data);
					
					flags[5] = false;
					enableSubmit(false);
				}

			});
		});
	
}); 
</script>
</head>

<body style="background: url(${path}/images/reg/reg_back1.png) no-repeat fixed top left;" >
	<div id="top" style="margin-left:450px;">	
		<h1>register</h1>
	</div>

	<div class="form-bak"  style="background: none;margin-left:450px; height:680px;" >
		<form style="background: none;" method="post" action="${path}/UserServlet?up=userreg" onsubmit="adaptValue();">

			<div class="left" >

				<div class="line" id="line_account">

					<div class="info">

						<strong>真实姓名</strong> <span class="tips">填写你的真实姓名哦</span>

					</div>

					<div class="input">

						<input type="text" name="account" id="account"
							onblur="v_account();" onkeyup="v_account();" />

						<div class="none">

							<span></span>

						</div>

					</div>

				</div>

				<div class="line" id="line_name">

					<div class="info">

						<strong>用户名</strong> <span class="tips">只能由数字、文字或下划线组成<br />最多32个字符
						</span>

					</div>

					<div class="input">

						<input type="text" name="name" id="name" onblur="v_name();"
							onkeyup="v_name();" />

						<div class="none">

							<span></span>

						</div>

					</div>

				</div>
				<div class="line" id="line_cd">

					<div class="info">

						<strong>身份证CD</strong> <span class="tips">填写正确的身份证<br />
						</span>

					</div>

					<div class="input">

						<input type="number" name="cd" id="cd" onblur="v_cd();"
							onkeyup="v_cd();" />

						<div class="none">

							<span></span>

						</div>

					</div>

				</div>

				<div class="line" id="line_school">

					<div class="info">

						<strong>学校</strong> <span class="tips">只能由数字、文字或下划线组成<br />最多32个字符
						</span>

					</div>

					<div class="">
						<select name="chooseschool" id="chooseschool" value="选择学校">选择学校
							<option value="莆田学院">莆田学院</option>
							<option value="莆田三中">莆田三中</option>
							<option value="莆田一中">莆田一中</option>
						</select>

						<div class="none">

							<span></span>

						</div>

					</div>

				</div>


				<div class="line" id="line_xuehao">

					<div class="info">

						<strong>学号</strong> <span class="tips">请填写学号<br />都是数字哦
						</span>

					</div>

					<div class="input">


						<input type="number" name="xuehao" id="xuehao" onblur="v_xuehao();"
							onkeyup="v_xuehao();" />

						<div class="none">

							<span></span>

						</div>

					</div>

				</div>


				<div class="line" id="line_password">

					<div class="info">

						<strong>密码</strong> <span class="tips">6至16个字符</span>

					</div>

					<div class="input">

						<input type="password" name="password" id="password"
							onblur="v_password();" onkeyup="v_password();" />

						<div class="none">

							<span></span>

						</div>

					</div>

				</div>

				<div class="line" id="line_repeat">

					<div class="info">

						<strong>确认密码</strong> <span class="tips">再次输入密码</span>

					</div>

					<div class="input">

						<input type="password" name="repeat" id="repeat"
							onblur="v_repeat();" onkeyup="v_repeat();" />

						<div class="none">

							<span></span>

						</div>

					</div>

				</div>

			</div>

			<div class="right">

				<input type="submit" id="submit" value="去注册" disabled="disabled" />

				<div class="readagreement-wrap" onclick="onReadAgreementClick();">

					<input type="checkbox" name="agree" id="agree"
						onchange="v_submitbutton();" /> 同意《用户使用协议》

				</div>

				<div>
					已经拥有账号，<a href="mainshow.jsp">直接登录</a>
				</div>

				
			</div>

		</form>

	</div>

	<div id="agreement" class="agreement" style="display: none;">

		<h1>用户使用协议</h1>

		<iframe src=""></iframe>

		<input type="button" value="同意" onclick="agree();" /> <a href="#"
			class="backtotop">返回顶部</a>

	</div>
</body>

</html>