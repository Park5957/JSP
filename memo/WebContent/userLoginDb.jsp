<%@page import="sun.nio.cs.HistoricallyNamedCharset"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="jdbc.*" %>
    <%
	request.setCharacterEncoding("UTF-8"); 
    String userid = request.getParameter("id");
    String userpw = request.getParameter("pw");
    
    
    UserDAO dao = new UserDAO();
    
    //로그인 결과 3개 리턴
    int result = dao.login(userid, userpw);
	    
	if (result == 1 ) { //DB에 아이디 자체가 존재하지 않음으로 회원가입으로 리다이렉트
	      out.print("<script> alert('존재하지 않는 아이디 입니다. 회원가입 페이지로 이동합니다.');");%>
	         <%out.print("</script>");
	         response.sendRedirect("userJoin.jsp");
	         
	   }else if(result == 2){ //아이디가 있으나 비밀번호 불일치
		      out.print("<script> alert('암호가 일치하지 않습니다. 다시 로그인 하시기 바랍니다.');");%>
		         history.back();         
		         <%out.print("</script>");
	}else{
	      session.setAttribute("userid", userid);
	      response.sendRedirect("main.jsp");
	      }

    %>