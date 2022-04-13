<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page errorPage = "MyError.jsp" %> <!-- 에러가발생을 한다면 이 페이지로 이동해라. -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%String str = null;
out.print(str.toString());
%>

<!-- 이하 메모는 위 에러메세지와는 관련없는 다른것임 -->
<%-- page<%@page ......%> JSP 페이지에 대한 정보를 설정
include<%@include ....... %> JSP페이지의 특정 영역에 다른 문서를 포함한다.

language 속성 jsp페이지에서 사용할 언어를 설정한다.

comtemtType 속성 jsp 페이지의 콘텐츠 유형을 설정한다.
			text/html  text/xml  text/plain
			
			문자열 세트 설정 charset=UTF-8 호 한글을 사용한다.
 --%>


</body>
</html>