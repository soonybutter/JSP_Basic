<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ page import= "com.login.dto.MyMemberDto" %>
<%@ page import= "java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	function updateRole(myno){
		location.href="membercontroller.jsp?command=updateroleform&myno="+myno;
		
	}
</script>
</head>
<body>
<%
	MyMemberDto logindto=(MyMemberDto)session.getAttribute("dto");
	
	if(logindto==null){
		pageContext.forward("index.jsp");
	}
%>
<% List<MyMemberDto> list = (List<MyMemberDto>)request.getAttribute("list");%>

<h1>ȸ��������ȸ</h1>
<div>
	<span><%=logindto.getMyname()%> �� ȯ���մϴ�. (���: <%=logindto.getMyrole() %>)</span>
	<button onclick="location.href='membercontroller.jsp?command=logout'">�α׾ƿ�</button>
</div>
<table border="1">
	<tr>
		<th>��ȣ</th>
		<th>I D</th>
		<th>P W</th>
		<th>�̸�</th>
		<th>�ּ�</th>
		<th>��ȭ��ȣ</th>
		<th>�̸���</th>
		<th>���Կ���</th>
		<th>���</th>
		<th>��޺���</th>
	</tr>
<%
	for(MyMemberDto dto: list){
%>
	<tr>
		<td><%=dto.getMyno() %></td>
		<td><%=dto.getMyid() %></td>
		<td><%=dto.getMypw() %></td>
		<td><%=dto.getMyname() %></td>
		<td><%=dto.getMyaddr() %></td>
		<td><%=dto.getMyphone() %></td>
		<td><%=dto.getMyemail() %></td>
		<td><%=dto.getMyenabled().equals("Y")? "����":"Ż��" %></td>
		<td><%=dto.getMyrole() %></td>
		<td><button onclick="updateRole(<%=dto.getMyno()%>);">����</button></td>
	</tr>
<%		
	}
%>
	<tr>
		<td colspan="9" align="right">
		<button onclick="history.back()">�ڷΰ���></button>
		</td>
	</tr>
</table>
</body>
</html>