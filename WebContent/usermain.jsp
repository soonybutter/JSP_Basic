<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import= "com.login.dto.MyMemberDto" %>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	MyMemberDto dto = (MyMemberDto)session.getAttribute("dto");
	
	if(dto==null){
		pageContext.forward("index.jsp");
	}
%>
<h1>USER Main</h1>
<div>
	<span><%=dto.getMyname() %> �� ȯ���մϴ�.(���: <%=dto.getMyrole() %>)</span>
	
	<button onclick="location.href='membercontroller.jsp?command=logout'">�α׾ƿ�</button>
	<br>
	<button onclick="location.href='membercontroller.jsp?command=userinfo&myno=<%=dto.getMyno()%>'">����������</button>
</div>

</body>
</html>