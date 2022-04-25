<%@page import="java.sql.*"%>
<%@page import="jdbc.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 리스트</title>
</head>
<body>
	<!-- CSS only -->
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
		crossorigin="anonymous">
		
<%-- <%@ include file="header.jsp" %> <!-- 메뉴판 입력 --> --%> 
	<%
	

		request.setCharacterEncoding("UTF-8"); // 한글 구동용%>
		<%@ include file = "detabase_connection.inc" %>
<%
	//입력된 컬럼값 출력 SQL

	String sql = "SELECT * FROM listgi";
	pstmt = conn.prepareStatement(sql);

	rset = pstmt.executeQuery();
	%>


	
	

	<div class="container bg-warning shadow mx-auto mt-5 p-5 w-75">
	<div class="alert alert-warning text-center" role="alert"> 게시판</div>


		<table class="table table-striped table-hover">

			<thead>
				<tr>
					<th scope="col">넘버링</th>
					<th scope="col">닉네임</th>
					<th scope="col">제목</th>
					<th scope="col">평점</th>
					<th scope="col">게시시간</th>
					
					
				</tr>
			</thead>
			<tbody>

				<%
					int no = 1;
				while (rset.next()) {

					String gNum = rset.getString("gNum");
					String gNicName = rset.getString("gNicName");
					String gTitle = rset.getString("gTitle");
					String gPNumber = rset.getString("gPNumber");
					String gTime = rset.getString("gTime");
				%>
		
					<form class="row g-3" action="Board_View<%=no%>.jsp" method="post">
				  <tr>
				    <th scope="row"> <div type="text"><%=no%></div></th>
					<td><%=gNicName%></td>
					<td><a href="view/Board_View.jsp?gNum"><%=gTitle%></a></td>
					<td><%=gPNumber%></td>
					<td><%=gTime%></td>
					</tr>
				

				<%
					no++;
				}
				%>
				</form>	

			</tbody>
		</table>
	<nav aria-label="Page navigation example">
  <ul class="pagination">
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>
	
		<div class="btn-group">
  <a href="boardWrite.jsp" class="btn btn-primary active" aria-current="page">글쓰기</a>
  
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