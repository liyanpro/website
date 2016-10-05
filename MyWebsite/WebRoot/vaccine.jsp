<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.mywebsite.bean.ChildVaccinateInfo" %>
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
	<script type="text/javascript" src="laydate/laydate.js"></script>
	 <link rel="stylesheet" type="text/css" href="css/master.css"/>
     <link rel="stylesheet" type="text/css" href="css/frame.css"/>
  </head>
  <!-- 用正则表达式对日期格式进行验证 -->
    <script type="text/javascript">
    function check(){
    	//日期的正则表达式
  	  var a = /^(\d{4})-(\d{2})-(\d{2})$/;
  	  var datetime=document.getElementById("vaccinetime");  
  	  if(!a.test(datetime.value)){
		  alert("输入的日期格式不正确！");
		  return false ;
	   }
  	  else
  		  return true;
    }
    </script>
  <body class="frameBody">
<div class="tableContainer">	
	<div id="mainContent" style="width:100%; height:100%; background:#fff;  min-height:700px; " class="tablePanel"> 
		<div class="navInfo"><span  style="background:url(images/test.png) -300px -80px no-repeat; width:57px; height:57px; float:left; "></span>
		   <div class="navInfoDiv"><span>疫苗接种信息处理</span></div></div>
		<div class="clearfloat"></div>
		
		<div class="editPanel" style="padding-top:7px;">
           <form name="vaccinateinfo" action="UpdateVaccineInfo" onsubmit="return check();" method="post">
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
                <div class="label">接种剂量</div>
                <div class="field">
                    <select name="vaccinetimes">
                      <option value="未接种">请选择</option>
                      <option value="第一剂">第一剂</option>
                      <option value="第二剂">第二剂</option>
                      <option value="第三剂">第三剂</option>
                      <option value="第四剂">第四剂</option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="label">疫苗批号：</div>
                <div class="field">
                    <input type="text" id="vaccinenum" name="vaccinenum" class="editor"  maxlength="22" value="" />
                </div>
            </div>
            <div class="row">
                <div class="label">接种时间：</div>
                <div class="field">
                    <input type="text" id="vaccinetime" name="vaccinetime" class="editor" onclick="laydate();laydate.skin('danlan')" maxlength="10" readonly="true"/>
                </div>
            </div>
             <div class="row">
                <div class="label">预约时间：</div>
                <div class="field">
                     <input type="text" id="appointtime" name=""appointtime"" class="editor"  maxlength="22" value="${childVaccinateInfo.appointtime }" readonly/>
                </div>
            </div>
            <div class="row">
                <div class="label">年（月）龄：</div>
                <div class="field">
                   <input type="text" id="appointtime" name=""appointtime"" class="editor"  maxlength="22" value="<%int age=(int)session.getAttribute("age");if(age<24) out.print(age+"月龄");
                   else out.print(age/12+"周岁");
                   %>"readonly/>
                </div>
            </div>
            <div class="row">
                <div class="label">幼儿身份证：</div>
                <div class="field">
                   <input type="text" id="idnum" name=""idnum"" class="editor"  maxlength="22" value="${childVaccinateInfo.idnum}" readonly/> 
                </div>
            </div>
            <div class="row" style="margin-left:102px">
                <input type="submit" id="submit" class="button" value="保存"  style="width:100px; height:25px; border:1px solid #999; background:#fff; cursor:pointer;" />
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
