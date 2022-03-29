<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String uid = request.getParameter("id");
String ups = request.getParameter("ps");
%>

<%--위 코드를 통해 Login.html에서 보내온 name의 id와 ps의 사용자 입력 값을
이곳으로 가지고 온 뒤 각 이름에 대응하는 변수를 선언한다.--%>

<h3>User ID:<%=uid %></h3> <%--선언된 변수를 출력한다. --%>
<h3>User PS:<%=ups %></h3> 
<h5>by 18.박현용</h5>
</body>
</html>