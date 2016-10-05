<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.mywebsite.Service.QueryInfoService,java.util.List,java.sql.Date" %>
<%@ page import="com.mywebsite.bean.UserAppointView,com.mywebsite.bean.ChildInfo,com.mywebsite.bean.DocInfo" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>疫苗接种预约</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="laydate/laydate.js"></script>
	 <link rel="stylesheet" type="text/css" href="css/master.css"/>
     <link rel="stylesheet" type="text/css" href="css/frame.css"/>
    <!-- 用正则表达式对日期格式进行验证 -->
    <script type="text/javascript">
    function check(){
    	//日期的正则表达式
  	  var a = /^(\d{4})-(\d{2})-(\d{2})$/;
  	  var num=document.getElementById("dusername");
  	  var datetime=document.getElementById("appointtime"); 
  	  if(datetime.valueOf()==" "){
  		  alert("日期不能为空!");
  		  return false;
  	  }
  	  else if(!a.test(datetime.value)){
		  alert("输入的日期格式不正确！");
		  return false ;
	   }
  	  else if(num.value==" "){
  		  alert("请选择接种医生！");
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
		   <div class="navInfoDiv"><span>幼儿接种预约</span></div></div>
		<div class="clearfloat"></div>
		<%
		  QueryInfoService queryInfo=new QueryInfoService();
          String username=(String)session.getAttribute("username");
          //查询幼儿信息
          List<ChildInfo> childinfolist=queryInfo.queryChildidInfo(username);
          //判断是否有幼儿信息，没有进行跳转
          if(childinfolist!=null&&childinfolist.size()>0){
          List<DocInfo> DocInfolist=queryInfo.queryDocinfo();
          request.setAttribute("DocInfolist", DocInfolist);
		  request.setAttribute("childinfolist", childinfolist);
          }
          else{
        	  request.setAttribute("info", "请您先添加幼儿基本信息！");
        	  request.setAttribute("page", "ChildInfoAlter.jsp");
        	  RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/font/result.jsp");
   		       rd.forward(request, response);
          }
		%>
		<div class="editPanel" style="padding-top:7px;">
           <form name="appointinfo" action="AppointInfo" onsubmit="return check();" method="post">
             <div class="row">
                <div class="label">幼儿姓名：</div>
                <div class="field">
                   <select name="childname" id="childname" >
                     <c:forEach items="${childinfolist}" var="childinfo"> 
                         <option value="${childinfo.childname}">${childinfo.childname}</option>
                     </c:forEach>
                   </select>   
                </div>
            </div>
             <div class="row">
                <div class="label">幼儿身份证：</div>
                <div class="field">
                      <select name="idnum" id="idnum" >
                     <c:forEach items="${childinfolist}" var="childinfo"> 
                         <option value="${childinfo.idnum}">${childinfo.idnum}</option>
                     </c:forEach>
                   </select>   
                </div>
            </div>
            <div class="row">
                <div class="label">疫苗名称：</div>
                <div class="field">
                    <select name="vaccine">
                      <option value="未知">请选择</option>
                      <option value="乙肝疫苗">乙肝疫苗</option>
                      <option value="卡介苗">卡介苗</option>
                      <option value="脊灰疫苗">脊灰疫苗</option>
                      <option value="无细胞百白破疫苗">无细胞百白破疫苗</option>
                      <option value="白破疫苗">白破疫苗</option>
                      <option value="麻风疫苗">麻风疫苗</option>
                      <option value="麻腮风疫苗">麻腮风疫苗</option>
                      <option value="乙脑减毒活疫苗">乙脑减毒活疫苗</option>
                      <option value="A群流脑疫苗">A群流脑疫苗</option>
                      <option value="A群C群流脑疫苗">A群C群流脑疫苗</option>
                      <option value="甲肝减毒活疫苗">甲肝减毒活疫苗</option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="label">预约时间：</div>
                <div class="field">
                    <input type="text" id="appointtime" name="appointtime" class="editor"  onclick="laydate(); laydate.skin('danlan')" maxlength="10" readonly="true" value=" " />
                </div>
            </div>
            <div class="row">
                <div class="label">接种医生：</div>
                <div class="field">
                    <select name="dusername" id="dusername" >
                         <option value=" ">医生姓名</option>
                     <c:forEach items="${DocInfolist}" var="DocInfo"> 
                         <option value="${DocInfo.dusername}">${DocInfo.drelname}</option>
                     </c:forEach>
                   </select>
                </div>
                <div class="err">
                    <div id="homePhoneErr"></div>
                </div>
            </div>
            <div class="row" style="margin-left:102px">
                <input type="submit" id="submit" class="button" value="提交预约"  style="width:100px; height:25px; border:1px solid #999; background:#fff; cursor:pointer;" />
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
