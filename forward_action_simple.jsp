<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forward action2</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<b>forward 단일 파라미터</b>

	<%
		String msg = "forward 단일 파라미터";
	%>

	<jsp:forward page="inc_act_simple.jsp">
		<jsp:param value="p1 값" name="para1" />
		<jsp:param value="p2 값" name="para2" />
		<jsp:param value="파라미터3 값" name="para3" />
	</jsp:forward>
	
	<!-- 요청된 inc_act_simple.jsp 이외의 내용은 전혀 출력되지 않음을 확인할 수 있다.  -->

	<b>message print : <%=msg%></b>
</body>
</html>