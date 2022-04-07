// .inc 라는 파일을 자바문법으로 text 형식으로 입력이 가능하도록 만듬

<%
// DB 연결 종료
   if (rset != null) rset.close();
   if (pstmt != null) pstmt.close();
   if (conn != null) conn.close();
%>