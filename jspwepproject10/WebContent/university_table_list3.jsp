<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="university_list3.css" rel="stylesheet" type="text/css"> <!-- jsp 에서 css 파일 가지고 오기 -->

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
		%>
		
		<%@ include file = "detabase_connection.inc" %>

	//입력된 컬럼값 출력 SQL

	String sql = "SELECT * FROM student"; //데이터 가지고 오기
	pstmt = conn.prepareStatement(sql); // 명령을 요청후 pstmt에 들어온다.

	rset = pstmt.executeQuery(); // Query로 rest에 가지고오는 데이터를 입력한다.
	%>
	<!-- 이렇게 중간에 끊더라도 스크립트는 이어져서 진행이 된다. -->
	
	

	<form>
		<div class="card" style="width: 18rem;">

			<table>
				<caption></caption>

				<%
					String[] imgg = { "img1.gif", "img2.gif", "img3.jpg" };
				int count = 0;
				while (rset.next()) { // rset의 데이터가 없어질때 까지 진행된다. foreach와 비슷한 용도이다.

					String number = rset.getString("hakbun");
					String name = rset.getString("name");
					String gender = rset.getString("gender");
					String year = rset.getString("year");
					String dept = rset.getString("dept");
					String addr = rset.getString("addr");
				%>
			
				<tr>
					<td><img src=<%=imgg[count]%> class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">
								학번 :
								<%=number%></h5>
							<p class="card-text">
								이름 :
								<%=name%><br> 성별 :<%=gender%>학년 :<%=year%><br>과목 :<%=dept%><br>주소
								:<%=addr%></p>
							<a href="#" class="btn btn-primary">Go somewhere</a>
						</div></td>
				</tr>
				
				<%
					count = count += 1;
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