<%@ page language="java" import="com.mywebsite.bean.DocAppointView,com.mywebsite.Service.QueryInfoService,java.util.List"
 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>家长预约记录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	 <link rel="stylesheet" type="text/css" href="css/master.css"/>
     <link rel="stylesheet" type="text/css" href="css/frame.css"/>   
  </head>
  <body class="frameBody">

  <div class="tableContainer">	
	<div id="mainContent" style="width:100%; height:100%; background:#fff none repeat scroll 0% 0%; " class="tablePanel"> 
		<div class="navInfo"><span  style="background:url(images/test.png) -300px -80px no-repeat; width:57px; height:57px; float:left; "></span>
		 <div class="navInfoDiv"><span>家长预约记录</span></div></div>
		<div class="clearfloat"></div>
		 <% 
		       String dname=(String)session.getAttribute("dusername");
               QueryInfoService queryInfo=new QueryInfoService();
               List<DocAppointView> DocAppointInfolist=queryInfo.querydocAppointinfo(dname);
	           request.setAttribute("DocAppointInfolist", DocAppointInfolist);
         %>
		<div class="editPanel" style="padding-top:7px;">
            
             <table class="tab" width="80%" align="center" style="font-size:19px;font-family:'楷体';">
                <tr>
                   <th>幼儿姓名</th>
                   <th>疫苗名称</th>
                   <th>预约时间</th>
                   <th>出生日期</th>
                   <th>身份证号</th>
                   <th>家长姓名</th>
                   <th>联系电话</th>
                   <th>接种处理</th>
                   <th></th>
                </tr>
                <c:forEach items="${DocAppointInfolist}" var="DocAppointInfo" varStatus="status">
                  <tr align="center" <c:if test="${status.index % 2 != 0}">style='background-color:#ECF6EE;'</c:if>>
                   <td>${DocAppointInfo.childname}</td>
                   <td>${DocAppointInfo.vaccine}</td>
                   <td>${DocAppointInfo.appointtime}</td>
                   <td>${DocAppointInfo.childbirth}</td>
                   <td>${DocAppointInfo.idnum}</td>
                   <td>${DocAppointInfo.name}</td>
                   <td>${DocAppointInfo.mobile}</td>
                   <td>
                      <a href="${basePath}VaccinateInfo?idnum=${DocAppointInfo.idnum}&appointtime=${DocAppointInfo.appointtime}" style="color:red;font-family:Cursive;" title="点击填写疫苗接种详细信息">疫苗接种</a>
                   </td>
                 </tr>
                </c:forEach>
             </table>
		</div>
	<div class="clearfloat"></div>
    <div style="height:40px;"></div>	
  </div>
</div>	
</body>
</html>
