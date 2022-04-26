<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="jdbc.*" %>
	<%@ page import="java.util.ArrayList" %>
	<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<meta name=viewport content="width=device-width, initial-scale=1, user-scalable=0"><!-- 모바일 구동시 조건 -->
</head>
<body>
	<!-- CSS only -->
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
		crossorigin="anonymous">
		
<form class="row g-3" action="memoadd.jsp" method="post">
<div class="alert alert-secondary" role="alert">
<div class="input-group mb-3">
  <input type="text" class="form-control" placeholder="메모를 작성하세요" aria-label="Recipient's username" aria-describedby="button-addon2" name="memo">
  <input type="submit" class="btn btn-dark" value="저장">
</div>

<!-- <div align="right">
<a href="memoDelList.jsp" class="btn btn-danger">삭제 메모 보기</a>
</ahref> -->

<%@include file="utilMenu.jsp" %>
</from>
</div>
<% 

ArrayList<MemoDTO> memos = (new MemoDAO()).getList(); 
for (MemoDTO memo : memos){
	

%>

<div class="card text-center">
  <div class="card-header">
   스케쥴 카드
  </div>
  <div class="card-body">
    <h5 class="card-title">작성자 : <%=memo.getUid() %></h5>
    <p class="card-text">메모내용 : <%=memo.getMtext() %> </p>
    <a href="delmemo.jsp?mid=<%=memo.getMid() %>" class="btn btn-primary">삭제</a>
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