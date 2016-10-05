<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<body style="background: #e1e9eb;">
		<form action="QueryDocInfo" id="mainForm" method="post">
			
			<div class="right">
				<div class="current">当前位置：<a href="javascript:void(0)" style="color:#6E6E6E;">医生管理</a> &gt; 医生列表</div>
				<div class="rightCont">
					<p class="g_title fix">医生列表 <a class="btn03" href="<%=basePath %>AddDoctorInfo">新 增</a>&nbsp;&nbsp;&nbsp;&nbsp;</p>
					<table class="tab1">
						<tbody>
							<tr>
								<td width="90" align="right">医生职工号：</td>
								<td>
									<input name="dusername" type="text" class="allInput" value=""/>
								</td>
								<td width="90" align="right">姓名：</td>
								<td>
									<input name="drelname" type="text" class="allInput" value=" "/>
								</td>
	                            <td width="85" align="right"><input type="submit" class="tabSub" value="查 询" /></td>
	       					</tr>
						</tbody>
					</table>
					<div class="zixun fix">
						<table class="tab2" width="100%">
							<tbody>
								<tr style="background: #e5f0ff;">
								    <th>序号</th>
								    <th>职工号</th>
								    <th>姓名</th>
								    <th>性别</th>
								    <th>联系方式</th>
								    <th>专业方向</th>
								    <th>操作</th>
								</tr>
								<c:forEach items="${DocInfolist}" var="DocInfo" varStatus="status">
									<tr  <c:if test="${status.index % 2 != 0}">style='background-color:#ECF6EE;'</c:if>>
										<td>${status.index + 1}</td>
										<td>${DocInfo.dusername}</td>
										<td>${DocInfo.drelname}</td>
										<td>${DocInfo.dgender}</td>
										<td>${DocInfo.dmobile}</td>
										<td>${DocInfo.major}</td>
										<td>
											<a href="${basePath}AlterDoctorInfo?username=${DocInfo.dusername}">修改</a>&nbsp;&nbsp;&nbsp;
											<a href="${basePath}DeleteDocInfo?username=${DocInfo.dusername}">删除</a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
	    </form>
	</body>
</html>