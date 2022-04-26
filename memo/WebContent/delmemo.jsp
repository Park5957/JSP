<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="jdbc.*" %>
    <%
	request.setCharacterEncoding("UTF-8");
%>
<% String mid = request.getParameter("mid");
   String uid = "test";
   
   
   MemoDAO dao = new MemoDAO();
   dao.delete(mid);
   response.sendRedirect("main.jsp"); //다시 메인으로 돌려보냄
   



%>
