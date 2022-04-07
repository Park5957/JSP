<%@page import="com.mysql.cj.x.protobuf.MysqlxSql.StmtExecute"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테이블 만들기</title>
</head>
<body>

		<%@ include file = "detabase_connection.inc" %>
<%

	//테이블 만들기 SQL

	String sql = "CREATE TABLE student(" //student테이블을 생성한다. 학생들의 
			+ "hakbun int not null,"
			+ "name varchar(10)," // mysql 등 에서는 varchar 을 많이 사용한다.
			+ "gender varchar(10),"
			+ "year tinyint," //tinyint 한글자 수준의 표기를 할때 사용한다. 단, 오라클에서는 지원하지 않는 기능이다.
			+ "dept varchar(20)," 
			+ "addr varchar(50),"
			+ "primary key(hakbun))";
	//보통은 위와같은 형식으로 작성을 하지는 않는다.(복잡함)
	//위 코드는 이미 실행한 것이기에 필요하지 않다.

	pstmt = conn.prepareStatement(sql);
	pstmt.executeUpdate(); //작성구문을 DB로 보냄

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