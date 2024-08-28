<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h6 id='saveMessage' class="alert alert-success h-6 m-3 p-2"  style='display:flex;'>Successfully!</h6>
	<script>
			setTimeout(function(){document.getElementById('saveMessage').style.display='none';},5000);
	</script>
	<jsp:include page="view.jsp" />
</body>
</html>