<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="jdbc.*" %>
    <%
	request.setCharacterEncoding("UTF-8");
%>
<% String mtext = request.getParameter("memo");
   String uid = "test";
   
   
   MemoDAO dao = new MemoDAO();
   dao.insert(uid,mtext);
   response.sendRedirect("main.jsp"); //다시 메인으로 돌려보냄
   



%>
