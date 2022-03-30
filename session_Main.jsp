<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String sid = (String) session.getAttribute("id");//섹션에서 뽑아냄
if (sid == null) { //섹션 id의 값이 없음을 확인한다면
	out.print("로그인 정보가 없습니다.");
} else {//섹션게 값을 확인 회원페이지로 진입성공
	out.print("회원페이지 입니다. by 18.박현용");
}
%>