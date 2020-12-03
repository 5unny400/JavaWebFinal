<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.net.URLDecoder"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>沈新源</title>
<style>
.wrap {
	margin: 0px;
	background-size: cover;
	background-repeat: no-repeat;
	background-image: url(images/bk_image.jpg);
	height: 600px;
	background-position: center;
}
</style>
<%
String userName = null;
String userPasswd = null;

	Cookie[] cookies = request.getCookies();
	if (cookies != null) {
		for (int i = 0; i < cookies.length; i++) {
			if (cookies[i].getName().equals("registerCookie")) {
				/**
				String Name = URLDecoder.decode(cookies[i].getValue().split("#")[0], "utf-8");
				String userPhone = URLDecoder.decode(cookies[i].getValue().split("#")[1], "utf-8");
				String workPlace = URLDecoder.decode(cookies[i].getValue().split("#")[2], "utf-8");
				String email = URLDecoder.decode(cookies[i].getValue().split("#")[3], "utf-8");*/
				userName = URLDecoder.decode(cookies[i].getValue().split("#")[4], "utf-8");
				userPasswd = URLDecoder.decode(cookies[i].getValue().split("#")[5], "utf-8");
				// String className = URLDecoder.decode(cookies[i].getValue().split("#")[6], "utf-8");
				break;
			}
		}
	}
	if(userName == null||userName.equals("null")){
		userName = "";
		userPasswd = "";
	}
	
%>
<script language="javascript">
	function signB() {
		if (myform.userName.value == "") {
			alert("请输入用户名！");
			myform.userName.focus();
			return false;
		} else if (myform.passwd.value == "") {
			alert("请输入密码！");
			myform.passwd.focus();
			return false;
		} else if (myform.vertification.value == "") {
			alert("请输入验证码!");
			myform.vertification.focus();
			return false;
		} else {
			if (myform.vertification.value != "2xsd") {
				alert("验证码有误!");
				myform.vertification.focus();
				return false;
			} else {
				alert("正在判断！");
				userName = document.getElementById("userName").value;
				userPasswd = document.getElementById("passwd").value;
				return true;
			}
		}
	}
	function copyTextB() {

		document.getElementById("userName").value = "";
		document.getElementById("passwd").value = "";
		document.getElementById("vertification").value = "";
		 userName = "";
		 userPasswd =  "";
	}
</script>
</head>

<body>

	<div class="wrap">
		<center>
			<h1>用户登录</h1>
		</center>
		<form action="SignInServlet" method="POST" name="myform"
			onsubmit="return signB();">
			<table width="420" border="0" align="center">
				<tr>
					<td align="center" valign="center">用&nbsp;户&nbsp;名：</td>
					<td><input name="userName" id="userName" type="text"
						value=<%=userName%>></td>
				</tr>
				<tr>
					<td align="center">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
					<td><input name="passwd" id="passwd" type="password"
						value=<%=userPasswd%>></td>
				</tr>
				<tr>
					<td align="center">验&nbsp;&nbsp;证&nbsp;码：</td>
					<td><input name="vertification" id="vertification" type="text"></td>
					<td><img src="images/code.jpg" width="70" height="20"></td>
				</tr>
				<tr>
					<td align="center">用户类型：</td>
					<td align="center">学生<input name="UserType" id="UserType" type="radio"
						class="noborder" value="学生" checked> &nbsp;&nbsp;教师 <input id="UserType"
						name="UserType" type="radio" class="noborder" value="教师">
						&nbsp;&nbsp;管理员 <input name="UserType" type="radio" id="UserType"
						class="noborder" value="管理员">
					</td>
				</tr>
				<tr>
				<td></td>
				<td></td>
				    <td>
				            <input type = "checkbox" name = "remember" id = "remember" value = "true" >记住用户名   
				    </td>
				 
				</tr>
				<tr>
					<td align="center"><input name="sign" type="submit" value="登录">
					</td>
					<td align="center"><button name="sign"  onclick="copyTextB()">重置</button>
					</td>

				</tr>
			</table>

			<center>
				<p>
					还没有账号？<a href="Register.jsp">立即注册</a>
				</p>
				<p>
					忘记密码？<a href="refindPassward.jsp">立即找回</a>
				</p>
			</center>
		</form>

	</div>
</body>

</html>