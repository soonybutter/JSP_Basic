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
		<th colspan="2"><%=score.getName() %> ���� ������...</th>
	</tr>
	<tr>
		<th>����</th>
		<td><%=score.getKor() %></td>
	</tr>
	<tr>
		<th>����</th>
		<td><%=score.getEng() %></td>
	</tr>
	<tr>
		<th>����</th>
		<td>${sc.math }</td>
	</tr>
	<tr>
		<th>����</th>
		<td>${sc.sum }</td>
	</tr>
	<tr>
		<th>���</th>
		<td>${requestScope.sc.avg }</td> <!-- requestScope �����ָ� �ӵ� �� ������ (����) -->
	</tr>
</table>

<hr>

<c:out value="${test }"></c:out>

</body>
</html>