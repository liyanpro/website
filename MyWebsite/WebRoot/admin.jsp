<%@ page language="java"  pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>儿童免疫接种管理系统登陆页面</title>
<script type="text/javascript">		 
function checkLogin()
{
    var username = document.getElementById("adname");

	// 用户名必须输入
	if(username.value == "")
	{
		alert("必须输入用户名!");
		return false;
	}
	var password = document.getElementById("adpassword");
		 // 密码必须输入
	if(password.value == "")
	{
		alert("必须输入密码!");
		return false;
	}
	else
		return true;
}  
	</script>
<link rel="stylesheet" type="text/css" href="css/admin.css" />
<style type="text/css">
.download{margin:20px 33px 10px;*margin-bottom:30px;padding:5px;border-radius:3px;-webkit-border-radius:3px;-moz-border-radius:3px;background:#e6e6e6;border:1px dashed #df0031;font-size:14px;font-family:Comic Sans MS;font-weight:bolder;color:#555}
.download a{padding-left:5px;font-size:14px;font-weight:normal;color:#555;text-decoration:none;letter-spacing:1px}
.download a:hover{text-decoration:underline;color:#36F}
.download span{float:right}
</style>
</head>

<body>
<div class="main">
	<div class="header hide"> 网站后台管理系统 </div>
	<div class="content">
		<div class="title hide">管理登录</div>
		<form name="login_form" action="AdminLogin" onsubmit="return checkLogin();" method="post">
			<fieldset>
				<div class="input">
					<input class="input_all name" name="adname" id="adname" placeholder="管理员ID" 
					   onfocus="this.className='input_all name_now';" onBlur="this.className='input_all name'" type="text"  maxLength="24" />
					<font color="#FF0000">${requestScope.userError}</font> 
				</div>
				<div class="input">
					<input class="input_all password" name="adpassword" id="adpassword" type="password"  placeholder="密码" 
					    onfocus="this.className='input_all password_now';" onBlur="this.className='input_all password'" maxLength="24" />
					<font color="#FF0000">${requestScope.passwordError}</font>
				</div>
				<div class="enter">
					<input class="button hide" name="submit" type="submit"  value="登录" />
				</div>
			</fieldset>
		</form>
	</div>
</div>
</body>
</html>
