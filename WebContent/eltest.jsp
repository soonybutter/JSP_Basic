<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@page import="com.el.controller.Score" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	Score score = (Score)request.getAttribute("sc");
%>

<h1>EL Page</h1>
<table>
	<tr>
		<th colspan="2"><%=score.getName() %> 님의 점수는...</th>
	</tr>
	<tr>
		<th>국어</th>
		<td><%=score.getKor() %></td>
	</tr>
	<tr>
		<th>영어</th>
		<td><%=score.getEng() %></td>
	</tr>
	<tr>
		<th>수학</th>
		<td>${sc.math }</td>
	</tr>
	<tr>
		<th>총점</th>
		<td>${sc.sum }</td>
	</tr>
	<tr>
		<th>평균</th>
		<td>${requestScope.sc.avg }</td> <!-- requestScope 적어주면 속도 더 빨라짐 (권장) -->
	</tr>
</table>

<hr>

<c:out value="${test }"></c:out>

</body>
</html>