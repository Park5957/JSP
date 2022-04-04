<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cookie_edit</title>
</head>
<body>
<b>Cookie Edit</b>
<br>

<%
		Cookie cookie = new Cookie("parkhunyong", "18yoon"); //같은 키값의 내용물을 바꿈으로 변경이 가능하다.
		cookie.setMaxAge(300); // 초단위 5분 쿠키생존 시간 설정
		response.addCookie(cookie);

		out.print("쿠키 변경완료<br>");
	%>
	<p>
	쿠키	  이름: <%=cookie.getName() %><br>
	쿠키 	     값: <%=cookie.getValue() %><br>
	쿠키 유효시간: <%=cookie.getMaxAge() %>초<br>
	</p>
	
	<p><a href="cookie_check.jsp">[쿠키확인]</a>

</body>
</html>