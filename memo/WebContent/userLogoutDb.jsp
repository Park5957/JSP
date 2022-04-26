<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    session.invalidate(); //연결되어있는 세선 종료
    out.print("<script> alert('로그아웃이 완료되었습니다.');");%>
    history.back();
    <%out.print("</script>");
    
    
    %>

