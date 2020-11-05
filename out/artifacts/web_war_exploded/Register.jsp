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
  <title>注册-3180911020</title>
  <style>
    .wrap {
      background-color: rgb(121, 151, 38);
      background-image:
              url("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1600707673374&di=72c4673e4f52e90c138c0e14ff3b6a2f&imgtype=0&src=http%3A%2F%2Fimage.huahuibk.com%2Fuploads%2F20190130%2F19%2F1548847674-AkIBarxYdT.jpg");
      background-repeat: repeat-x;
      height: 600px;
    }

    #one {
      text-align: center;
      color: black;
    }
  </style>
  <script>


    function checkNotNull() {
      if (myForm.name.value == "") {
        alert("姓名不能为空！");
        return false;
      } else {
        if (!checkName(myForm.name.value)) {
          return false;
        } else {
          if (myForm.phone.value == "") {
            alert("手机号不能为空！");
            return false;
          } else {
            if (!checkPhone(myForm.phone.value)) {
              return false;
            } else {
              if (myForm.workPlace.value == "") {
                alert("工作单位不能为空！");
                return false;
              } else {
                if (!checkWorkPlace(myForm.workPlace.value)) {
                  return false;
                } else {
                  if (myForm.email.value == "") {
                    alert("请输入邮箱！");
                    return false;
                  } else {
                    if (!checkEmail(myForm.email.value)) {
                      return false;
                    } else {
                      if (myForm.userName.value == "") {
                        alert("请输入用户名！");
                        return false;
                      } else {
                        if (!checkName(myForm.name.value)) {
                          return false;
                        } else {
                          if (myForm.passwd.value == "") {
                            alert("请输入密码！");
                            return false;
                          } else if (myForm.rePasswd.value == "") {
                            alert("请确认密码！");
                            return false;
                          } else if (myForm.passwd.value != myForm.rePasswd.value) {
                            alert("输入的密码不匹配！");
                            return false;
                          } else {
                            if (!checkPasswd(myForm.rePasswd.value)) {
                              return false;
                            } else {
                              if (myForm.vertification.value == "") {
                                alert("请输入验证码！");
                                return false;
                              } else if (myForm.vertification.value != "2xsd") {
                                alert("输入的校验码不正确！");
                                return false;
                              } else {
                                alert("正在处理，稍等！");
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
    }

    function checkPasswd(pwd) {
      var reg = /^[\w]{6,16}$/i; //判断密码格式是否正确
      var reg1 = /[a-zA-Z]/; //字母
      var reg2 = /\d/; //数字
      var reg3 = /_/; //下划线
      if (reg.test(pwd)) { //密码格式正确的情况下
        if (reg1.test(pwd) && reg2.test(pwd) && reg3.test(pwd)) {
          //高级密码
          alert("密码安全度高级");
          return true;
        } else if (reg1.test(pwd) && reg2.test(pwd)) {
          //中级密码
          alert("密码安全度中级");
          return true;
        } else if (reg1.test(pwd) || reg2.test(pwd)) {
          //低级密码
          alert("密码安全度低");
          return false;
        } else if (!reg.test(pwd)) {
          alert("密码格式不对！");
          return false;
        }
      }
    }

    function checkName(name) {
      if (name.length > 20) {
        alert("名字太长了！");
        return false;
      } else {
        return true;
      }
    }

    function checkWorkPlace(workPlace) {
      if (workPlace.length > 20) {
        alert("工作单位太长了！");
        return false;
      } else {
        var objExp = /[\u4E00-\u9FA5]{2,}/;
        if (objExp.test(workPlace))
          return true;
        else {
          alert("工作单位需在2个字符以上");
          return false;
        }
      }
    }

    function checkUserName(name) {
      if (name.length > 20) {
        alert("名字太长了！");
        return false;
      } else {
        var objExp = /[\u4E00-\u9FA5]{2,}/;
        alert("姓名长度需在2个字符以上");
        return objExp.test(name);
      }
    }

    function checkPhone(sMobile) {
      if (!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(sMobile))) {
        alert("不是完整的11位手机号或者正确的手机号前七位");
        sMobile.focus();
        return false;
      }
      return true;
    }

    function checkEmail(email) {
      return email.length > 6 && /^[\w\-\.]+@[\w\-\.]+(\.\w+)+$/.test(email);
    }


  </script>
</head>

<body>

<div class="wrap">
  <h1 id="one">注册</h1>
  <form action="RegisterServlet" method="POST" name="myForm"
        onsubmit="return checkNotNull();">
    <table width="420" border="0" align="center" id="info">
      <tr>
        <td align="center" valign="center">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
        <td><input name="name" type="text"></td>
      </tr>
      <tr>
        <td align="center" valign="center">手&nbsp;&nbsp;机&nbsp;&nbsp;号：</td>
        <td><input name="phone" type="text"></td>
      </tr>
      <tr>
        <td align="center" valign="center">工作&nbsp;单位：</td>
        <td><input name="workPlace" type="text"></td>
      </tr>
      <tr>
        <td align="center" valign="center">邮&nbsp;箱：</td>
        <td><input name="email" type="text"></td>
      </tr>
      <tr>
        <td align="center" valign="center">用&nbsp;户&nbsp;名：</td>
        <td><input name="userName" type="text"></td>
      </tr>
      <tr>
        <td align="center">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
        <td><input name="passwd" type="password" value="666888aA_"></td>
      </tr>
      <tr>
        <td align="center">确认密码：</td>
        <td><input name="rePasswd" type="password" value="666888aA_"></td>
      </tr>
      <tr>
        <td align="center">验&nbsp;&nbsp;证&nbsp;码：</td>
        <td><input name="vertification" type="text"></td>
        <td><img src="images/code.jpg" width="70" height="20"></td>
      </tr>
      <tr>
        <td align="center">用户类型：</td>
        <td align="center">学生<input name="userType" type="radio"
                                    class="noborder" value="学生" checked> &nbsp;&nbsp;教师 <input
                name="userType" type="radio" class="noborder" value="教师">
          &nbsp;&nbsp;管理员 <input name="userType" type="radio"
                                 class="noborder" value="管理员">
        </td>
      </tr>
      <tr>
        <td align="center"><input name="Button" type="submit"
                                  value="注册"> <!--<input name="Submit" type="submit" value="登录">-->
        </td>
        <td align="center"><input name="Reset" type="reset" value="重填">
        </td>
      </tr>
    </table>
    <center>
      <p>
        忘记密码？<a href="refindPassward.jsp">立即找回</a>
      </p>
      <p>
        已有账户？<a href="SignIn.jsp">去登陆</a>
      </p>
    </center>
  </form>
</div>
</body>

</html>