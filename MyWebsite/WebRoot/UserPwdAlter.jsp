<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改密码</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/master.css"/>
    <link rel="stylesheet" type="text/css" href="css/frame.css"/>
    <script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>

  </head>
  <script type="text/javascript">
    function check(){
    	var oldpwd=document.getElementById("oldpwd");
    	var newpwd=document.getElementById("newpwd");
    	var againpwd=document.getElementById("againpwd");
    	if(oldpwd.value==""||oldpwd.value==null){
    		alert("原密码不能为空！");
    		return false;
    	}
    	else if(newpwd.value==""||newpwd.value==null)){
    		alert("新密码不能为空！");
    		return false;
    	}
    	else if(againpwd.value==""||againpwd.value==null)){
    		alert("请再次输入新密码！");
    		return false;
    	 }
    	else 
    		return true;
    }
  </script>
   <body class="frameBody">
<div class="tableContainer">	
	<div id="mainContent" style="width:100%; height:100%; background:#fff none repeat scroll 0% 0%; " class="tablePanel"> 
		<div class="navInfo"><span  style="background:url(images/test.png) -300px -80px no-repeat; width:57px; height:57px; float:left; "></span><div class="navInfoDiv"><span>修改密码</span></div></div>
		<div class="clearfloat"></div>
		<div class="editPanel" style="padding-top:7px;">
           <!-- 用户密码修改 -->
           <form name="useralter" action="UserPwdAlter" onsubmit="return check();" method="post">
            <div class="row">
                <div class="label">旧密码：</div>
                <div class="field">
                    <input type="text" id="oldpwd" name="oldpwd" class="editor"  maxlength="20" value=""/>&nbsp;&nbsp;<font color="#FF0000">${requestScope.passwordError}</font> 
                </div>
            </div>
            <div class="row">
                <div class="label">新密码：</div>
                <div class="field">
                    <input type="text" id="newpwd" name="newpwd" class="editor"  maxlength="20" value=""/>
                </div>
                <div class="err">
                    <div id="mobileErr"></div>
                </div>
            </div>
            <div class="row">
                <div class="label">确认密码：</div>
                <div class="field">
                    <input type="text" id="againpwd" name="againpwd" class="editor" maxlength="20" value=""/>&nbsp;&nbsp;<font color="#FF0000">${requestScope.NewpasswordError}</font>
                </div>
                <div class="err">
                    <div id="birthplaceErr"></div>
                </div>
            </div>
            <div class="row" style="margin-left:102px">
                <input type="submit" id=bnt2 class="bnt2" value="修 改" style="width:100px; height:25px; border:1px solid #999; background:#fff; cursor:pointer;" />
            </div>
           </form>
		</div>
	<div class="clearfloat"></div>
<div style="height:40px;">	
</div>
	</div>
</div>	
</body>
</html>
