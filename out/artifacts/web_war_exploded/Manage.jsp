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
<link rel="stylesheet" href="css/Manage.css" type="text/css">
<link rel="stylesheet" href="css/bootstrap.min.css">
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

		<div class="nav_2">
			<button type="button" class="btn btn-default" onclick="showOut();">退出</button>
		</div>
		<div class="welcome">
			欢迎<%=thisUserName%>先生！
		</div>
		<div id="nav_3"></div>
	</div>


	<div class="panel panel-primary">
		<div class="panel-body">
			<div class="container">
				<div class="row" style="margin-bottom: 10px">
					<div class="col-md-12">
						<form class="form-inline" role="form">
							<div class="form-group">
								<input name="search" id="search" type="search"
									class="form-control" placeholder="用户名/姓名" />
							</div>

							<div class="form-group"></div>
							<button type="button" class="btn btn-default" id="searchUser"
								onclick="ShowUsers();">查询</button>
							<button type="button" class="btn btn-default" id="addUser"
								onclick="showAddModal();">添加</button>

						</form>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<table class="table table-bordered table-hover">
							<thead>
								<tr>
									<th>序号</th>
									<th>用户名</th>
									<th>姓名</th>
									<th>用户类型</th>
									<th>手机号</th>
									<th>邮箱</th>
									<th>所在单位</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody id="tb_user">
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
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


	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">添加用户</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" method="POST" name="form1" id="form1">
						<div class="form-group">
							<label for="ausername" class="col-sm-4 control-label">用户名称：</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="userName"
									name="userName" placeholder="请输入用户名称">
							</div>
						</div>
						<div class="form-group">
							<label for="apassword" class="col-sm-4 control-label">用户密码：</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="passwd"
									name="passwd" placeholder="请输入密码">
							</div>
						</div>
						<div class="form-group">
							<label for="qpassword" class="col-sm-4 control-label">确认密码：</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="qpassword"
									name="qpassword" placeholder="请确认密码">
							</div>
						</div>
						<div class="form-group">
							<label for="password" class="col-sm-4 control-label">用户类型：</label>
							<div class="col-sm-8">
								<div class="radio-inline">
									<label> <input type="radio" name="userType"
										id="optionsRadios1" value="1"> 学生
									</label>
								</div>
								<div class="radio-inline">
									<label> <input type="radio" name="userType"
										id="optionsRadios2" value="2"> 教师
									</label>
								</div>
								<div class="radio-inline ">
									<label> <input type="radio" name="userType"
										id="optionsRadios3" value="3"> 管理员
									</label>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="truename" class="col-sm-4 control-label">真实姓名：</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="name" name="name"
									placeholder="请输入真实姓名">
							</div>
						</div>
						<div class="form-group">
							<label for="dept" class="col-sm-4 control-label">用户部门：</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="workPlace"
									name="workPlace" placeholder="请输入用户部门">
							</div>
						</div>
						<div class="form-group">
							<label for="tel" class="col-sm-4 control-label">用户电话：</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="phone" name="phone"
									placeholder="请输入用户电话">
							</div>
						</div>
						<div class="form-group">
							<label for="email" class="col-sm-4 control-label">用户邮箱：</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="email" name="email"
									placeholder="请输入用户邮箱">
							</div>
							<input type="hidden" id="id" name="id">
						</div>
					</form>

				</div>
				<div class="modal-footer" id = "boot-box">
					<button type="reset" class="btn btn-default" onclick="ClearInfo();">清空重填
					</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<button type="button" class="btn btn-primary" onclick="SaveUser();">
						保存</button>
				</div>
			</div>
		</div>
	</div>


	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script>
		var flag = "add";

		function showAddModal() {
			flag = "add";
			$(".modal-title").text("添加用户");

			var form = $("#form1");
			form[0].reset();
			$("input[name='userType']:first").attr('checked', 'true');
		    
			$("#myModal").modal();
		}

		function showEditModal(val) {
			flag = "edit";

			alert("该用户的数据库表中的id:"+val);
			$(".modal-title").text("修改用户信息");

			$.getJSON("FindServlet?id=" + val, function(result) {
				//  alert(result);
				if (result.length > 0) {
					$("#userName").val(result[0].userName);
					$("#name").val(result[0].name);
					$("#phone").val(result[0].phone);
					$("#email").val(result[0].email);
					$("#workPlace").val(result[0].workPlace);
					$("#passwd").val(result[0].passwd);
					$("#qpassword").val(result[0].passwd);
					$("#id").val(result[0].id);
					// alert(result[0].usertype);
					setUserType(result[0].userType);
				}
			});

			$("#myModal").modal();
		}

		function setUserType(value) {
			//alert("setUserType:"+value);
			var radios = $("input[name='userType']");

			for (var i = 0; i < radios.length; i++) {
				if (value == radios[i].value) {
					radios[i].checked = true;
				}
			}
		}

		function userTypee(val) {
			if (val == '1') {
				return '学生';
			} else if (val == '2') {
				return '教师';
			} else if (val == '3') {
				return '管理员';
			} else {
				return "未知";
			}
		}

		function SaveUser() {
			if (flag == "add") {
				alert("保存添加信息！");
				SaveAddUser();
			} else {
				alert("保存修改信息！");
				SaveEditUser();
			}
		}

		function sleep(numberMillis) {
			var now = new Date();
			var exitTime = now.getTime() + numberMillis;
			while (true) {
				now = new Date();
				if (now.getTime() > exitTime)
					return;
			}
		}

		function DeleteUser(id) {
			$.post("DeleteServlet?id=" + id, function(data) {
				if (data == 1) {
					sleep(200);
					ShowUsers();
				} else {

				}
			});
		}

		function SaveAddUser() {
			var postData = $("#form1").serialize();

			$.post("AddUserServlet", postData, function(data) {
				//alert(data);
				if (data > 0) {
					$('#myModal').modal('hide');
					ShowUsers();
				} else if (data == "-1") {
					alert("添加信息，请检查信息是否正确！"+data);
				}
			});
		}

		function SaveEditUser() {
			var postData = $("#form1").serialize();
			
			$.post("UpdateServlet", postData, function(data) {
				if (data == "1") {
					$('#myModal').modal('hide');
					ShowUsers();
				} else {
					alert("修改失败，请检查信息是否正确！"+data);
				}
				
			});
		}

		function ShowUsers() {
			sleep(500);
			var searchText = $("#search").val();
			$("#tb_user").html("");
			var a = 0;

			$
					.getJSON(
							"FindServlet?search=" + searchText,
							function(result) {
								var tbhtml = "";
								$
										.each(
												result,
												function(i, field) {
													if (i % 2 == 0) {
														tbhtml += "<tr class='success'>"
													} else {
														tbhtml += "<tr class='warning'>"

													}
													tbhtml += "<td>" + (i + 1)
															+ "</td>";
													tbhtml += "<td>"
															+ field.userName
															+ "</td>";
													tbhtml += "<td>"
															+ field.name
															+ "</td>";
													tbhtml += "<td>"
															+ userTypee(field.userType)
															+ "</td>";
													tbhtml += "<td>"
															+ field.phone
															+ "</td>";
													tbhtml += "<td>"
															+ field.email
															+ "</td>";
													tbhtml += "<td>"
															+ field.workPlace
															+ "</td>";
													a =parseInt(field.id);
													tbhtml += "<td><button type='button' class='btn btn-primary btn-xs' onclick='showEditModal("
															+ a
															+ ")'>编辑</button>\n<button type='button' class='btn btn-danger btn-xs' onclick='DeleteUser("
															+ a
															+ ")'>删除</button></td>";

													tbhtml += "</tr>";

													//$("div").append(field + " ");
												});

								$("#tb_user").html(tbhtml);
							});

		}

		$(document).ready(function() {

			ShowUsers();

		});

		function ClearInfo() {

			document.getElementById("userName").value = "";
			document.getElementById("passwd").value = "";
			document.getElementById("qpassword").value = "";

			$("[name='name']").val("");
			$("#workPlace").val("");

			document.getElementById("phone").value = "";
			document.getElementById("email").value = "";

		}

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
							(RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k])
									.substr(("" + o[k]).length)));
			return fmt;
		}
		setInterval(
				"document.getElementById('nav_3').innerHTML = (new Date()).format('yyyy-MM-dd hh:mm:ss');",
				1000);
	</script>
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
</body>

</html>