<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
int sum = 0;

for (int i = 0; i<=10; i++){
	sum = sum+i;
}

%>

1부터 10까지 정수의 합은 <%=sum %>이다

