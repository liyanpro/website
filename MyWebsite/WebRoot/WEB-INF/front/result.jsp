<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<body>
	<form name = "form" action="${requestScope.page}" method="post"/></form>
	<c:if test="${requestScope.info != null}">
	<script type="text/javascript">
	   alert('${requestScope.info}');
       form.submit();
      </script>
	</c:if>
	</body>
</html>
