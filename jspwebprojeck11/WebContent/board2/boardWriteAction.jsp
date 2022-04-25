<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "org.apache.commons.fileupload.*" %>
<%@ page import = "org.apache.commons.fileupload.disk.*" %>
<%@ page import = "org.apache.commons.fileupload.servlet.*" %>
<%@ page import = "util.FileUtil"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작성완료</title>
</head>
<body>

<!-- CSS only -->
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
		crossorigin="anonymous">
<div class="alert alert-secondary" role="alert" align="center">
글 작성이 완료되었습니다.
<a class="btn btn-primary" href="Board_List.jsp" role="button" type="submit" align="center" >확인</button>
</div>


<%
	request.setCharacterEncoding("utf-8");


String gTitle = request.getParameter("btitle");
String gText = request.getParameter("bcontent");
//로그인 사용자의 기능을 분리한채 만들어 졌음으로 로그인 사용자 병합으로 재구성해야함.
gDBDAO dao = new gDBDAO();
if(dao.insert(gTitle, gText)){ 
	response.sendRedirect("boardList.jsp");
}else{
	out.print("글 작성 중 에러 발생");
}
%>




<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
	
	
	
</body>
</html>