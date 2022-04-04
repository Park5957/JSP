<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>include 지시문</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	%>

	<%@ include file="header.jsp"%>
	
	<%@ include file="inc_sum_for.jsp"%>
	<br>
	<b>include 지시문</b>
	<br>

	<%@ include file="footer.jsp"%>

</body>
</html>