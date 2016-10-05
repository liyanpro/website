<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>医生登录界面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/login.css">

  </head>
  <script type="text/javascript">
  window.onload = function() {
	    var btn1 = document.getElementById('btn1');
	    btn1.onmouseover = function() {
	        this.style.color = '#FF0033';
	    }
	    btn1.onmouseout = function() {
	        this.style.color = '#3299cc';
	    }
	}
  function checkLogin()
{
    var username = document.getElementById("dusername");

	// 用户名必须输入
	if(username.value == "")
	{
		alert("必须输入用户名!");
		return false;
	}
	var password = document.getElementById("dpassword");
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
 <body id="userlogin_body">
    <!--网站顶部开始-->
    <div id="header" >
    <div class="wrapper">
        <div id="logo">
           <img src="images/user/register_login_logo.png">
        </div>
        <div class="top_tool">
            <a href="register.jsp" title="返回首页" style="font-size:17px; cursor:pointer;color: #0c99d3;">返回首页</a></div>
        <div class="clear">
        </div>
    </div>
    </div>
    <!--网站顶部结束-->
  <div class="wrapper">
   <div class="doc_login_contant">
        <form name = "login_form" action="DocLogin" onsubmit="return checkLogin();" method="post">	        
            <div id="user_login">
            <dl>
                <dd id="user_main">
                    <ul>
                        <li class="user_main_name"><label>
                            职工号：</label>
                            <input name="dusername" maxlength="20" id="dusername" tabindex="1" class="username" type="text">
                             &nbsp;&nbsp;<font color="#FF0000">${requestScope.userError}</font> 
                        </li>
                        <li class="user_password"><label>
                            密 码：</label>
                            <input name="dpassword" id="dpassword" tabindex="2" class="userpass" type="password">
                             &nbsp;&nbsp;<font color="#FF0000">${requestScope.passwordError}</font> 
                        </li>   
                        <li class="login">
                            <input  name="login" id="btn1" value="登   录" tabindex="4" type="submit" style=" cursor:pointer;">
                         </li>
                    </ul>
                </dd>
            </dl>
        </div>
    </form>
  </div>
 </div>
  </body>
</html>
