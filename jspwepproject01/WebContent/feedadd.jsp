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
	<%
		request.setCharacterEncoding("UTF-8"); // 한글 구동용
	//JDBC 드라이버 로딩
	Class.forName("com.mysql.jdbc.Driver");

	//DB 연결
	String url = "jdbc:mysql://127.0.0.1:3306/visit";
	String id = "root";
	String pw = "0000";

	Connection conn = null; //DB 연결객체를 conn 으로 생성
	PreparedStatement pstmt = null; //DB에 전달할 SQL 구문 객체 pstmt 으로 생성

	conn = DriverManager.getConnection(url, id, pw);

	//테이블에 생성된 컬럼에 값을 입력하기 SQL

	String name = request.getParameter("name");
	String content = request.getParameter("content");
	
	String sql = "INSERT INTO feed VALUES(?,?,now())";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setString(2, content);
	
	pstmt.executeUpdate();

	// DB 연결 종료
	if (pstmt != null) pstmt.close();
	if (conn != null) conn.close();

	response.sendRedirect("main.jsp");
	%>
</body>
</html>