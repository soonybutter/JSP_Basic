<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ page import= "com.login.dto.MyMemberDto" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<% MyMemberDto dto = (MyMemberDto)request.getAttribute("selectone");%>
<h1>ȸ�� ��� ����</h1>
<form action="membercontroller.jsp" method="post">
<input type="hidden" name="command" value="updaterole">
<input type="hidden" name="myno" value="<%=dto.getMyno()%>">
<table>
	<col width="50"><col width = "200">
	<tr>
		<th>��ȣ</th>
		<th><%=dto.getMyno() %></th>
	</tr>
	<tr>
		<th>�̸�</th>
		<th><%=dto.getMyname() %></th>
	</tr>
	<tr>
		<th>I D</th>
		<th><%=dto.getMyid() %></th>
	</tr>
	<tr>
		<th>���</th>
		<td>
			<select name="myrole">
				<option value="USER" <%=dto.getMyrole().equals("USER")?"selected":"" %>>�Ϲ�ȸ��</option>
				<option value="MANAGER" <%=dto.getMyrole().equals("MANAGER")?"selected":"" %>>�Ŵ���</option>
				<option value="ADMIN" <%=dto.getMyrole().equals("ADMIN")?"selected":"" %>>������</option>
			</select>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="����Ϸ�">
			
		</td>
	</tr>
	
</table>

</form>

</body>
</html>