<%@page import="com.mysql.cj.x.protobuf.MysqlxSql.StmtExecute"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="java.beans.Statement"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	Class.forName("com.mywql.jdbc.Diver");
    connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "0000");
 //  Statement stmt = conn.createStatement();
 	 //Resultset re = StmtExecute.executeQurey("");
%>
