<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>中转页</title>
<link type="text/css" rel="styleSheet" href="css/registerSuccess.css" />
</head>

<body>
<%
String userName = null;
String userPasswd = null;
int i =0;
request.setCharacterEncoding("UTF-8"); //post方法的防止中文乱码的方法

//先查询是否有cookie
Cookie cookie;
Cookie[] cookiess = request.getCookies();
if (cookiess != null) {
    for (i = 0; i < cookiess.length; i++) {
        String sp = cookiess[i].getName();
        if (sp.equals("registerCookie"))
        {
            cookie = cookiess[i];
            break;
        }
    }
}
%>
	<center>
		<p>
			登陆成功！<a href="Welcome.jsp">确认</a>
		</p>
	</center>


	<script>
String Name = (String) session.getAttribute("userName");
String Passwd = (String) session.getAttribute("passwd");

//设置会话存活时间，即在线时间600秒（十分钟）后 掉线
session.setMaxInactiveInterval(600);

String chkd = (String) session.getAttribute("label"); //记住用户名复选框状态
if (chkd.equals("true")) {
	//写入cookie
		   cookie = new Cookie("registerCookie",Name+"#"+Name+"#"+Name+"#"+Name+"#"+Name+"#"+Passwd+"#"+new java.util.Date().toLocaleString());
	/**/
		//cookie保存一个月
		cookie.setMaxAge(60*60*24*30);
	    response.addCookie(cookie);
} else {
   if(cookie!=null){
	cookies.setMaxAge(0);
    response.addCookie(cookie);
   }
}
</script>
</body>
</html>