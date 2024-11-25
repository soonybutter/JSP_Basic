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
<%
	String msg =(String)request.getAttribute("msg");
	String url =(String)request.getAttribute("url");
	
%>
<h1> <%=msg %></h1>
<button onclick="location.href='<%=url%>'">확인</button>

</body>
</html>