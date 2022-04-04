<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String[] para1 = request.getParameterValues("para1");
// 여러개의 파라미터 값을 보관하기 위해 배열로 생성

if (para1 != null){
	for(int i =0; i<para1.length; i++){
		out.print("전송 파라미터1 : " + para1[i]+"<br>");
	}
}


%>


전송파라미터2 : <%=request.getParameter("para2") %><br>
전송파라미터3 : <%=request.getParameter("para3") %><br>
</body>
</html>