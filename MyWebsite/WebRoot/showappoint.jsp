<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="com.mywebsite.Service.QueryInfoService,java.util.List" %>
<%@ page import="com.mywebsite.bean.UserAppointView,com.mywebsite.bean.ChildInfo" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>预约信息查询</title>
    
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
		 <div class="navInfoDiv"><span>我的预约</span></div></div>
		<div class="clearfloat"></div>
		<div class="editPanel" style="padding-top:7px;">
        <% 
               QueryInfoService queryInfo=new QueryInfoService();
               String username=(String)session.getAttribute("username");
              //查询幼儿信息
              List<ChildInfo> childinfolist=queryInfo.queryChildidInfo(username);
            //判断用户是否已经添加了幼儿信息
          if(childinfolist!=null&&childinfolist.size()>0){
              List<UserAppointView> AppointInfolist=queryInfo.queryAppointinfo(username);
              //判断用户是否已经有了预约信息
              if(AppointInfolist!=null&&AppointInfolist.size()>0)
            	  request.setAttribute("AppointInfolist", AppointInfolist);	 
              else {
            	  request.setAttribute("page", "appoint.jsp");
                  request.setAttribute("info", "您还没有预约！"); 
                  //页面跳转到结果页面
                  RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/front/result.jsp");
           	      rd.forward(request, response);
              } 
           }
           else{
        	   request.setAttribute("page", "ChildInfoAlter.jsp");
               request.setAttribute("info", "请您先添加幼儿信息！");
               //页面跳转到结果页面
               RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/front/result.jsp");
        	   rd.forward(request, response);
           }
         %>
             <table class="tab"  width="80%" align="center" style="font-size:19px;font-family:'楷体';">
                <tr>
                   <th>幼儿姓名</th>
                   <th>出生日期</th>
                   <th>疫苗名称</th>
                   <th>预约时间</th>
                   <th>医生姓名</th>
                </tr>
                <c:forEach items="${AppointInfolist}" var="AppointInfo" varStatus="status">
                 <tr align="center" <c:if test="${status.index % 2 != 0}">style='background-color:#ECF6EE;'</c:if>>
                   <td>${AppointInfo.childname}</td>
                   <td>${AppointInfo.childbirth}</td>
                   <td>${AppointInfo.vaccine}</td>
                   <td>${AppointInfo.appointtime}</td>
                   <td>${AppointInfo.drelname}</td>
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
