<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h6 id='saveMessage' class="alert alert-danger m-3 p-2"  style='display:flex;'  style='display:flex;'  modelAttribute="order" method="post">OrderId is Already Exist!</h6>
	<script>
		setTimeout(function(){document.getElementById('saveMessage').style.display='none';},5000);
	</script>
	<jsp:include page="orderForm.jsp" />
</body>
</html>