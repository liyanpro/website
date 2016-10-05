<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.mywebsite.Service.QueryInfoService,java.util.List" %>
<%@ page import="com.mywebsite.bean.UserAppointView,com.mywebsite.bean.ChildInfo" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>幼儿信息修改</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="laydate/laydate.js"></script>
	 <link rel="stylesheet" type="text/css" href="css/master.css"/>
     <link rel="stylesheet" type="text/css" href="css/frame.css"/>
      <script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
    <!-- 用正则表达式对日期格式进行验证 -->
    <script type="text/javascript"> 
    function date(){
    laydate({
       elem: '#childbirth2'
    })
    }
      function check(){
    	  var a = /^(\d{4})-(\d{2})-(\d{2})$/;
    	  var b=/^(\d{15}$|^\d{18}$|^\d{17}(\d|X|x))$/;
    	  var num=document.getElementById("idnum1");
    	  var datetime=document.getElementById("childbirth1");
    	  if(!a.test(datetime.value)){
    		  alert("输入的日期格式不正确！");
    		  return false ;
    	  }
    	  else if(!b.test(num.value)){
    		  alert("身份证号格式不正确！");
    		  return false;
    	  }
    	  else
    		  return true;
      }
    </script>
  </head>
 <body class="frameBody">
<div class="tableContainer">	
	<div id="mainContent" style="width:100%; height:100%; background:#fff;  min-height:700px; " class="tablePanel"> 
		<div class="navInfo"><span  style="background:url(images/test.png) -300px -80px no-repeat; width:57px; height:57px; float:left; "></span>
		<div class="navInfoDiv"><span>添加幼儿资料</span></div></div>
		<div class="clearfloat"></div>
		<div class="row2">
		    <lable class="Lable">一胎幼儿信息</lable>
		</div>
		<div class="editPanel" style="padding-top:7px;">
           <form name="childalter" action="ChildInfoAlter" onsubmit="return check();" method="post">
            <div class="row">
                <div class="label">姓&nbsp;&nbsp;名：</div>
                <div class="field">
                    <input type="text" id="childname1" name="childname" class="editor"  maxlength="20" value=""/>
                </div>
            </div> 
            <div class="row">
                <div class="label">性&nbsp;&nbsp;别：</div>
                <div class="field">
                <input  name="childgender" type="radio" value="男" id="man" />男
                <input  name="childgender" type="radio" value="女"  id="woman" />女
                </div>
            </div>
            <div class="row">
                <div class="label">出生日期：</div>
                <div class="field">
                    <input type="text" id="childbirth1" name="childbirth" class="editor" onclick="laydate();laydate.skin('dahong')" maxlength="10" readonly="true" />
                </div>
            </div>
            <div class="row">
                <div class="label">身份证号：</div>
                <div class="field">
                    <input type="text" id="idnum1" name="idnum" class="editor"  maxlength="20" value=""/>
                </div>
                <div class="err">
                    <div id="homePhoneErr"></div>
                </div>
            </div>
            <div class="row" style="margin-left:102px">
                <input type="submit" id="submit1" class="button" value="保存"  style="width:100px; height:25px; border:1px solid #999; background:#fff; cursor:pointer;" />
            </div>
           </form>
		</div>
	 	<div class="row2">
		    <lable class="Lable">二胎幼儿信息</lable>
		</div>
		<div class="editPanel" style="padding-top:7px;">
           <form name="childalter2" action="ChildInfoAlter"  method="post">
            <div class="row">
                <div class="label">姓&nbsp;&nbsp;名：</div>
                <div class="field">
                    <input type="text" id="childname2" name="childname" class="editor"  maxlength="20" value=""/>
                </div>
            </div>
            <div class="row">
                <div class="label">性&nbsp;&nbsp;别：</div>
                <div class="field">
                <input  name="childgender" type="radio" value="男" id="man"/>男
                <input  name="childgender" type="radio" value="女"  id="woman" />女
                </div>
            </div>
            <div class="row">
                <div class="label">出生日期：</div>
                <div class="field">
                    <input type="text" id="childbirth2" name="childbirth" class="editor" onclick="date()" maxlength="10" readonly="true" />
                </div>
            </div>
            <div class="row">
                <div class="label">身份证号：</div>
                <div class="field">
                    <input type="text" id="idnum2" name="idnum" class="editor"  maxlength="20" value=""/>
                </div>
                <div class="err">
                    <div id="homePhoneErr"></div>
                </div>
            </div>
            <div class="row" style="margin-left:102px">
                <input type="submit" id="submit2" class="button" value="保存"  style="width:100px; height:25px; border:1px solid #999; background:#fff; cursor:pointer;" />
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
