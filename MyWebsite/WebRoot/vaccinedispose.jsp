<%@ page language="java" import="com.mywebsite.bean.DocInfo,com.mywebsite.Service.QueryInfoService,java.util.List"
 pageEncoding="UTF-8"%>
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
    
    <title>疫苗接种信息处理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	 <link rel="stylesheet" type="text/css" href="css/master.css"/>
     <link rel="stylesheet" type="text/css" href="css/frame.css"/>   
  </head>
  <script type="text/javascript">
  function check1(){
	  var b=/^(\d{15}$|^\d{18}$|^\d{17}(\d|X|x))$/;
	  var num=document.getElementById("idnum1");
	  if(!b.test(num.value)){
		  alert("身份证号格式不正确！");
		  return false;
	     }
	  else
		  return true;
  }
  function check2(){
	  var num2=document.getElementById("idnum2");
	  if(num2.value=="null"){
		  alert("请您先仔细查看幼儿接种情况再进行接种信息填写！");
		  return false;
	  }
	  else
		  return true;
  }
  </script>
  <body class="frameBody">

  <div class="tableContainer">	
	<div id="mainContent" style="width:100%;  background:#fff none repeat scroll 0% 0%; " class="tablePanel"> 
		<div class="navInfo"><span  style="background:url(images/test.png) -300px -80px no-repeat; width:57px; height:57px; float:left; "></span>
		 <div class="navInfoDiv"><span>幼儿接种信息</span></div></div>
		<div class="clearfloat"></div>
		<div class="editPanelQuery">
		  <form name="vaccinationquery" action="DocQueryVaccination" onsubmit="return check1();" method="post">
		      <div class="label" style="font-family: cursive;font-size: 19px;color: red;">请输入幼儿身份证号查询接种信息</div>
                <div class="field">
                    <input type="text" id="idnum1" name="idnum" class="editor" value="<%if(session.getAttribute("idnum")!=null) out.print(session.getAttribute("idnum"));
                    else out.print("");%>" style="height:25px" maxlength="20"/>
                    <input type="submit" value="查  询"  style="width:70px; height:25px; border:1px solid #999;"/>
                </div>
		  </form>
		  <form name="vaccinationdispose" action="VaccinateDispose" onsubmit="return check2();" method="post">
                <div class="field">
                    <input type="hidden" id="idnum2" name="idnum" class="editor" value="<%=session.getAttribute("idnum") %>" style="height:25px" maxlength="20"/>
                    <input type="submit" value="接  种"  style="width:70px; height:25px; border:1px solid #999;"/>
                </div>
		  </form>
		</div>
		<div class="editPanel" style="padding-top:7px;">
            
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
                <c:forEach items="${vaccineinfolist}" var="vaccineinfo" varStatus="status">
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
