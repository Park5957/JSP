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
	<!-- CSS only -->
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
		crossorigin="anonymous">

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
	<div class="card" style="width: 18rem;">

		<table>
			<caption></caption>

			<%
			String[] imgg = {"img1.gif","img2.gif"};
			int count = 0;
				while (rset.next()) { // rset의 데이터가 없어질때 까지 진행된다. foreach와 비슷한 용도이다.

				String number = rset.getString("number");
				String name = rset.getString("name");
				String team = rset.getString("team");
				
			%>
			
			<tr>
				<td>
						<img src=<%=imgg[count] %> class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">사원번호 : <%=number %></h5>
							<p class="card-text">이름 : <%=name %><br> 팀 :<%=team %></p>
							<a href="#" class="btn btn-primary">Go somewhere</a>
						</div>
					</td>
			</tr>
			
			<%
			count = count+=1;
				}
			%>

		</table>
		</div>
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
	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>