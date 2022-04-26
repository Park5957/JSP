<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jdbc.*" %>
	<%@ page import="java.util.ArrayList" %>
	<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name=viewport content="width=device-width, initial-scale=1, user-scalable=0"><!-- 모바일 구동시 조건 -->
</head>
<body>
<!-- CSS only -->
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
		crossorigin="anonymous">
<%@include file="utilMenu.jsp" %>
<% 

ArrayList<MemoDTO> memos = (new MemoDAO()).getDelList(); 
for (MemoDTO memo : memos){
	

%>

<div class="card text-center">
  <div class="card-header">
   스케쥴 카드
  </div>
  <div class="card-body">
    <h5 class="card-title">작성자 : <%=memo.getUid() %></h5>
    <p class="card-text">메모내용 : <%=memo.getMtext() %> </p>
    <a href="memoUpdate.jsp?mid=<%=memo.getMid() %>" class="btn btn-primary">복구</a>
  </div>
  <div class="card-footer text-muted">
    작성시간 : <%=memo.getMtime() %>
  </div>
</div>
<%
} %>


	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>