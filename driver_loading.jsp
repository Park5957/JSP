<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC Driver loading test</title>
</head>
<body>

	<%
		//JDBC Driver loading test
	try {

		Class.forName("com.mysql.jdbc.Diver");
		out.print("JDBC Driver loading 성공!!<dr>");
		
	} catch (ClassNotFoundException err) {
		out.print("JDBC Driver loading 실패!!<dr>");
	}
	%>
</body>
</html>