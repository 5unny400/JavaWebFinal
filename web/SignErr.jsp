<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>登录失败</title>
</head>
<%
request.setCharacterEncoding("UTF-8");
String userName = (String)session.getAttribute("userName");
String passwd = (String)session.getAttribute("passwd");
%>
<body>
<div>
<center>
        <h1>错误信息如下</h1>
        输入的账号密码 userName=
        <%=userName%>
        userPasswd=
        <%=passwd%>

<p>登录失败！</p>
<p>去登陆？<a href="SignIn.jsp">返回登录！</a></p>
<p>没有账号？<a href="Register.jsp">返回注册！</a></p>
    </center>
</div>
</body>
</html>