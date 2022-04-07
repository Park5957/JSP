<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB 입력</title>
</head>
<body>
	<% request.setCharacterEncoding("UTF-8"); // 한글 구동용
%>
	<%@ include file = "detabase_connection.inc" %>
	
	<%

	String hakbun = request.getParameter("hakbun");
	String name = request.getParameter("name");
	String dept = request.getParameter("dept");
	String gender = request.getParameter("gender");
	String year = request.getParameter("year");
	String addr = request.getParameter("addr");
	
	
	String sql = "INSERT INTO student VALUES(?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, hakbun);
	pstmt.setString(2, name);
	pstmt.setString(3, gender);
	pstmt.setString(4, year);
	pstmt.setString(5, dept);
	pstmt.setString(6, addr);
	pstmt.executeUpdate();

	// DB 연결종료

	if (pstmt != null) {
		pstmt.close();
	} //pstmt 사용후 닫기 간단하게 (pstmt != null) pstmt.close(); 로 적을 수 있음

	if (conn != null) {
		conn.close();
	} //conn 사용후 닫기 간단하게 (conn != null) conn.close(); 로 적을 수 있음
	response.sendRedirect("university_table_input2.jsp");
	out.print("BD연결 문제없음 by 18박현용");
	%>
</body>
</html>