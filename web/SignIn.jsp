<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.net.URLDecoder"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>沈新源</title>

<link rel="stylesheet" href="css/SignIn.css" type="text/css">

<link rel="stylesheet" href="css/bootstrap-theme.css" type="text/css">

<link rel="stylesheet" href="css/bootstrap.css" type="text/css">


</head>

<body>
<%
int i = 0;
String userName = null;
String userPasswd = null;
Cookie cookies[] = request.getCookies();
if (cookies != null) {
    for (i = 0; i < cookies.length; i++) {
        if (cookies[i].getName().equals("registerCookie")) {           
            userName = URLDecoder.decode(cookies[i].getValue().split("#")[4], "utf-8");
            userPasswd = URLDecoder.decode(cookies[i].getValue().split("#")[5], "utf-8");
            break;
        }
    }
}

if (userName == null || userName.equals("")) {
    userName = "";
    userPasswd = "";
}

%>

	<div class="wrap">
		<h1 align="center">用户登录</h1>
		<div class="alert alert-danger alert-dismissable hide" align = center>
                 
                用户名或密码错误！！！
            </div>
<p id="p1" align="center">欢迎来访!</p>
		<form class="form-horizontal">
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">用户名</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="userName"
						placeholder="用户名" value = <%=userName %>>
				</div>
			</div>

			<div class="form-group">
				<label for="inputPassword3" class="col-sm-2 control-label">密码</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="userPasswd"
						placeholder="密码" value = <%=userPasswd %>>
				</div>
			</div>


			<div class="form-group">
				<label for="inputPassword" class="col-sm-2 control-label">验证码</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="executeWd" onblur="signB()"
						placeholder="验证码">
						<br>
						<center><img src="images/code.jpg" width="70" height="20"></center>
				</div>
			</div>

			<div class="form-group" align="center">
				<label for="inputPassword" class="col-sm-2 control-label">用户类型</label>
				<label class="radio-inline"> <input type="radio"
					name="inlineRadioOptions" id="inlineRadio" value="学生" >
					学生
				</label> <label class="radio-inline"> <input type="radio"
					name="inlineRadioOptions" id="inlineRadio" value="教师">
					教师
				</label> <label class="radio-inline"> <input type="radio"
					name="inlineRadioOptions" id="inlineRadio" value="管理员">
					管理员
				</label> <label class="radio-inline"> <input type="checkbox"
					name="remember"  id="remember">记住密码
				</label>
			</div>

			<div class="form-group" align="center">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="button" class="btn btn-default" id="btn-signIn" >登录</button>
					<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
					
					<button class="btn btn-default" name="sign"  onclick="copyTextB()">重置</button>
				</div>
			</div>

		</form>

		<p align="center" style="font-size: 15px; color: orange">
			还没有账号？<a href="Register.jsp">立即注册</a>
		</p>
		<p align="center" style="font-size: 15px; color: orange">
			忘记密码？<a href="refindPassward.jsp">立即找回</a>
		</p>

	</div>

    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

	<script>
		$(document).ready(
				//读取cookie
				
				function() {
				    
					//默认学生用户登陆
					//$("#userPasswd").val("666888aA_");
					$("input[name='inlineRadioOptions']:first").attr('checked',
							'true');
				    
					
					//默认记住密码
					$("input[name='remember']").attr('checked', 'true');

					//按下登录按钮后
					$("#btn-signIn").click(function() {
						$.post("SignInServlet",{
                            userName:$("#userName").val(),
                            userPasswd:$("#userPasswd").val(),
                            userType:$("#userType").val(),
                            remember:$("#remember").val()
                    }, function(data) {
							if (data > 0) {
								//用户名密码正确
								//console.log("Y");
								 $('.alert-danger').addClass('hide');
								window.location.href = "SignInSuccess.jsp";
							} else {
								//用户名密码错误
								console.log("密码错误");
								 $('.alert-danger').removeClass('hide');
							}
						})
					});

				});
	</script>
	<script>
	//登录时，清空已填写的信息
	function copyTextB() {

        document.getElementById("userName").value = "";
        document.getElementById("userPasswd").value = "";
        document.getElementById("executeWd").value = "";
         userName = "";
         userPasswd =  "";
    }
	
		function signB() {
			if (document.getElementById("userName").value == "") {
				 $("#p1").html("用户名不能为空！").css("color", "red");
				myform.userName.focus();
				return false;
			} else if (document.getElementById("userPasswd").value == "") {
				$("#p1").html("请输入密码！").css("color", "red");
				myform.passwd.focus();
				return false;
			} else if (document.getElementById("executeWd").value == "") {
				$("#p1").html("请输入验证码！").css("color", "red");
				myform.vertification.focus();
				return false;
			} else {
				if (document.getElementById("executeWd").value != "2xsd") {
					$("#p1").html("验证码有误！").css("color", "red");
					myform.vertification.focus();
					return false;
				} else {
					$("#p1").html("信息全部正确！").css("color", "green");
					userName = document.getElementById("userName").value;
					userPasswd = document.getElementById("passwd").value;
					return true;
				}
			}
		}

	</script>

</body>

</html>