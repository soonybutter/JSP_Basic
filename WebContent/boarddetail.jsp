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
<h1>�ۼ��� ����</h1>
<table>
	<tr>
		<th>�۹�ȣ</th>
		<td>${dto.boardno }</td>
	</tr>
	<tr>
		<th>�ۼ���</th>
		<td>${dto.writer }</td>
	</tr>
	<tr>
		<th>�ۼ���</th>
		<td>${dto.date }</td>
	</tr>
	<tr>
		<th>����</th>
		<td>${dto.title }</td>
	</tr>
	<tr>
		<th>����</th>
		<td><textarea rows="10" cols="40" readonly="readonly">${dto.content }</textarea></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="button" value="����" 
			onclick="location.href='answer.do?command=updateform&boardno=${dto.boardno}'">
			<input type="button" value="�亯��"
			onclick="location.href='answer.do?command=answerform&parentboardno=${dto.boardno}'">
			
			<input type="button" value="���" 
			onclick="location.href='answer.do?command=list'">
		</td>
	</tr>
</table>
	

</body>
</html>