<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>�� ���</h1>
<table>
	<col width="50"><col width="300"><col width="100"><col width="100">
	<tr>
		<th>�۹�ȣ</th>
		<th>�� ��</th>
		<th>�ۼ���</th>
		<th>�ۼ���</th>
	</tr>
	<c:choose>
		<c:when test="${empty list }">
			<tr>
				<td colspan="4">=========�ۼ��� ���� �����ϴ�.=========</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${list }" var="dto">
				<tr>
					<td>${dto.boardno }</td>
					<td>
						<c:forEach begin="1" end="${dto.titletab }">
							&nbsp;
						</c:forEach>
						<a href="answer.do?command=detail&boardno=${dto.boardno }">${dto.title }</a>
					</td>
					<td>${dto.writer }</td>
					<td>${dto.date }</td>
				
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	<tr>
		<td colspan="4">
			<input type="button" value="�۾���" onclick="location.href='answer.do?command=writeform'">
		</td>
	</tr>
</table>

</body>
</html>