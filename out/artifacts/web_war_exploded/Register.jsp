<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.net.URLEncoder"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>注册页面</title>

<link rel="stylesheet" href="css/bootstrap-theme.css" type="text/css">

<link rel="stylesheet" href="css/bootstrap.css" type="text/css">

<link rel="stylesheet" href="css/Register.css" type="text/css">


</head>

<body>

	<div class="wrap" align="center">
		<h1 id="one">注册</h1>
		<div class="alert alert-danger alert-dismissable hide" align=center>注册失败！！！</div>
		<p id="p1" align="center">欢迎来访</p>
		<form class="form-inline" name="form1">
			<div class="form-group">
				<label for="exampleInputName2">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;姓&nbsp;&nbsp;名 &nbsp;</label> <input
					type="text" class="form-control" id="Name" placeholder="Jane Doe">
			</div>
			&nbsp; &nbsp; &nbsp;
			<div class="form-group">
				<label for="exampleInputEmail2">手机号&nbsp;</label> <input type="text"
					class="form-control" id="phone" placeholder="177*******1">
			</div>
			<br> <br>
			<div class="form-group">
				<label for="exampleInputEmail2">工作单位&nbsp;</label> <input
					type="text" class="form-control" id="workPlace"
					placeholder="**市**公司/学校">
			</div>
			&nbsp; &nbsp; &nbsp; &nbsp;

			<div class="form-group">
				<label for="exampleInputEmail2">邮箱&nbsp;&nbsp;&nbsp;&nbsp;</label> <input
					type="email" class="form-control" id="email"
					placeholder="jane.doe@example.com">
			</div>
			<br> <br>
			<div class="form-group">
				<label for="exampleInputEmail2">用&nbsp;户 &nbsp;名 &nbsp;</label> <input
					type="text" class="form-control" id="userName" name="userName"
					onblur="checkUser()" placeholder="字母或数字的组合">
			</div>
			&nbsp; &nbsp; &nbsp; &nbsp;
			<div class="form-group">
				<label for="exampleInputEmail2">密码&nbsp;&nbsp;&nbsp;</label> <input
					type="password" class="form-control" id="userPasswd"
					placeholder="需包含数字、小写字母与下划线">
			</div>
			<br> <br>
			<div class="form-group">
				<label for="exampleInputEmail2">确认密码 &nbsp;</label> <input
					type="password" class="form-control" id="userPasswd2"
					onblur="checkPwd()" placeholder="与密码保持一致">
			</div>
			&nbsp; &nbsp; &nbsp; &nbsp;
			<div class="form-group">
			
				<label for="exampleInputEmail2">验证码&nbsp;</label> <input type="text"
					class="form-control" id="executeWd" onblur="checkNotNull()"
					placeholder="验证码">

			</div>
			<br><br>
			
			<div class="form-group" align="center" >
               用户类型&nbsp;&nbsp;&nbsp;
                <label class="radio-inline"> <input type="radio"
                    name="inlineRadioOptions" id="userType" value="学生" >
                    学生
                </label> <label class="radio-inline"> <input type="radio"
                    name="inlineRadioOptions" id="userType" value="教师">
                    教师
                </label> <label class="radio-inline"> <input type="radio"
                    name="inlineRadioOptions" id="userType" value="管理员">
                    管理员
                </label> 
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               <img src="images/code.jpg" width="70" height="20">
            </div>
            <br> <br>
			<button type="button" class="btn btn-default" id="btn-resister">注册</button>
			&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
			&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
			&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
			&nbsp; &nbsp; &nbsp;
			<button class="btn btn-default" name="sign" onclick="copyTextB()">重置</button>

		</form>
		
		<br>
		<p align="center" style="font-size: 15px; color: orange">
			忘记密码？<a href="refindPassward.jsp">立即找回</a>
		</p>
		<p align="center" style="font-size: 15px; color: orange">
			已有账户？<a href="SignIn.jsp">去登陆</a>
		</p>

	</div>
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script>
		/* 鼠标特效 */
		var a_idx = 0;
		jQuery(document).ready(
				function($) {
					$("body").click(
							function(e) {
								var a = new Array("富强", "民主", "文明", "和谐", "自由",
										"平等", "公正", "法治", "爱国", "敬业", "诚信",
										"友善");
								var $i = $("<span></span>").text(a[a_idx]);
								a_idx = (a_idx + 1) % a.length;
								var x = e.pageX, y = e.pageY;
								$i.css({
									"font-size" : 18,
									"z-index" : 999,
									"top" : y - 20,
									"left" : x,
									"position" : "absolute",
									"font-weight" : "bold",
									"color" : "rgb(" + ~~(255 * Math.random())
											+ "," + ~~(255 * Math.random())
											+ "," + ~~(255 * Math.random())
											+ ")"
								});
								$("body").append($i);
								$i.animate({
									"top" : y - 180,
									"opacity" : 0
								}, 1800, function() {
									$i.remove();
								});
							});
				});
	</script>
	<script>
		$(document).ready(function() {
			$("#btn-resister").click(function() {
				$.post("RegisterServlet", {
					Name : $("#Name").val(),
					userName : $("#userName").val(),
					userPasswd : $("#userPasswd").val(),
					userPasswd2 : $("#userPasswd2").val(),
					phone : $("#phone").val(),
					email : $("#email").val(),
					workPlace : $("#workPlace").val(),
					userType : $("input[name='inlineRadioOptions']:checked").val()
				}, function(data) {
					alert("注册"+data);
					if (data == 200) {
						//注册成功
						$('.alert-danger').addClass('hide');
						window.location.href = "RegistSuccess.jsp";
					} else if (data == 401) {
						//注册失败！
						$('.alert-danger').removeClass('hide');
					} else if (data == 201) {
						$("#p1").html("用户名可用").css("color", "red");
					} else  if (data == 400){
						$("#p1").html("提交的密码不一致！").css("color", "red");
					}

				})
			});
		});

		function checkUser() {
			//$("#p1").html("用户名已被注册，请重新输入!").css("color", "red");

			$.post("RegisterServlet", {
				userName : $("#userName").val()
			}, function(data) {
				alert(data);
				if (data == 200) {
					$("#p1").html("注册成功！!").css("color", "green");
				} else if (data == 401) {
					//注册失败！
					$("#p1").html("用户名不可用！！").css("color", "red");
				} else if (data == 201) {
					$("#p1").html("用户名可用").css("color", "green");
				} else if (data == 400) {
					$("#p1").html("提交的密码不一致！").css("color", "red");
				}

			});
		};

		function checkExecute() {
			if (document.getElementById("executeWd").value == "") {
				$("#p1").html("验证码不能为空！").css("color", "red");
			} else if (document.getElementById("executeWd").value != "2xsd") {
				$("#p1").html("验证码有误！").css("color", "red");
			} else {
				$("#p1").html("验证码正确！").css("color", "green");
			}
		};

		function checkPwd() {
			/*if (!$("#userPasswd").val().equals($("#userPasswd2").val())) {
			    $("#p1").html("两次密码不一致！").css("color", "red");
			} else {
			    $("#p1").html("密码一致！").css("color", "green");
			}*/
			if (document.getElementById("userPasswd").value == ""
					&& document.getElementById("userPasswd2").value == "") {
				$("#p1").html("密码不能为空！").css("color", "red");
			} else if (document.getElementById("userPasswd").value != document
					.getElementById("userPasswd2").value) {
				$("#p1").html("两次密码不一致！").css("color", "red");
				//document.getElementById("p1").innerHTML = "   两次密码的输入不一致";
			} else {
				$("#p1").html("密码一致！").css("color", "green");
				//document.getElementById("p1").innerHTML = "   ";
			}
		};

		function copyTextB() {

			document.getElementById("userName").value = "";
			document.getElementById("userPasswd").value = "";
			document.getElementById("executeWd").value = "";
			userName = "";
			userPasswd = "";
		}

		function checkNotNull() {
			if (document.getElementById("Name").value == "") {
				$("#p1").html("姓名不能为空！").css("color", "red");
				return false;
			} else {
				if (!checkName(document.getElementById("Name").value)) {
					$("#p1").html("名字太长了！").css("color", "red");
					return false;
				} else {
					if (document.getElementById("phone").value == "") {
						$("#p1").html("手机号不能为空！").css("color", "red");
						return false;
					} else {
						if (!checkPhone(document.getElementById("phone").value)) {
							$("#p1").html("不是完整的11位手机号或者正确的手机号前七位！").css(
									"color", "red");
							return false;
						} else {
							if (document.getElementById("workPlace").value == "") {
								$("#p1").html("工作单位不能为空！").css("color", "red");
								return false;
							} else {
								if (!checkWorkPlace(document
										.getElementById("workPlace").value)) {
									return false;
								} else {
									if (document.getElementById("email").value == "") {
										$("#p1").html("请输入邮箱！").css("color",
												"red");
										return false;
									} else {
										if (!checkEmail(document
												.getElementById("email").value)) {
											$("#p1").html("邮箱格式有误！").css(
													"color", "red");
											return false;
										} else {
											if (document
													.getElementById("userName").value == "") {
												$("#p1").html("请输入用户名！").css(
														"color", "red");
												return false;
											} else {
												if (!checkUserName(document
														.getElementById("userName").value)) {
													return false;
												} else {

													if (!checkPasswd(document
															.getElementById("userPasswd2").value)) {
														$("#p1")
									                    .html(
									                            "密码安全度低！")
									                    .css(
									                            "color",
									                            "red");
														return false;
													} else {
														if (document
																.getElementById("executeWd").value == "") {
															$("#p1")
																	.html(
																			"请输入验证码！")
																	.css(
																			"color",
																			"red");
															return false;
														} else if (document
																.getElementById("executeWd").value != "2xsd") {
															$("#p1")
																	.html(
																			"输入的校验码不匹配！")
																	.css(
																			"color",
																			"red");
															return false;
														} else {
															$("#p1")
																	.html(
																			"注册信息全部正确！")
																	.css(
																			"color",
																			"green");
															return true;
														}
													}

												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}

		function checkPasswd(pwd) {
			var reg = /^[\w]{6,16}$/i; //判断密码格式是否正确
			var reg1 = /[a-zA-Z]/; //字母
			var reg2 = /\d/; //数字
			var reg3 = /_/; //下划线
			if (reg.test(pwd)) { //密码格式正确的情况下
				if (reg1.test(pwd) && reg2.test(pwd) && reg3.test(pwd)) {
					//高级密码
					//alert("密码安全度高级");
					$("#p1")
                                                                    .html(
                                                                            "密码安全度高级！")
                                                                    .css(
                                                                            "color",
                                                                            "green");
					return true;
				} else if (reg1.test(pwd) && reg2.test(pwd)) {
					//中级密码
					//alert("密码安全度中级");
					$("#p1")
                    .html(
                            "密码安全度中级！")
                    .css(
                            "color",
                            "green");
					return true;
				} else{
					//低级密码
					//alert("密码安全度低");
					$("#p1")
                    .html(
                            "密码安全度低！")
                    .css(
                            "color",
                            "red");
					return false;
				} 
			}
			return false;
		}

		function checkName(name) {
			if (name.length > 20) {
				return false;
			} else {
				var objExp = /[\u4E00-\u9FA5]{2,}/;
				if (!objExp.test(name)) {
					$("#p1").html("用户名需在1个字符以上！").css("color", "red");
					return false;
				}

			}
			return true;

		}

		function checkWorkPlace(workPlace) {
			if (workPlace.length > 40) {
				$("#p1").html("工作单位太长了！").css("color", "red");
				return false;
			} else {
				var objExp = /[\u4E00-\u9FA5]{2,}/;
				if (objExp.test(workPlace))
					return true;
				else {
					$("#p1").html("工作单位需在2个字符以上！").css("color", "red");
					return false;
				}
			}
		}

		function checkUserName(name) {
			if (name.length > 20) {
				$("#p1").html("用户名太长了！").css("color", "red");
				return false;
			}
			return true;
		}

		function checkPhone(sMobile) {
			if (!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(sMobile))) {
				sMobile.focus();
				return false;
			}
			return true;
		}

		function checkEmail(email) {
			return email.length > 6
					&& /^[\w\-\.]+@[\w\-\.]+(\.\w+)+$/.test(email);
		}
	</script>

</body>

</html>