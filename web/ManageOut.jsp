<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>退出</title>
<script>

</script>
</head>
<body >

<%
//转到登录界面并且销毁session
session.removeAttribute("userName");
session.removeAttribute("Passwd");
session.invalidate();
  response.sendRedirect("SignIn.jsp");
  
%>
</body>
</html>