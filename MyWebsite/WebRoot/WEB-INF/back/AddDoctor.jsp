<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta http-equiv="X-UA-Compatible"content="IE=9; IE=8; IE=7; IE=EDGE" />
		<title>后台医生管理</title>
		<link href="<%= basePath %>css/all.css" rel="stylesheet" type="text/css" />
		<script src="<%= basePath %>js/jquery-1.8.0.min.js"></script>
	</head>
	<script type="text/javascript">
	   function check(){
		   
		 var dusername=document.getElementById("dusername");
		 var dpassword=document.getElementById("dpassword");
		 var drelname=document.getElementById("drelname");
		 if(dusername.value==""||dpassword.value==""||drelname.value==""){
			 alert("医生职工号和姓名必须输入！");
			 return false;
		 }
			 
		 else
			 return true;
	   }
	</script>
	<body style="background: #e1e9eb;">
		<form action="AddDoctorInfo" id="mainForm" onsubmit="return check();" method="post">
			
			<div class="right">
				<div class="current">当前位置：<a href="javascript:void(0)" style="color:#6E6E6E;">医生管理</a> &gt; 添加医生</div>
				<div class="rightCont">
					<p class="g_title fix">添加医生 </p>
					<table class="tab1" style="width: 100%; background: rgba(176, 197, 206, 0.29) none repeat scroll 0% 0%;">
						<tbody>
							<tr>
								<td width="150" align="right">医生职工号：&nbsp;&nbsp;&nbsp;</td>
								<td>
									<input name="username" id="dusername" type="text" class="docInput" value=""/>
								</td>
							</tr>
							<tr>
								<td width="150" align="right">初始密码：&nbsp;&nbsp;&nbsp;</td>
								<td>
									<input name="password" id="dpassword" type="password" class="docInput" value="123456"/>
								</td>
						    </tr>
							<tr>
								<td width="150" align="right">姓名：&nbsp;&nbsp;&nbsp;</td>
								<td>
							        <input name="relname" id="drelname" type="text" class="docInput" value=""/>
								</td>
							</tr>
							<tr>	
								<td width="150" align="right">性别：&nbsp;&nbsp;&nbsp;</td>
								<td>
									<input name="dgender" type="text" class="docInput" value=" "/>
								</td>
							</tr>
							<tr>
								<td width="150" align="right">联系方式：&nbsp;&nbsp;&nbsp;</td>
								<td>
									<input name="dmobile" type="text" class="docInput" value=" "/>
								</td>
						    </tr>
						    <tr>
								<td width="150" align="right">专业方向：&nbsp;&nbsp;&nbsp;</td>
								<td>
									<input name="major" type="text" class="docInput" value=" "/>
								</td>
							</tr>
							<tr>
							    <td></td>
                                <td width="90" align="left" ><input type="submit"  style="margin-left: 50px;" class="tabSub" value="提   交" /></td>
	       				    </tr>
						</tbody>
					</table>
				</div>
			</div>
	    </form>
	</body>
</html>