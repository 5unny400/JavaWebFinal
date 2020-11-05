<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>欢迎登陆！</title>
</head>
<body>
	<center>
		<p1>登陆成功，正在跳转！</p1>
	</center>

	<%
		response.setHeader("refresh", "3;url = FindServlet");
	%>
</body>
</html>