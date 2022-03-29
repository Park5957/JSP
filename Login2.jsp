<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String uid = request.getParameter("id");
	String res = "<h3>User ID :" + uid + "</h3>";
	out.print(res); //일반적인 자바와 형식이 약간은 다르다.
	%>
</body>
</html>