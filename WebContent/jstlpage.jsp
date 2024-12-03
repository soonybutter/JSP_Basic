<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 
	코어(c): 프로그램언어에서 제공하는 변수선언, 제어문 등의 기능 제공
	포맷(fmt): 숫자, 날짜 등을 포맷팅 하는 기능 제공
	함수(fn): 문자열을 제공하는 함수
	디비(sql): 디비 관련 기능 제공
	
 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- JSTL 이용해서 출력하자  -->
	<h1>JSTL Page</h1>
	<table>
		<tr>
			<th>name</th>
			<th>kor</th>
			<th>eng</th>
			<th>math</th>
			<th>sum</th>
			<th>avg</th>
		</tr>
		<c:forEach var="sc" items="${list }"> 
		<!-- 반복하겠다는 태그, item list 안에 있는 애들을 sc라는 변수에 담아 한줄씩 출력하겠다 -->
			<tr>
				<td>
				<!--
				<c:if test="${sc.name eq '이름1'}">
						홍길동
					</c:if>
				  -->
				  <c:if test="${sc.name eq '이름1'}">
						<c:out value="홍길동"/>
				  </c:if>
				  <c:choose>
				  		<c:when test="${sc.name eq '이름2' }">
				  			<c:out value="${sc.name }님!"></c:out>
				  		</c:when>
				  		<c:when test="${sc.name eq '이름3' }">
				  			<c:out value="${sc.name }님@@"></c:out>
				  		</c:when>
				  		<c:otherwise>
				  			<c:out value="누구...?"></c:out>
				  		</c:otherwise>
				  </c:choose>	
					
				</td>
				<td>${sc.kor }</td>
				<td>${sc.eng }</td>
				<td>${sc.math }</td>
				<td>${sc.sum }</td>
				<td>${sc.avg }</td>
			</tr>		
		</c:forEach>
	</table>
	<hr>
	<c:forEach var="i" begin="1" end="10" step="1">
		${i }<br>
	</c:forEach>
	
	<c:set var="test" value="${list.get(0).name }" scope="session"></c:set>
	<c:out value="${test }"></c:out>
	
	

</body>
</html>