<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>welcome.jsp</title>
</head>
<body>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<%@include file="_header.jsp" %>

<%! //선언문 : 선언문을 사용한 이유는 전역변수로 선언하기 위해서이다.
   String greeting = "Welcome to e-MALL";
   String tagline = "Welcome to Web Market!!!";
   %>
   <!-- 표현문 -->
 <div class = "alert alert-secondary" role ="alert"> <!-- html5 이상 전용으로 박스형태의 컨테이너를 만드는 구문 -->
 <div class = "container">
 <h1 class = "display-3"><%=greeting %></h1>
 </div>
 </div>
 
 <div calss = "container">
 <div class = "text-center">
 <h3><%=tagline %></h3>
 <% Date day = new Date(); //날짜를 작성하기위해 사용 상단에 java.util.* 이 필요함 
 
 int hour = day.getHours();
 int minute = day.getMinutes();
 int second = day.getSeconds();
 
 String CT = hour +":"+minute+":"+second;
 out.print("현재접속시각 : "+CT+"\n");
 %>
 
  </div><hr></div><!-- 믿줄 -->
  
 <%@include file="_footer.jsp" %>
 <!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>