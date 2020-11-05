<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" errorPage="ManageError.jsp"%>

<%@page import=" java.util.List"%>
<%@page import="exercise.Person"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>管理信息</title>
<style>
#one {
	color: #1f160e;
	padding-inline-start: 5px;
}

.two {
	background-color: rgb(59, 59, 190);
}

.wrap {
	border-radius: 10px;
	height: 50px;
	padding-top: 10px;
	font-family: 宋体;
	font-size: 25px;
	color: white;
	background-color: rgb(7, 175, 7);
}

.nav_1 {
	float: left;
	margin-left: 10px;
	width: 120px;
}

.nav_2 {
	float: left;
	margin-left: 100px;
	height: 20px;
}

.welcome {
	float: left;
	margin-left: 100px;
	height: 30px;
}

#nav_3 {
	float: left;
	margin-left: 400px;
	height: 25px;
	margin-top: auto;
}

.body {
	border-radius: 10px;
	margin-top: 5px;
	background-color: rgb(214, 151, 91);
	padding-bottom: 10px;
	padding-top: 5px;
}

.fooster {
	font-family: 'Times New Roman', Times, serif;
	text-align: center;
	color: aliceblue;
	margin-top: 5px;
	padding-top: 10px;
	padding-bottom: 10px;
	background-color: rgb(66, 66, 61);
	border-radius: 10px;
}
</style>
<script>
	function checkPasswd() {
		var txt;
		if (confirm("确认修改密码？")) {
			alert("重置密码成功！");
		} else {
			alert("已取消修改！");
		}
		//document.getElementById("demo").innerHTML = txt;
	}

	function checkInfo() {

		var txt;
		if (confirm("确认修改？")) {
			alert("修改成功！");
		} else {
			alert("已取消！");
		}
		//document.getElementById("demo").innerHTML = txt;
	}
	/*
	 function checkDel() {

	 var txt;
	 if (confirm("确认删除？")) {
	 alert("删除成功！");
	 window.location.href='AddPeople.jsp';
	 } else {
	 alert("删除取消！");
	 }
	 //document.getElementById("demo").innerHTML = txt;
	 }
	 */
	function getTime() {
		setInterval(
				"document.getElementById('datetime').innerHTML=new Date().toLocaleString();",
				1000);
	}
	function showOut() {
		alert("退出已执行！");
		window.location.href = 'ManageOut.jsp';
	}
	function addPeople() {
		window.location.href = 'AddPeople.jsp';
	}
	function check(form) {
		with (form) {
			if (UserName.value == "") {
				alert("请输入更新用户名！");
				return false;
			}
			if (isNaN(UserName.value)) {
				alert("格式错误！");
				return false;
			}
			return true;

		}
	}
</script>
</head>

<body>
	<%
		session.setMaxInactiveInterval(600);
		response.setHeader("refresh", "601");//每隔61秒刷新一次

		request.setCharacterEncoding("UTF-8"); //post方法的防止中文乱码的方法

		String thisUserName = (String) session.getAttribute("userName");

		if (thisUserName != null) {
	%>

	<div class="wrap">
		<div class="nav_1">用户管理</div>
		<script>
			Date.prototype.format = function(fmt) {
				var o = {
					"y+" : this.getFullYear, //年
					"M+" : this.getMonth() + 1, //月份
					"d+" : this.getDate(), //日
					"h+" : this.getHours(), //小时
					"m+" : this.getMinutes(), //分
					"s+" : this.getSeconds()
				//秒
				};
				if (/(y+)/.test(fmt))
					fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "")
							.substr(4 - RegExp.$1.length));
				for ( var k in o)
					if (new RegExp("(" + k + ")").test(fmt))
						fmt = fmt.replace(RegExp.$1,
								(RegExp.$1.length == 1) ? (o[k])
										: (("00" + o[k])
												.substr(("" + o[k]).length)));
				return fmt;
			}
			setInterval(
					"document.getElementById('nav_3').innerHTML = (new Date()).format('yyyy-MM-dd hh:mm:ss');",
					1000);
		</script>
		<div class="nav_2">
			<button type="button" onclick="showOut();">退出</button>
		</div>
		<div class="welcome">
			欢迎<%=thisUserName%>先生！
		</div>
		<div id="nav_3"></div>
	</div>
	<div class="body">
		<h1 id="one">管理</h1>

		<form action="Search" method="POST" onsubmit="return check(this);">
			<input name="UserName" ,type="text" size="20"> <input
				name="Search" , type="submit" value="查找"> <input
				name="Reset" , type="reset" value="重新填写">
				<input  name="Add" , type="button" onclick="addPeople();"  value="增加信息">
		</form>




		<center>
			<h2>所有学生信息</h2>
		</center>

		<table width="900" border="2" align="center">

			<tr align="center">
				<td class="two" align="center">用户名&nbsp;</td>
				<td class="two" align="center">姓名&nbsp;</td>
				<td class="two" align="center">用户类型&nbsp;</td>
				<td class="two" align="center">手机号&nbsp;</td>
				<td class="two" align="center">邮箱&nbsp;</td>
				<td class="two" align="center">所在单位&nbsp;</td>
				<td class="two" align="center">密码&nbsp;</td>
				<td class="two" align="center">操作&nbsp;</td>

			</tr>
			<%
				//获取学生信息集合
					List<Person> list = (List<Person>) request.getAttribute("listAll");
					if (list == null || list.size() < 1) {
						//out.print("没有数据！");
					} else {
						// 遍历图书集合中的数据
						for (Person person : list) {
			%>
			<tr align="center" bgcolor="white">
				<td align="center"><%=person.getUserName()%></td>
				<td align="center"><%=person.getName()%></td>
				<td align="center"><%=person.getUserType()%></td>
				<td align="center"><%=person.getPhone()%></td>
				<td align="center"><%=person.getEmail()%></td>
				<td align="center"><%=person.getWorkPlace()%></td>
				<td align="center"><%=person.getPasswd()%></td>
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

	</div>
	<div class="fooster">
		<p>Shenxinyuan@xaut.edu.cn</p>
		<p>Copyright©2020 沈新源</p>
		<p>信息部备案号：******</p>
		<p>******版权所有</p>
	</div>
	<%
		} else {
			float x = 1 / 0;
		}
	%>
</body>

</html>