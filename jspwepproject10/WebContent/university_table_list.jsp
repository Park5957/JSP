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
		
<%@ include file="university_menu.jsp" %> <!-- 메뉴판 입력 --> 
	<%
	

		request.setCharacterEncoding("UTF-8"); // 한글 구동용%>
		<%@ include file = "detabase_connection.inc" %>
<%
	//입력된 컬럼값 출력 SQL

	String sql = "SELECT * FROM student";
	pstmt = conn.prepareStatement(sql);

	rset = pstmt.executeQuery();
	%>

	</table>
	</form>
	
	

	<div class="container bg-warning shadow mx-auto mt-5 p-5 w-75">
	<div class="alert alert-warning text-center" role="alert"> 학생정보</div>


		<table class="table table-striped table-hover">

			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">학번</th>
					<th scope="col">이름</th>
					<th scope="col">성별</th>
					<th scope="col">학년</th>
					<th scope="col">전공</th>
					<th scope="col">주소</th>
				</tr>
			</thead>
			<tbody>

				<%
					int no = 1;
				while (rset.next()) {

					String hakbun = rset.getString("hakbun");
					String name = rset.getString("name");
					String gender = rset.getString("gender");
					String year = rset.getString("year");
					String dept = rset.getString("dept");
					String addr = rset.getString("addr");
				%>
				<tr>
					<th scope="row"><%=no%></th>
					<td><%=hakbun%></td>
					<td><%=name%></td>
					<td><%=gender%></td>
					<td><%=year%></td>
					<td><%=dept%></td>
					<td><%=addr%></td>
				</tr>

				<%
					no++;
				}
				%>



			</tbody>
		</table>
		<div class="btn-group">
  <a href="university_table_input2.jsp" class="btn btn-primary active" aria-current="page">[학생입력]</a>
  <a href="#" class="btn btn-primary">Link</a>
  <a href="#" class="btn btn-primary">Link</a>
</div>
		

</div>


	</div>





	<%
		// DB 연결 종료
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	%>

	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

</body>
</html>