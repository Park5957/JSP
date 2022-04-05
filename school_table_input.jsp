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
		//JDBC 드라이버 로딩
	Class.forName("com.mysql.jdbc.Driver");
	//wep-inf -> li-> 에 존재하는 sql을 연결하기 위해서 문구를 적으면 된다.

	//DB 연결
	String url = "jdbc:mysql://127.0.0.1:3306/school";
	String id = "root";
	String pw = "0000";

	Connection conn = null; //DB 연결객체를 conn 으로 생성
	PreparedStatement pstmt = null; //DB에 전달할 SQL 구문 객체 pstmt 으로 생성

	conn = DriverManager.getConnection(url, id, pw);

	//테이블에 생성된 컬럼에 값을 입력하기 SQL

	String number = request.getParameter("number");
	String name = request.getParameter("name");
	String team = request.getParameter("team");
	String sql = "INSERT INTO emp VALUES(?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, number);
	pstmt.setString(2, name);
	pstmt.setString(3, team);
	pstmt.executeUpdate();

	// DB 연결종료

	if (pstmt != null) {
		pstmt.close();
	} //pstmt 사용후 닫기 간단하게 (pstmt != null) pstmt.close(); 로 적을 수 있음

	if (conn != null) {
		conn.close();
	} //conn 사용후 닫기 간단하게 (conn != null) conn.close(); 로 적을 수 있음

	out.print("BD연결 문제없음 by 18박현용");
	%>
</body>
</html>