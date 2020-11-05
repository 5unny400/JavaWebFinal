<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
    <%@page import="java.sql.DriverManager"%>
    <%@page import=" java.sql.Connection"%>
    <%@page import=" java.sql.SQLException"%>
    <%@page import="  java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>执行插入信息</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8") ;
%>
<jsp:useBean id = "person" class = "exercise.Person"></jsp:useBean>
<jsp:setProperty property="*" name="person"/>
<%
String sql = "";
Connection conn = null;
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
     String url = "jdbc:mysql://localhost:3306/user_info?characterEncoding=utf8&useSSL=false&serverTimezone=Asia/Shanghai&rewriteBatchedStatements=true";
    String username = "root";
    String userpasswd = "root";
    conn = DriverManager.getConnection(url,username,userpasswd);    
    sql = "insert into tb_useraccount(name,userPhone,workPlace,userEmail,userName,passwd,userType) values(?,?,?,?,?,?,?)";
    PreparedStatement ps = conn.prepareStatement(sql);
    
    ps.setString(1, person.getName());
    ps.setString(2, person.getPhone());
    ps.setString(3, person.getWorkPlace());
    ps.setString(4, person.getEmail());
    ps.setString(5, person.getUserName());
    ps.setString(6, person.getPasswd());
    ps.setString(7, person.getUserType());
    int row = ps.executeUpdate();
    if(row > 0){
    	out.print("成功添加了"+row+"条数据！");
    }else{
    	out.print("未添加数据！");
    }
    ps.close();
    conn.close();
}catch(Exception e) {
    // TODO Auto-generated catch block
     out.print("人员信息添加失败！");
    e.printStackTrace();
}
%>
<br><br>
<center><a  href = "AddPeople.jsp">返回</a></center>
</body>
</html>