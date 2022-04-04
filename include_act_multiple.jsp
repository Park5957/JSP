<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>include 다중 파라미터</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8");%>
<b>include 다중 파라미터</b><br>

<jsp:include page="inc_act_multiple.jsp">
	<jsp:param value="p1 값1" name="para1"/>
	<jsp:param value="p1 값2" name="para1"/>
	<jsp:param value="p1 값3" name="para1"/>
	<jsp:param value="p2 값" name="para2"/>
	<jsp:param value="파라미터3 값" name="para3"/>
</jsp:include>
<br><p>18.박현용</p>
</body>
</html>