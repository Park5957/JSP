<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%if(session.getAttribute("username")!=null){ %><h3><%=session.getAttribute("username")%>님 환영합니다.</h3><%} %>
<div align="center">

<div class="btn-group" role="group" aria-label="Basic example" >
  <a type="button" class="btn btn-primary" href="main.jsp">전체 메모 보기</a>
  <a type="button" class="btn btn-danger" href="memoDelList.jsp" >삭제 메모 보기</a>
  <div class="btn-group" role="group">
    <button id="btnGroupDrop1" type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
      회원메뉴
    </button>
    <ul class="dropdown-menu" aria-labelledby="btnGroupDrop1">
      <li><a class="dropdown-item" href="userJoin.jsp">회원가입</a></li>
      <li><a class="dropdown-item" href="#">회원탈퇴</a></li>
    </ul>
  </div>
    <div class="btn-group" role="group">
    <button id="btnGroupDrop1" type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
      로그인메뉴
    </button>
    <ul class="dropdown-menu" aria-labelledby="btnGroupDrop1">
      <li><a class="dropdown-item" href="userLogin.jsp">로그인</a></li>
      <li><a class="dropdown-item" href="userLogoutDb.jsp">로그아웃</a></li>
    </ul>
  </div>
</div>
 </div>