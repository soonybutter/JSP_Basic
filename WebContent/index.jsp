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
	// (scope����): page����, request����, session����, application����
	
	pageContext.setAttribute("pageId","myPageIdVal");
    request.setAttribute("reqId", "myRequestIdVal");
	session.setAttribute("sessionId", "mySessionIdVal");
	application.setAttribute("appId","myApplicationIdVal");
	
%>
<h1>index</h1>
pageId : <%=pageContext.getAttribute("pageId") %> <br>
reqId : <%=request.getAttribute("reqId") %> <br>
sessionId : <%=session.getAttribute("sessionId") %> <br>
appId : <%=application.getAttribute("appId") %> <br>

<br>
<h3><a href="result.jsp">�̵�(result.jsp)</a></h3>
<h3><a href="myservlet.do">�̵�(controller)</a></h3>



</body>
</html>