<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>测试连接数据库</title>
</head>
<body>
    <center><p>连接数据库测试</p></center>
    <%
    Connection  conn = null;
        try {
            // 加载数据库驱动，注册到驱动管理器
            Class.forName("com.mysql.cj.jdbc.Driver");
            // 数据库连接字符串
           String url = "jdbc:mysql://localhost:3306/user_info?characterEncoding=utf-8&useSSL=false&serverTimezone=Asia/Shanghai&rewriteBatchedStatements=true";
            
            // 数据库用户名
            String username = "root";
            // 数据库密码
            String password = "root";
            // 创建Connection连接
            conn = DriverManager.getConnection(url,username,password);
           
            if(conn != null){
                out.println("数据路连接成功！");
                conn.close();
            }else{
            	out.println("数据库连接失败！");
            }
           
        } catch(ClassNotFoundException e){
        	e.printStackTrace();
        	out.print("类异常！");
        }catch (SQLException e) {
            out.print("数据库连接失败！！");
            e.printStackTrace();
        }
            
    %>
    <br>
   
</body>
</html>