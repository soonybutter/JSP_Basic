<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<<<<<<< HEAD
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    
=======

<% request.setCharacterEncoding("UTF-8"); %> 
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ page import="com.mvc.dto.MVCBoardDto" %>
>>>>>>> practice/JSP_MVC_Mybatis
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<<<<<<< HEAD
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
	

=======
<%
	MVCBoardDto dto = (MVCBoardDto)request.getAttribute("dto");
%>

<h1>DETAIL</h1>
<table>
	<tr>
		<th>SEQ</th>
		<td><%=dto.getSeq()%></td>
	</tr>
	<tr>
		<th>WRITER</th>
		<td><%=dto.getWriter() %></td>
	</tr>
	<tr>
		<th>DATE</th>
		<td><%=dto.getRegdate() %></td>
	</tr>
	<tr>
		<th>TITLE</th>
		<td><%=dto.getTitle() %></td>
	</tr>
	<tr>
		<th>CONTENT</th>
		<td><textarea rows="10" cols="40" readonly="readonly"><%=dto.getContent() %></textarea></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="button" value="update" 
			onclick="location.href='mycontroller.jsp?command=boardupdateform&seq=<%=dto.getSeq()%>'">
			<input type="button" value="delete" 
			onclick="location.href='mycontroller.jsp?command=boarddelete&seq=<%=dto.getSeq()%>'">
			<input type="button" value="list" onclick="location.href='mycontroller.jsp?command=boardlist'">
						
		</td>
	</tr>
</table>
>>>>>>> practice/JSP_MVC_Mybatis
</body>
</html>