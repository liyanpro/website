<%@ page language="java"  pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ page import="com.mywebsite.bean.UserInfo,com.mywebsite.Dao.LoginDao,java.util.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>异常反应记录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	 <link rel="stylesheet" type="text/css" href="css/master.css"/>
     <link rel="stylesheet" type="text/css" href="css/frame.css"/>
      <script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
      <script type="text/javascript" src="laydate/laydate.js"></script>

  </head>
   <script type="text/javascript"> 
    function date(){
    laydate({
       elem: '#vaccinatetime'
    })
    }
    function date2(){
        laydate({
           elem: '#reaction'
        })
        }
    </script>
  <body class="frameBody">
<div class="tableContainer">	
	<div id="mainContent" style="width:100%; height:100%; background:#fff none repeat scroll 0% 0%; " class="tablePanel"> 
		<div class="navInfo"><span  style="background:url(images/test.png) -300px -80px no-repeat; width:57px; height:57px; float:left; "></span><div class="navInfoDiv">
		 <span>异常反应记录</span></div></div>
		<div class="clearfloat"></div>
		<div class="editPanel" style="padding-top:7px;">
           <!-- 添加异常反应记录 -->
           <form name="exceptioninfo" action="ExceptionInfo" onsubmit="return check();" method="post">
            <div class="row">
                <div class="label">幼儿姓名：</div>
                <div class="field">
                   <input type="text" id="childname" name="childname" class="editor"  maxlength="30" value=" "/>
                </div>
            </div>
            <div class="row">
                <div class="label">身份证号：</div>
                <div class="field">
                    <input type="text" id="idnum" name="idnum" class="editor"  maxlength="30" value="" />
                </div>
            </div>
            <div class="row">
                <div class="label">疫苗名称：</div>
                <div class="field">
                 <input type="text" id="vaccine" name="vaccine" class="editor"  maxlength="30" value="" />
                </div>
            </div>
            <div class="row">
                <div class="label">生产厂家：</div>
                <div class="field">
                    <input type="text" id="factory" name="factory" class="editor"  maxlength="20" value="" />
                </div>
                <div class="err">
                    <div id="mobileErr"></div>
                </div>
            </div>
            <div class="row">
                <div class="label">疫苗批号：</div>
                <div class="field">
                    <input type="text" id="vaccinenum" name="vaccinenum" class="editor" maxlength="20" value=""/>
                </div>
                <div class="err">
                    <div id="birthplaceErr"></div>
                </div>
            </div>
            <div class="row">
                <div class="label">有效期：</div>
                <div class="field">
                    <input type="text" id="indate" name="indate" class="editor" onclick="laydate(); laydate.skin('danlan')" maxlength="20" value=""/>
                </div>
                <div class="err">
                    <div id="homePhoneErr"></div>
                </div>
            </div>
            <div class="row">
                <div class="label">接种日期：</div>
                <div class="field">
                    <input type="text" id="vaccinatetime" name="vaccinatetime" onclick="date()" class="editor"  maxlength="30" value=""/>
                </div>
                <div class="err">
                    <div id="idNumberErr"></div>
                </div>
            </div>
             <div class="row">
                <div class="label">反应日期：</div>
                <div class="field">
                    <input type="text" id="reaction" name="reaction" onclick="date2()" class="editor"  maxlength="30" value=""/>
                </div>
                <div class="err">
                    <div id="idNumberErr"></div>
                </div>
            </div>
            <div class="row">
                <div class="label">反应症状：</div>
                <div class="field">
                    <input type="text" id="symptom" name="symptom" class="editor"  maxlength="30" value=""/>
                </div>
                <div class="err">
                    <div id="idNumberErr"></div>
                </div>
            </div>
            <div class="row" style="margin-left:102px">
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
