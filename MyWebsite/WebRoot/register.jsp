<%@ page language="java" pageEncoding="UTF-8"%>
<html>
	<head>
	 <link  type="text/css" rel="stylesheet" href="css/register.css"/>
     <title>用户注册</title>
        <script type="text/javascript">
        window.onload = function() {
    	    var btn1 = document.getElementById('btn1');
    	    var btn2 = document.getElementById('btn2');
    	    btn1.onmouseover = function() {
    	        this.style.color = '#FF0033';
    	    }
    	    btn1.onmouseout = function() {
    	        this.style.color = '#3299cc';
    	    }
    	    btn2.onmouseover = function() {
    	        this.style.color = '#FF0033';
    	    }
    	    btn2.onmouseout = function() {
    	        this.style.color = '#3299cc';
    	    }
    	}
        function refresh()
        {
            var img = document.getElementById("img_validation_code");
            img.src = "validation_code?" + Math.random();            
        }
		function checkEmail(Email)
		{ 
    		// 验证mail
    		var email = Email.value;
    		var pattern = /^([a-zA-Z0-9._-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
   			flag = pattern.test(email);
   			if(!flag)
    		{
        		alert("email格式不正确!"); 
        		return false;
        	}
   			else
   				return true;
        }
        function checkRegister()
		{
		    var username = document.getElementById("username");

    		// 用户名必须输入
    		if(username.value == "")
    		{
        		alert("必须输入用户名!");
        		return false;
    		}
    		var password = document.getElementById("password");
   			 // 密码必须输入
   			if(password.value == "")
    		{
        		alert("必须输入密码!");
        		return false;
    		}
    		
    		var repassword = document.getElementById("repassword");
    		
    		// 两次输入的密码必须一致
    		if(password.value != repassword.value)
    		{
       			alert("输入的密码不一致!");
        		return false;
    		}
 			var email = document.getElementById("email");
    		//  验证E-mail
    		if(email.value != "")
    		{
    		    if(!checkEmail(email)) return false;
    		}
    		 var name = document.getElementById("name");
     		// 姓名必须输入
     		if(name.value == "")
     		{
         		alert("必须输入真实姓名!");
         		return false;
     		}
     		 var mobile = document.getElementById("mobile");
     		// 手机号必须输入
     		if(mobile.value == "")
     		{
         		alert("手机号不能为空!");
         		return false;
     		}
     		 var birthplace = document.getElementById("birthplace");
      		// 手机号必须输入
      		if(birthplace.value == "")
      		{
          		alert("必须输入家庭住址!");
          		return false;
      		}
    		var validation_code = document.getElementById("validation_code");
    		if(validation_code.value == "")
    		{
    		    alert("验证码必须输入!");
        		return false;
    		}
    		else
    			return true;
    		
		}  
        </script>    
	</head>
	<body>
	<!--网站顶部开始-->
    <div id="header">
    <div class="wrapper">
           <img src="images/user/register_login_logo.png">
        <div class="top_tool">
            <a href="index.html" title="返回首页" style="font-size:17px;color: #0c99d3;">返回首页</a></div>
    </div>
    </div>
    <!-- 顶部结束 -->
	<div class="Container">
	  <div class="containerheader"><span class="conheader">用户注册</span></div>
	  <div class="content">
		<form name="register_form"  action="UserRegister"  method="post">
             <div class="name_list"><lable class="lable">用户名：</lable>
        			<input class="list" type="text" tabindex="1" id = "username" name="username" size="30" maxLength="30"/>
			 </div>
    		
             <div class="name_list"><lable class="lable">密 码： </lable>
                  <input class="list" type="password" tabindex="2" id="password" name="password" size="30" maxLength="30" />
             </div>		
  
             <div class="name_list"><lable class="lable">请再次输入密码：</lable>
             
                  <input class="list" type="password" tabindex="3" id="repassword" name="repassword" size="30" maxlength="30"/>
             </div>
   
             <div class="name_list "><lable class="lable"> 邮箱：</lable>
                  <input class="list" type="text" tabindex="4" id="email" name="email" size="30" maxlength="30"/>
             </div>
             <div class="name_list "><lable class="lable"> 真实姓名：</lable>
                  <input class="list" type="text" tabindex="5" id="name" name="name" size="30" maxlength="30"/>
             </div>
             <div class="name_list "><lable class="lable"> 性别：</lable>&nbsp;&nbsp;&nbsp;
                  <input  name="gender" tabindex="6" type="radio" value="男" id="man" />男&nbsp;&nbsp;
                  <input  name="gender" tabindex="7" type="radio" value="女"  id="woman"/>女
             </div>
             <div class="name_list "><lable class="lable"> 手机号：</lable>
                  <input class="list" type="text" tabindex="8" id="mobile" name="mobile" size="30" maxlength="30"/>
             </div>
             <div class="name_list "><lable class="lable"> 家庭电话：</lable>
                  <input class="list" type="text" tabindex="9" id="homephone" name="homephone" size="30" maxlength="30"/>
             </div>
             <div class="name_list "><lable class="lable"> 家庭住址：</lable>
                  <input class="list" type="text" tabindex="10" id="birthplace" name="birthplace" size="30" maxlength="30"/>
             </div>
             <div class="name_list"> <lable class="lable">验证码：</lable>
                  <input class="list" type="text" tabindex="11" id="validation_code" name="validation_code" style="width:70px; size="30" maxlength="30"/>
                  <img id="img_validation_code" src="validation_code" onclick="refresh()"/>
             </div>
             <div class="input_button" >
                 <input class="input_register" id="btn1" type="submit" value="注  册" style=" cursor:pointer;" onclick="return checkRegister();"/>&nbsp;&nbsp;&nbsp;
                 <input class="input_login" id="btn2" type="submit" value="登  录" style=" cursor:pointer;" name="login" />
             </div>	
	  </form>
     </div>
	</div>
 </body>
</html>
