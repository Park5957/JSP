<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB내용 (학생목록)출력</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8"); // 한글 구동용
	//JDBC 드라이버 로딩
	Class.forName("com.mysql.jdbc.Driver");
	//wep-inf -> li-> 에 존재하는 sql을 연결하기 위해서 문구를 적으면 된다.

	//DB 연결
	String url = "jdbc:mysql://127.0.0.1:3306/school";
	String id = "root";
	String pw = "0000";

	Connection conn = null; //DB 연결객체를 conn 으로 생성
	PreparedStatement pstmt = null; //DB에 전달할 SQL 구문 객체 pstmt 으로 생성
	ResultSet rset = null; //DB에서 꺼내올 객체(데이터를 담을)

	conn = DriverManager.getConnection(url, id, pw);

	//입력된 컬럼값 출력 SQL

	String sql = "SELECT * FROM emp"; //데이터 가지고 오기
	pstmt = conn.prepareStatement(sql); // 명령을 요청후 pstmt에 들어온다.

	rset = pstmt.executeQuery(); // Query로 rest에 가지고오는 데이터를 입력한다.
	%>
	<!-- 이렇게 중간에 끊더라도 스크립트는 이어져서 진행이 된다. -->

	<form>
		<table>
			<caption>학생목록</caption>

			<tr>
				<th>사번</th>
				<th>이름</th>
				<th>부서</th>
			</tr>
			<%
				while (rset.next()) { // rset의 데이터가 없어질때 까지 진행된다. foreach와 비슷한 용도이다.

				String number = rset.getString("number");
				String name = rset.getString("name");
				String team = rset.getString("team");
			%>
			<!-- 마찮가지로 쪼갰지만 하나로 연결이 되어있다고 봐도 무방하다. -->
			<tr>
				<td><%=number%></td>
				<td><%=name%></td>
				<td><%=team%></td>
			</tr>
			<!-- 이와같은 형식으로 혼용 사용이 가능하다. -->
			<%
				}
			%>

		</table>
	</form>
	<%
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