<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8"); // 한글 구동용
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
</head>
<body>
	<%!// 선언문
	String title = "게시판 목록";%>
	<!-- CSS only -->
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
		crossorigin="anonymous">

	<%@ include file="/_header.jsp"%>
	<div class="alert alert-secondary" role="alert">
		<div class="container">
			<h1 class="display-3">
				<%=title%>
			</h1>
		</div>
	</div>

	<div class="container">
		<div class="row" align="center">

			<div class="container my-3">
				<table class="table">
					<thead>
						<tr class="table-dark">
							<th>번호</th> <!-- 게목구간 타이틀 -->
							<th>작성자</th>
							<th>제목</th>
							<th>좋아요수</th>
							<th>작성일시</th>
						</tr>
					</thead>
					<tbody>


						<%@ include file="detabase_connection.inc"%>
						<!-- BD 끌어오는 폴더지정 -->
						<%
							String sql = "SELECT count(*) FROM listgi"; //DB테이블 총 갯수 sql변수 선언
						pstmt = conn.prepareStatement(sql);
						rset = pstmt.executeQuery();

						//필요 변수들 선언
						int LINE_PER_PAGE = 5; //페이지당 출력 줄수  - 추후 총 페이지당 노출되는 게시글을 보고 싶다면 이 부분을 조정하면됨
						int PAGE_PER_BLOCK = 5; //블럭당 페이지 수

						int nbr_of_row = 0; //게시물의 총수/ 사람의 총수/ 테이블 하나 전체의 갯수
						int nbr_of_page = 0; //총 페이지 수

						int start_pointer = 0; // DB 검색 시작 위치
						int cur_page_no = 0; // 현재 페이지 번호
						int block_nbr = 0; // 블럭 번호
						int block_start_page_no = 0; // 블럭 시작 페이지 번호
						int block_endpage_no = 0; // 블럭 끝 페이지 번호
						int previous_block_start_pageno = 0; //이전 블럭 시작 페이지 번호
						int next_block_start_pageno = 0; //다음 블럭 시작 페이지 번호

						// 총 게시물 개수(총 회원의 수, 테이블 전체의 수) 계산

						rset.next();
						nbr_of_row = Integer.parseInt(rset.getString("count(*)"));

						// 총 페이지 수 계산 ...............ceil 올림   floor 버림 round 반올림

						nbr_of_page = (int) Math.ceil((float) nbr_of_row / LINE_PER_PAGE);

						// 검색 페이지 확인
						if (request.getParameter("pageno") == null) {
							//맨처음 검색
							cur_page_no = 1;
						} else if (nbr_of_page < Integer.parseInt(request.getParameter("pageno"))) {
							// DB검색 시작 위치 계산
							cur_page_no = nbr_of_page;
						} else {
							//특정 페이지 검색 
							cur_page_no = Integer.parseInt(request.getParameter("pageno"));
						}

						// DB 검색 시작 위치와 갯수
						start_pointer = (cur_page_no - 1) * LINE_PER_PAGE;

						//SQL 처리

						sql = "SELECT * FROM listgi ORDER BY gNum DESC LIMIT ?,?"; //DB PK 지정 및 역순출력
						pstmt = conn.prepareStatement(sql);
						pstmt.setInt(1, start_pointer);
						pstmt.setInt(2, LINE_PER_PAGE);
						rset = pstmt.executeQuery();

						if (!rset.isBeforeFirst())
							out.print("<script>alert('데이터가 없습니다. ');" + "history.back();" + "</script>");
						%>

						<%
							int no = 1;
						while (rset.next()) {

							String gNum = rset.getString("gNum");
							String gNicName = rset.getString("gNicName");
							String gTitle = rset.getString("gTitle");
							String gText = rset.getString("gText");
							String gPNumber = rset.getString("gPNumber");
							String gTime = rset.getString("gTime");
						%>

						<tr>
							<td><%=gNum%></td>
							<td><%=gNicName%></td>
							<td><a href="boardView.jsp?gNum=<%=gNum%>"><%=gTitle%></td>
							<!-- 해당 게시글 좌표 지정 -->
							<td><%=gPNumber%></td>
							<td><%=gTime%></td>

						</tr>
						<tr>
							<td colspan=5 align="center">
								<%
									}
								%> <!-- 이하 게시판 번호표 -->
								<nav aria-label="Page navigation example">
									<ul class="pagination justify-content-center">
										<li class="page-item disabled"></li>
										<%
											block_nbr = ((cur_page_no - 1) / PAGE_PER_BLOCK) + 1;

										block_start_page_no = ((block_nbr - 1) * PAGE_PER_BLOCK) + 1;

										block_endpage_no = (block_start_page_no + PAGE_PER_BLOCK) - 1;

										if (cur_page_no == 1) {
											out.print("&nbsp<a class='page-link bg-secondary text-dark' href='#'>맨처음</a>&nbsp");

										} else if (cur_page_no > 1) {
											out.print("&nbsp<a class='page-link' href='boardListPage.jsp?pageno=1'>" + "맨처음</a>&nbsp");

										}
										previous_block_start_pageno = cur_page_no - 1;
										if (previous_block_start_pageno > 0) {
											out.print(
											"&nbsp<a class='page-link' href='boardListPage.jsp?pageno=" + previous_block_start_pageno + "'>이전</a>&nbsp");
										} else {
											out.print("&nbsp<a class='page-link bg-secondary text-dark' href='#'>이전</a>&nbsp");
										}

										for (int pgn = block_start_page_no; pgn <= block_endpage_no + 1; pgn++) {
											if (pgn > nbr_of_page) {
												break;
											}

											if (pgn == cur_page_no) {
												out.print("&nbsp" + "<li class='page-item'><a class='page-link' href='#'><b>" + pgn + "</b></a></li>&nbsp");
											}

											else {

												out.print("&nbsp" + "<li class='page-item'><a class='page-link' href='boardListPage.jsp?" + "pageno=" + pgn + "'>"
												+ pgn + "</a></li>&nbsp");
											}

										}

										if (cur_page_no < nbr_of_page) {

											next_block_start_pageno = cur_page_no + 1;

											out.print("&nbsp<a class='page-link' href='boardListPage.jsp?pageno=" + next_block_start_pageno + "'>다음</a>&nbsp");
										} else {
											out.print("&nbsp<a class='page-link bg-secondary text-dark' href='#'>다음</a>&nbsp");

										}
										if (cur_page_no < nbr_of_page) {

											next_block_start_pageno = block_endpage_no + 1;
											out.print("&nbsp<a class='page-link' href='boardListPage.jsp?pageno=" + nbr_of_page + "'>맨끝</a>&nbsp");
										} else {
											next_block_start_pageno = block_endpage_no + 1;
											out.print("&nbsp<a class='page-link bg-secondary text-dark' href='#'>맨끝</a>&nbsp");

										}
										%>
									
							</td>
						</tr>
						</li>
						</ul>
						</nav>




					</tbody>


				</table>

				<a href="boardWrite.jsp" class="btn btn-primary active"
					aria-current="page">글작성</a>
				<!-- 글 쓰기 파일명 경로-->

			</div>

		</div>
		<hr>
	</div>
	</tbody>
	</table>
	</div>

	</div>
	<hr>
	</div>


	<%@ include file="/_footer.jsp"%>


	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>