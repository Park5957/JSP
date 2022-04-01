<%@page import="com.mysql.cj.x.protobuf.MysqlxSql.StmtExecute"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//JDBC 드라이버 로딩
Class.forName("com.mysql.jdbc.Driver");
//wep-inf -> li-> 에 존재하는 sql을 연결하기 위해서 문구를 적으면 된다.

//DB 연결
String url = "jdbc:mysql://127.0.0.1:3306/visit";
String id = "root";
String pw = "0000";

Connection conn = null; //DB 연결객체를 conn 으로 생성
PreparedStatement pstmt = null; //DB에 전달할 SQL 구문 객체 pstmt 으로 생성

conn = DriverManager.getConnection(url,id,pw);

//테이블 만들기 SQL

String sql = "CREATE TABLE feed("
			+"name   varchar(20) NOT NULL,"
			+"content  varchar(50) NULL DEFAULT NULL,"
			+"ts     TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP()," //시간지정 시간진행을 위한것
			+"primary key(name))";

	pstmt = conn.prepareStatement(sql);
	pstmt.executeUpdate(); 

	//참고로 sql에 직접생성을 하고 싶다면 서밋창을 이용하던지
//	CREATE TABLE `feed` (
//	`name` VARCHAR(20) NOT NULL,
//	`content` VARCHAR(50) NULL DEFAULT NULL,
//	`ts` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP(),
//	PRIMARY KEY (`name`)
//)
//COLLATE='utf8mb4_0900_ai_ci'
//ENGINE=InnoDB
//;
	//을 입력하면 된다.


// DB 연결종료

if (pstmt != null) {
	pstmt.close();
} //pstmt 사용후 닫기 간단하게 (pstmt != null) pstmt.close(); 로 적을 수 있음

if (conn != null) {
	conn.close();
} //conn 사용후 닫기 간단하게 (conn != null) conn.close(); 로 적을 수 있음


out.print("BD연결 문제없음 by 18박현용");
%>