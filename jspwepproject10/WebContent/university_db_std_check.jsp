<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인확인</title>
</head>
<body>
	<%@ include file = "detabase_connection.inc" %>
<%
// 디비 검색

   String hakbun = request.getParameter("hakbun");
   String sql = "SELECT * from student where hakbun = ?";
   pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, hakbun);
   rset = pstmt.executeQuery();
   
// 1 아이디가 디비에 없는 경우
// 2 아이디는 있는데 비번이 틀리는 경우 

// 3 아이디와 비번 모두 일치하는 경우 (로그인 승인)



// 질의 결과 확인 
   if (!rset.isBeforeFirst()) {
      response.sendRedirect("university_db_login.jsp");
      
/*       out.print("<script>alert('존재하지 않는 학생입니다. !!');"
      + "history.back();"
      + "</script>"); */
   }else{
   out.print("학생 정보 검색 성공!<br>");
   
   rset.next();  // 다음 즉 첫번째 로 이동
   
   String db_hakbun = rset.getString("hakbun");
   String db_name = rset.getString("name");
   
   if (hakbun.equals(db_hakbun)) {
      session.setAttribute("hakbun", db_hakbun);
      session.setAttribute("name", db_name);

   out.print(session.getAttribute("hakbun") + "(" + session.getAttribute("name") + ") 님 방문을 환영합니다.<br>");
   
   }}



%>
<a href="university_db_logout.jsp">[로그아웃]</a>
</body>
</html>