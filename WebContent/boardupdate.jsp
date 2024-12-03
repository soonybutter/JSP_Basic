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
<<<<<<< HEAD

</head>
<body>
<h1>글 수정</h1>
<form action="answer.do" method="post">
	<input type="hidden" name="command" value="boardupdate">
	<input type="hidden" name="boardno" value="${dto.boardno }">
	<table>
		<tr>
			<th>작성자</th>
			<td>${dto.writer }</td>
		</tr>
		<tr>
			<th>제 목</th>
			<td><input type="text" name="title" value="${dto.title }"></td>
		</tr>
		<tr>
			<th>내 용</th>
			<td><textarea rows="10" cols="40" name="content">${dto.content }"></textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="수정">
				<input type="button" value="취소"
				onclick="location.href='answer.do?command=detail&boardno=${dto.boardno}'">
				
			</td>
		</tr>
	</table>
</form>
=======
</head>
<body>
<%
	MVCBoardDto dto =(MVCBoardDto)request.getAttribute("dto");
%>

<h1>UPDATE</h1>
<form action="mycontroller.jsp" method="post">
	<input type ='hidden' name="command" value="boardupdate">
	<input type ="hidden" name="seq" value="<%=dto.getSeq()%>">
	<table>
		<tr>
			<th>SEQ</th>
			<td><%=dto.getSeq() %></td>
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
			<td><input type="text" name="title" value="<%=dto.getTitle() %>"></td>
		</tr>
		<tr>
			<th>CONTENT</th>
			<td><textarea rows="10" cols="40" name="content"><%=dto.getContent() %></textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type = "submit" value="update">
				<input type = "button" value="cancel" onclick="history.back();">
			</td>
		</tr>
		
	</table>

</form>

>>>>>>> practice/JSP_MVC_Mybatis
</body>
</html>