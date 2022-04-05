<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session_delete</title>
</head>
<body>
	<b>세션 삭제<br></b>

	<p>
		세션 아이디 :
		<%=session.getAttribute("id")%><br> 
		세션 네임:
		<%=session.getAttribute("name")%><br>
	</p>
	
	<p>
	<%
	session.removeAttribute("id");
	session.removeAttribute("name");
	out.print("세션 속성을 삭제하였습니다.");
	%>
	</p>
	
	<h3>세션 삭제 처리후 확인<br></h3>
	<p>
	
		세션 아이디 :
		<%=session.getAttribute("id")%><br> 
		세션 네임:
		<%=session.getAttribute("name")%><br>
	</p>
	
	
	<a href="session_check.jsp">[세션확인]</a>

</body>
</html>