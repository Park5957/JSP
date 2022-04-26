<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<meta name=viewport content="width=device-width, initial-scale=1, user-scalable=0"><!-- 모바일 구동시 조건 -->
</head>
<body>
	<!-- CSS only -->
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
		crossorigin="anonymous">
		<div class = "container bg-Light shadow mx-auto mt-5 p-5 w-75" >
		<%@include file="utilMenu.jsp" %>
		
<form action="userAdd.jsp" method="post">
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">아이디</label>
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="id">
    <div id="emailHelp" class="form-text">*아이디는 8글자 이하로 하시기 바랍니다.</div>
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">비밀번호</label>
    <input type="password" class="form-control" id="exampleInputPassword1" name="pw">
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">닉네임</label>
    <input type="text" class="form-control" id="exampleInputPassword1" name="name">
  </div>
  
  <button type="submit" class="btn btn-primary">가입</button>
</form>
</div>
	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>