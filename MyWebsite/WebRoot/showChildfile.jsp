<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="com.mywebsite.bean.ChildInfo,com.mywebsite.Service.QueryInfoService,java.util.List" %>
<%@ page import="com.mywebsite.bean.VaccineView,com.mywebsite.bean.ExceptionInfo" %>
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
    
    <title>幼儿信息档案查询</title>
    
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
		 <div class="navInfoDiv"><span>幼儿信息档案</span></div></div>
		<div class="clearfloat"></div>
		<div class="editPanel" style="padding-top:7px;">
             <% 
               QueryInfoService queryInfoService=new QueryInfoService();
             //从session会话域获取用户账号
               String username=(String)session.getAttribute("username");
             //根据用户账号查询幼儿信息
               List<ChildInfo> childinfolist=queryInfoService.queryChildidInfo(username);
             //保存在request域中
               request.setAttribute("childinfolist", childinfolist);
             //用户幼儿个数判断
              if(childinfolist!=null&&childinfolist.size()>0&&childinfolist.size()<2){
             //查询幼儿接种记录视图  
               String idnum=childinfolist.get(0).getIdnum();
       		   List<VaccineView> vaccineinfolist=queryInfoService.queryVaccineinfo(idnum);
             //查询幼儿异常反应记录
       		   List<ExceptionInfo> exceptionlist=queryInfoService.queryExceptionInfo(idnum);
       		      request.setAttribute("vaccineinfolist", vaccineinfolist);
       		      request.setAttribute("exceptionlist", exceptionlist);
              }	
             //用户有两个幼儿跳转到相关页面查询
              else if(childinfolist!=null&&childinfolist.size()==2){
            	  session.setAttribute("childinfolist", childinfolist);
            	  response.sendRedirect("showTwoChildfiles.jsp");
              }
             %>
              <table class="tab" width="80%" align="center" style="font-size:19px;font-family:'楷体';">
                <tr>
                   <th>幼儿姓名</th>
                   <th>性别</th>
                   <th>出生日期</th>
                   <th>身份证号</th>
                </tr>
                <!-- 页面幼儿档案信息展示信息展示 -->
                 <tr align="center" style="background-color:#ECF6EE;">
                   <td>${childinfolist.get(0).childname}</td>
                   <td>${childinfolist.get(0).childgender}</td>
                   <td>${childinfolist.get(0).childbirth}</td>
                   <td>${childinfolist.get(0).idnum}</td>
                 </tr>
             </table>
             <table class="tab" width="80%" align="center" style="font-size:19px;font-family:'楷体';">
                <tr>
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
             <table class="tab" width="80%" align="center" style="font-size:19px;font-family:'楷体';">
                <tr>
                   <th>疫苗名称</th>
                   <th>生产厂家</th>
                   <th>疫苗批号</th>
                   <th>疫苗有效期</th>
                   <th>接种日期</th>
                   <th>反应日期</th>
                   <th>反应症状</th>
                </tr>
                <c:forEach items="${exceptionlist}" var="exceptioninfo">
                 <tr align="center" <c:if test="${status.index % 2 != 0}">style='background-color:#ECF6EE;'</c:if>>
                   <td>${exceptioninfo.vaccine}</td>
                   <td>${exceptioninfo.factory}</td>
                   <td>${exceptioninfo.vaccinenum}</td>
                   <td>${exceptioninfo.indate}</td>
                   <td>${exceptioninfo.vaccinatetime}</td>
                   <td>${exceptioninfo.reaction}</td>
                   <td>${exceptioninfo.symptom}</td>
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
