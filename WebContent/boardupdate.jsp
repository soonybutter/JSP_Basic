<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

</head>
<body>
<h1>�� ����</h1>
<form action="answer.do" method="post">
	<input type="hidden" name="command" value="boardupdate">
	<input type="hidden" name="boardno" value="${dto.boardno }">
	<table>
		<tr>
			<th>�ۼ���</th>
			<td>${dto.writer }</td>
		</tr>
		<tr>
			<th>�� ��</th>
			<td><input type="text" name="title" value="${dto.title }"></td>
		</tr>
		<tr>
			<th>�� ��</th>
			<td><textarea rows="10" cols="40" name="content">${dto.content }"></textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="����">
				<input type="button" value="���"
				onclick="location.href='answer.do?command=detail&boardno=${dto.boardno}'">
				
			</td>
		</tr>
	</table>
</form>
</body>
</html>