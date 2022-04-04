<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forward action</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<b>forward action 태그</b>

	<%
		String msg = "forward action teg test";
	%>

	<jsp:forward page="inc_sum_for.jsp"></jsp:forward>
	
	<!-- 위 파일로 이동한 이후이기에 아래의 message 는 출력되지 않는다. -->
	<!-- 하지만 출력된 주소창의 변경은 없다. -->
	<!-- +++ 맨 위에 적은 메세지도 출력되지 않는다. 사용시 주의하기 바란다. -->
	
	<b>message print : <%=msg%></b>
</body>
</html>