<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import=" java.util.List"%>
<%@page import="exercise.Person"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>查询结果</title>
<script type="text/javascript">
    function check(form) {
        with (form) {
            if (bookCount.value == "") {
                alert("请输入更新用户名！");
                return false;
            }
            if (isNaN(changedName.value)) {
                alert("格式错误！");
                return false;
            }
            return true;
            
        }
    }
</script>
</head>

<body>
            <center>
                      <h1>学生信息</h1>
             </center>
<table width="900" border="1" align="center">
            
                <tr align="center">
                    <td class="two" align="center">用户名&nbsp;</td>
                    <td class="two" align="center">姓名&nbsp;</td>
                    <td class="two" align="center">用户类型&nbsp;</td>
                    <td class="two" align="center">手机号&nbsp;</td>
                    <td class="two" align="center">邮箱&nbsp;</td>
                    <td class="two" align="center">所在单位&nbsp;</td>
                    <td class="two" align="center">密码&nbsp;</td>
                    <td class="two" align="center">操作用户名&nbsp;</td>
                
                </tr>
                <%
                          List<Person> list = (List<Person>)request.getAttribute("listPerson");
                if(list == null || list.size() < 1){
                    out.print("没有找到"+request.getAttribute("userName")+"学生的信息！");
                }else{
                    // 遍历学生集合中的数据
                    for(Person person : list){
                 %>
                <tr align="center" >
            <td  align="center"><%=person.getUserName()%></td>
            <td  align="center"><%=person.getName()%></td>
            <td  align="center"><%=person.getUserType()%></td>
            <td  align="center"><%=person.getPhone()%></td>
            <td  align="center"><%=person.getEmail()%></td>
            <td  align="center"><%=person.getWorkPlace()%></td>
            <td  align="center"><%=person.getPasswd()%></td>
            <td>
                <form action="UpdateServlet" method="post" onsubmit="return check(this);">
                    <input type="hidden" name="userName" value="<%=person.getUserName()%>">
                    <input type="text" name="changedName" size="9">
                    <input type="submit" value="修　改">
                </form>
            </td>
            <td align="center">
                    <form action="DeleteServlet" method="POST">
                        <a href="DeleteServlet?userName=<%=person.getUserName()%>">删除</a>
                    </form>
                </td>
        </tr>
        <%
                    }
                }
            %>
            </table>
            <br><br><br><br><br><br>
<center><a  href = "FindServlet">返回管理页面</a></center>
</body>
</html>