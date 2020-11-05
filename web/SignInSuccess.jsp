<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%
	String userName = null;
	String userPasswd = null;
	Cookie cookie = null;

	Cookie[] cookies = request.getCookies();
	if (cookies != null) {
		for (int i = 0; i < cookies.length; i++) {
			if (cookies[i].getName().equals("registerCookie")) {
				/**
				String Name = URLDecoder.decode(cookies[i].getValue().split("#")[0], "utf-8");
				String userPhone = URLDecoder.decode(cookies[i].getValue().split("#")[1], "utf-8");
				String workPlace = URLDecoder.decode(cookies[i].getValue().split("#")[2], "utf-8");
				String email = URLDecoder.decode(cookies[i].getValue().split("#")[3], "utf-8");*/
				cookie = cookies[i];
				userName = URLDecoder.decode(cookies[i].getValue().split("#")[4], "utf-8");
				userPasswd = URLDecoder.decode(cookies[i].getValue().split("#")[5], "utf-8");
				// String className = URLDecoder.decode(cookies[i].getValue().split("#")[6], "utf-8");
				break;
			}
		}
	}
	if (userName == null) {
		userName = "";
		userPasswd = "";
	}

	request.setCharacterEncoding("UTF-8"); //post方法的防止中文乱码的方法
	//String Name = request.getParameter("userName");
	//String Passwd = request.getParameter("passwd");
	String Name = (String) session.getAttribute("userName");
	String Passwd = (String) session.getAttribute("passwd");
	//session.setAttribute("userName", request.getParameter("userName"));
	//session.setAttribute("Passwd", request.getParameter("passwd"));
	//设置会话存活时间，即在线时间600秒后掉线
    session.setMaxInactiveInterval(600);

	String chkd = (String) session.getAttribute("labelj"); //记住用户名复选框状态
	if (chkd.equals("true")) {

	} else {
		Cookie[] cookiess = request.getCookies();
		if (cookiess != null) {

			for (int i = 0; i < cookiess.length; i++) {

				String sp = cookiess[i].getName();

				if (sp.equals("registerCookie"))

				{

					cookies[i].setMaxAge(0);

					response.addCookie(cookies[i]);

				}

			}

		}

	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>中转页</title>
<link type="text/css" rel="styleSheet"  href="css/registerSuccess.css" />
</head>

<body>

	<center><p>登陆成功！<a href="Welcome.jsp">确认</a></p></center>

</body>
</html>