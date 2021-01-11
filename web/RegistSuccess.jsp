<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.net.URLDecoder"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>注册信息</title>
</head>
<body >
	<%-- 注册成功后写入cookie--%>
	<%
	request.setCharacterEncoding("UTF-8"); //post方法的防止中文乱码的方法
	
	String Name = (String)session.getAttribute("Name");
	String userPhone =  (String)session.getAttribute("phone");
	String workPlace = (String)session.getAttribute("workPlace");
	String email = (String)session.getAttribute("email");
	String userName = (String)session.getAttribute("userName");
	String userPasswd = (String)session.getAttribute("userPasswd");
	String UserType = (String)session.getAttribute("userType");

	//String user = URLEncoder.encode(request.getParameter("user"), "utf-8");

	Cookie cookie = new Cookie("registerCookie", Name + "#" + userPhone + "#" + workPlace + "#" + email + "#"
			+ userName + "#" + userPasswd + "#"  +UserType);
	cookie.setMaxAge(60 * 60*24);     //cookie有效期一天
	response.addCookie(cookie);
%>

<div class="show">
<form action="SignIn.jsp" method="POST" name="myForm"
            onsubmit="true">
<center><h1>注册信息如下</h1></center>
	<table width="600px" border="2" align="center" >
		<tr>
			<td align="center" valign="middle">信息类型</td>
			<td align="center" valign="middle">信息内容</td>
		</tr>
		<tr>
			<td >姓名</td>
			<td > <%=Name %> </td>
		</tr>
		<tr>
			<td>手机号</td>
			<td ><%=userPhone%></td>
		</tr>
		<tr>
			<td>工作单位</td>
			<td><%=workPlace%></td>
		</tr>
		<tr>
			<td>邮箱</td>
			<td><%=email%></td>
		</tr>
		<tr>
			<td>用户名</td>
			<td><%=userName%></td>
		</tr>
		<tr>
			<td>密码</td>
			<td><%=userPasswd%></td>
		</tr>
		<tr>
			<td>用户类型</td>
			<td><%=UserType%></td>
		</tr>
		
	</table>
	<br>
	<div align="center">
	<input   name="Button" type="submit" value="确认信息">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input  name="Button" type="button" value="返回" onclick= "back();">
	</div>
	</form>
</div>
<script type="text/javascript">
           function back(){
        	   window.location.href = "Register.jsp";
           }
</script>
</body>
</html>