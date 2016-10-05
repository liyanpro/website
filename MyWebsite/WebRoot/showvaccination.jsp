<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="com.mywebsite.bean.ChildInfo,com.mywebsite.Service.QueryInfoService,java.util.List" %>
<%@ page import="com.mywebsite.bean.VaccineView" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>接种信息查询</title>
    
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
	<div id="mainContent" style="width:100%;  background:#fff none repeat scroll 0% 0%; " class="tablePanel"> 
		<div class="navInfo"><span  style="background:url(images/test.png) -300px -80px no-repeat; width:57px; height:57px; float:left; "></span>
		 <div class="navInfoDiv"><span>幼儿接种信息</span></div></div>
		<div class="clearfloat"></div>
		<div class="editPanel" style="padding-top:7px;">
             <% 
               QueryInfoService queryInfoService=new QueryInfoService();
               String username=(String)session.getAttribute("username");
               List<ChildInfo> childinfolist=queryInfoService.queryChildidInfo(username);
               
              if(childinfolist!=null&&childinfolist.size()>0&&childinfolist.size()<2){
       		      List<VaccineView> vaccineinfolist=queryInfoService.queryVaccineinfo(childinfolist.get(0).getIdnum());
       		      request.setAttribute("vaccineinfolist", vaccineinfolist);
              }	  
              else if(childinfolist!=null&&childinfolist.size()==2){
            	  session.setAttribute("childinfolist", childinfolist);
            	  response.sendRedirect("showTwovaccination.jsp");
              }
              else 
              {
            	  request.setAttribute("page", "appoint.jsp");
                  request.setAttribute("info", "您的孩子没有接种信息，请先预约接种！"); 
                  //页面跳转到结果页面
                  RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/front/result.jsp");
           	      rd.forward(request, response);
              }        
             %>
             <table class="tab" width="80%" align="center" style="font-size:19px;font-family:'楷体';">
                <tr>
                   <th>幼儿姓名</th>
                   <th>年（月）龄</th>
                   <th>疫苗名称</th>
                   <th>疫苗批号</th>
                   <th>接种剂量</th>
                   <th>预约时间</th>
                   <th>接种时间</th>
                   <th>接种者</th>
                </tr>
                <c:forEach items="${vaccineinfolist}" var="vaccineinfo">
                 <tr align="center" <c:if test="${status.index % 2 != 0}">style='background-color:#ECF6EE;'</c:if>>
                   <td>${vaccineinfo.childname}</td>
                    <td><c:set var="n" value="${vaccineinfo.age}"/>
                       <c:if test="${n<24}">
                       ${vaccineinfo.age}月龄
                       </c:if>
                       <c:if test="${n>=24}">
                       <fmt:formatNumber type="number" value="${n/12}" maxFractionDigits="0"/>周岁
                       </c:if>
                   </td>
                   <td>${vaccineinfo.vaccine}</td>
                    <td>${vaccineinfo.vaccinenum}</td>
                   <td>${vaccineinfo.vaccinetimes}</td>
                   <td>${vaccineinfo.appointtime}</td>
                   <td>${vaccineinfo.vaccinetime}</td>
                   <td>${vaccineinfo.drelname}</td>
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
