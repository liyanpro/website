<%@ page language="java"  pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ page import="com.mywebsite.bean.DocInfo,com.mywebsite.Dao.LoginDao,java.util.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>医生信息修改</title>
    
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
    	var name=document.getElementById("drelname");
    	var mobile=document.getElementById("dmobile");
    	if(name.value==""||name.value==null){
    		alert("真实姓名不能为空！");
    		return false;
    	}
    	else if(mobile.value==""||mobile.value==null){
    		alert("手机号不能为空！");
    		return false;
    	}
    	else
    		return true;
    	
    }
    function alterinfo(){
    	var mobile=document.getElementById("dmobile");
    	mobile.readOnly=false;
    }
  </script>
  <body class="frameBody">
<div class="tableContainer">	
	<div id="mainContent" style="width:100%; height:100%; background:#fff none repeat scroll 0% 0%; " class="tablePanel"> 
		<div class="navInfo"><span  style="background:url(images/test.png) -300px -80px no-repeat; width:57px; height:57px; float:left; "></span><div class="navInfoDiv"><span>修改个人资料</span></div></div>
		<div class="clearfloat"></div>
		<div class="editPanel" style="padding-top:7px;">
	  	<% 
		String dusername=(String)session.getAttribute("dusername");
	  	LoginDao docinfoDao=new LoginDao();
		DocInfo docinfo=docinfoDao.Querydocinfo(dusername);
		request.setAttribute("docinfo", docinfo);

		%>
           <!-- 用户基本信息修改 -->
           <form name="useralter" action="DocInfoAlter" onsubmit="return check();" method="post">
            <div class="row">
                <div class="label">医生职工号：</div>
                <div class="field"><%=dusername %></div>
            </div>
            <div class="row">
                <div class="label">姓&nbsp;&nbsp;名：</div>
                <div class="field">
                    <input type="text" id="drelname" name="drelname" class="editor"  maxlength="30" value="${docinfo.drelname}" readonly="readonly"/>
                </div>
            </div>
            <div class="row">
                <div class="label">性&nbsp;&nbsp;别：</div>
                <div class="field">
                <input  name="dgender" type="radio" value="男" id="man" <% if("男".equals(docinfo.getDgender())){ %>checked="checked"<%}%> />男
                <input  name="dgender" type="radio" value="女"  id="woman" <% if("女".equals(docinfo.getDgender())){ %>checked="checked"<%}%> />女
                </div>
            </div>
            <div class="row">
                <div class="label">手&nbsp;&nbsp;机：</div>
                <div class="field">
                    <input type="text" id="dmobile" name="dmobile" class="editor"  maxlength="20" value="${docinfo.dmobile}"  readonly="readonly"/>
                </div>
                <div class="err">
                    <div id="mobileErr"></div>
                </div>
            </div>
            <div class="row">
                <div class="label">方&nbsp;&nbsp;向：</div>
                <div class="field">
                    <input type="text" id="major" name="major" class="editor" maxlength="10" value="${docinfo.major}"  readonly="readonly"/>
                </div>
                <div class="err">
                    <div id="birthplaceErr"></div>
                </div>
            </div>
            <div class="row" style="margin-left:102px">
                <input type="button" id="bnt1" class="bnt1" value="修改手机号" onclick="alterinfo();" style="width:100px; height:25px; border:1px solid #999; background:#fff; cursor:pointer;" />
                <input type="submit" id=bnt2 class="bnt2" value="保存" style="width:100px; height:25px; border:1px solid #999; background:#fff; cursor:pointer;" />
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
