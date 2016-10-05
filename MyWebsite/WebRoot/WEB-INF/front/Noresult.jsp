<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List,com.mywebsite.bean.VaccinateProdedure" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
	<body>
	<form name = "form" action="${requestScope.page}" method="post"/></form>
	<% List<VaccinateProdedure> vaccineinfolist=(List<VaccinateProdedure>)request.getAttribute("vaccineinfolist"); %> 
	<script type="text/javascript">
	alert("您的小孩月龄未到可以接种该疫苗的时候!");
    alert("当前可以接种的疫苗有：\n\n <% for(int i=0;i<vaccineinfolist.size();i++) {%><%=vaccineinfolist.get(i).getVaccine()%>    <%=vaccineinfolist.get(i).getVaccinetimes()%>\n <%}%>");
    form.submit();
    </script>
	</body>
</html>
