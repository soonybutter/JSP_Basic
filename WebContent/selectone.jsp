<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8");%>

<%@ page import="com.my.model.dao.MyBoardDao" %>    
<%@ page import="com.my.model.dto.MyBoard" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
	//1. �Ķ���ͷ� �Ѿ���� myno �ޱ�
	// getParameter�� ������ value�� String Ÿ��.. int�� parseint������
	int myno = Integer.parseInt(request.getParameter("myno"));
	
	MyBoardDao dao = new MyBoardDao();
	MyBoard dto = dao.selectOne(myno);
	
%>
<table>
	<tr>
		<th>NAME</th>
		<td><%=dto.getMyname() %></td>
	</tr>
	<tr>
		<th>TITLE</th>
		<td><%=dto.getMydate() %></td>
	</tr>
	<tr>
		<th>CONTENT</th>
		<td>
			<textarea rows="10" cols="40" readonly="readonly">
			<%=dto.getMycontent() %></textarea>
		</td>
	</tr>
	<tr>
		<td colspan ="2">
			<button onclick="location.href='myupdate.jsp?myno=<%=dto.getMyno()%>'">update</button> &nbsp;
			<button onclick="location.href='mydelete.jsp?myno=<%=dto.getMyno()%>'">delete</button> &nbsp;
			<button onclick="location.href='mylist.jsp'">list</button> &nbsp;
		</td>
	</tr>
	
</table>

</body>
</html>