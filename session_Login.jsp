<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String uid = request.getParameter("id"); //uid에 유저 id 지정
if (uid == null) {
	out.print("로그인 정보가 없습니다.");
} else {
	session.setAttribute("id", uid); //섹션에 저장
	response.sendRedirect("session_Main.jsp");
}
%>