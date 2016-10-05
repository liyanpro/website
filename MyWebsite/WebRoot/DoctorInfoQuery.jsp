<%@ page language="java" import="com.mywebsite.bean.DocInfo,com.mywebsite.Service.QueryInfoService,java.util.List"
 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>医生信息查询</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	 <link rel="stylesheet" type="text/css" href="css/master.css"/>
     <link rel="stylesheet" type="text/css" href="css/frame.css"/>   
  </head>
  <script type="text/javascript">
  function check(){
	  
	  var text=document.getElementById("dusername");
	  if(text.value=="")
		  return false;
	  else
		  return true;
  }
  </script>
  <body class="frameBody">

  <div class="tableContainer">	
	<div id="mainContent" style="width:100%; height:100%; background:#fff none repeat scroll 0% 0%; " class="tablePanel"> 
		<div class="navInfo"><span  style="background:url(images/test.png) -300px -80px no-repeat; width:57px; height:57px; float:left; "></span>
		 <div class="navInfoDiv"><span>医生信息</span></div></div>
		<div class="clearfloat"></div>
		 <% 
               QueryInfoService queryInfo=new QueryInfoService();
               List<DocInfo> DocInfolist=queryInfo.queryDocinfo();
	           request.setAttribute("DocInfolist", DocInfolist);  
         %>
		<div class="editPanel" style="padding-top:7px;">
             <table class="tab" width="80%" align="center" style="font-size:19px;font-family:'楷体';">
                <tr>
                   <th>医生姓名</th>
                   <th>性别</th>
                   <th>联系方式</th>
                   <th>专业方向</th> 
                   <th>预约信息</th> 
                </tr>
                <c:forEach items="${DocInfolist}" var="DoctorInfo" varStatus="status">
                 <tr align="center" <c:if test="${status.index % 2 != 0}">style='background-color:#ECF6EE;'</c:if>>
                   <td>${DoctorInfo.drelname}</td>
                   <td>${DoctorInfo.dgender}</td>
                   <td>${DoctorInfo.dmobile}</td>
                   <td>${DoctorInfo.major}</td>
                   <td><a href="${basePath}DocShowAppoint?dusername=${DoctorInfo.dusername}" style="color:red;font-family:Cursive;" title="点击填写疫苗接种详细信息">查看</a></td>
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
