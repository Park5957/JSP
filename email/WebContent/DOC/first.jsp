<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--

<h3>이 파일은 first.jsp 입니다.</h3>
<jsp:forward page="second.jsp"></jsp:forward>

 위 forward 를 처리하기 때문에 이 문구가 출력은 되지 않는다.
하지만 주소창은 이 파일인  first.jsp 의 주소가 찍혀있다.
<p>===first.jsp의 페이지===</p>-->

<h3>이 파일은 first.jsp 입니다.</h3>
<%@include file="second.jsp" %>
<p>===first.jsp의 페이지===</p>

</body>
</html>