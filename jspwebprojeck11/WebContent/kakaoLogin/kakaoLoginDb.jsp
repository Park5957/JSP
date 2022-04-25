<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>kakao로그인 사용자 정보확인 DB 대용</h1><br><br>
<% String nick = request.getParameter("nickname"); 
   String mail = request.getParameter("mail");
   String gender = request.getParameter("gender"); 
   String birthday = request.getParameter("birthday");
%>

<%=nick %><br>
<%=mail %><br>
<%=gender %><br>
<%=birthday %><br>
</body>
</html>