<%@page import="com.mysql.cj.x.protobuf.MysqlxSql.StmtExecute"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB 연결 테스트</title>
</head>
<body>
	<%
		//DB 연결 테스트
	Connection conn = null;
    Statement stmt = null; 
	
	//String url = "jdbc:mysql://localhost:8080/";
	String url = "jdbc:mysql://127.0.0.1:3306";
	//jdbc:mysql://127.0.0.1:3306<----이거임 localhost는 톰캣이고
	
	String id = "root";
	String pw = "0000";
	 

	try {
		Class.forName("com.mysql.jdbc.Driver");
		out.print("JDBC Driver loading 성공!! by 18.박현용<br>");
		
	} catch (ClassNotFoundException err) {
		out.print("JDBC Driver loading 실패!!<br>");
	}

	
	
	PreparedStatement pstmt = null; //구문객체
	
	try{
		conn = DriverManager.getConnection(url,id,pw);
		out.print("SQL DB 연결성공<br> by 18.박현용");
		
		String sql = "CREATE DATABASE univ"; // DB 생성 SQL 구문
		
		pstmt = conn.prepareStatement(sql); // 구문을 객체에 넣어서
		
		pstmt.executeUpdate(); // 구문객체 실행
		
		out.print("univ 데이터데이스 생성성공");
		 
	}catch(SQLException sqlerr){
		out.print("SQL DB 연결실패<br>");
		
	}finally {
		//데이터베이스 연결종료
		if (conn != null){
			try{
				conn.close();
				out.print("SQL DB 연결종료!!<br>");
			}catch(Exception conerr){
				conerr.printStackTrace();
			}//닫지 않아도 자동으로 닫아주지만 예전에는 항상 반드시 직접 닫아줘야했다. 
			//하위버전 호환을 위해 지정을 해두자
		}
	}
	
	%>
</body>
</html>