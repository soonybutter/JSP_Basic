<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charser=UTF-8"); %>

<%@ page import="java.util.List" %>
<%@ page import="com.mvc.dto.MVCBoardDto" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<% List<MVCBoardDto> list = (List<MVCBoardDto>)request.getAttribute("allList");%>

<h1>LIST</h1>
<table>
	<col width="50px"><col width="100px"><col width="100px"><col width="100px">
	<tr>
		<th>SEQ</th>
		<th>WRITER</th>
		<th>TITLE</th>
		<th>DATE</th>
	</tr>
<%
	if(list.size()==0){
%>
	<tr>
		<td colspan="4"> ----���� �������� �ʽ��ϴ�----</td>
	</tr>
<% 		
	}else{
		for(MVCBoardDto dto:list){
%>
			<tr>
				<td><%=dto.getSeq() %></td>
				<td><%=dto.getWriter() %></td>
				<td><a href="mycontroller.jsp?command=boarddetail&seq=<%=dto.getSeq()%>"><%=dto.getTitle()%></a></td>
				<td><%=dto.getRegdate() %></td>
			</tr>
<% 			
			
		}
	}
%>
	<tr>
		<td colspan="4">
			<input type="button" value="write" 
			onclick="location.href='mycontroller.jsp?command=boardinsertform'">
		</td>
	</tr>
	
</table>









</body>
</html>