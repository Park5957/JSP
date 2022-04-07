<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8"); // 한글 구동용
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
</head>
<body>
<%
out.print(session.getAttribute("hakbun") + "(" + session.getAttribute("name") + ") 님 방문을 환영합니다.<br>");
session.invalidate();

out.print("로그아웃 하셨습니다.<br><br>");
//response.sendRedirect("session_login_form.jsp"); //이와같은 문법을 사용하면 자동으로 해당 페이지로 이동된다.
%>


<a href="university_db_login.jsp">[로그인 하기]</a><br>


out.print("로그아웃 되었습니다.");




%>
</body>
</html>