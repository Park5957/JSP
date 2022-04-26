<%@page import="sun.nio.cs.HistoricallyNamedCharset"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="jdbc.*" %>
    <%
	request.setCharacterEncoding("UTF-8"); 
    String userid = request.getParameter("id");
    String userpw = request.getParameter("pw");
    String username = request.getParameter("name");
    
    UserDAO dao = new UserDAO();
    
	    
	if (dao.exists(userid)) {
	      out.print("<script> alert('존재하지 않는 아이디 입니다. 다시 입력하세요');");%>
	         history.back();         
	         <%out.print("</script>");
	   }else{
	      dao.delete(userid); 
	      session.removeAttribute("userid");
	      response.sendRedirect("main.jsp");
	      }

    %>