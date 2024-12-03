<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<<<<<<< HEAD
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
=======

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    
>>>>>>> practice/JSP_Scope
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<<<<<<< HEAD
	<h2><a href="answer.do?command=list">list!</a></h2>
=======
<%
	// (scope영역): page영역, request영역, session영역, application영역
	
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
<h3><a href="result.jsp">이동(result.jsp)</a></h3>
<h3><a href="myservlet.do">이동(controller)</a></h3>


>>>>>>> practice/JSP_Scope

</body>
</html>