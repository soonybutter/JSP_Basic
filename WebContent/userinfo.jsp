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
<script>
	function deleteUser(myno){
		if(window.confirm("ȸ�� Ż�� �Ͻðڽ��ϱ�?")){
			location.href="membercontroller.jsp?command=deleteuser&myno="+myno;
			
		}
	}
</script>
</head>
<body>
<% MyMemberDto dto = (MyMemberDto)request.getAttribute("dto"); %>
<h1>�� ���� ����</h1>
<table>
	<tr>
		<th>I D</th>
		<td><%=dto.getMyid() %></td>
	</tr>
	<tr>
		<th>P W</th>
		<td><%=dto.getMypw() %></td>
	</tr>
	<tr>
		<th>�̸�</th>
		<td><%=dto.getMyname() %></td>
	</tr>
	<tr>
		<th>�ּ�</th>
		<td><%=dto.getMyaddr() %></td>
	</tr>
	<tr>
		<th>��ȭ��ȣ</th>
		<td><%=dto.getMyphone() %></td>
	</tr>
	<tr>
		<th>�̸���</th>
		<td><%=dto.getMyemail() %></td>
	</tr>
	<tr>
		<th>���</th>
		<td><%=dto.getMyrole().equals("USER")?"�Ϲ�ȸ��":"�Ŵ���" %></td>
		
	</tr>
	<tr>
		<td colspan="2">
			<input type="button" value="Ż��" onclick="deleteUser(<%=dto.getMyno()%>);">
			<input type="button" value="���" onclick="location.href='usermain.jsp'">
		</td>
	</tr>
</table>

</body>
</html>