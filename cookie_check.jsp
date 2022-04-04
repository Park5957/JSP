<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cookie check</title>
</head>
<body>
<b>Cookie Check</b>
<br>
<%
Cookie[] cookies = request.getCookies();

if(cookies != null){
	for(int i = 0; i < cookies.length; i++){
		String name = cookies[i].getName();
		String value = cookies[i].getValue();
		
		out.print("쿠키이름 : " +name+"<br>");
		out.print("쿠키  값 : " +value+"<br><br>");
		
	}
}else {
	out.print("성절된 쿠기 정보가 없습니다.");
}
%>

	<p><a href="cookie_delete.jsp">[쿠키삭제]</a> <a href="cookie_create.jsp">[쿠키생성]</a> <a href="cookie_edit.jsp">[쿠키변경]</a></p>

</body>
</html>