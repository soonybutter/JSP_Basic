<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("UTF-8"); %>
<<<<<<< HEAD
<% response.setContentType("text/html; charset=UTF-8"); %>    
=======
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
<h1>${msg }</h1>
<button onclick="location.href='${url}'">확인</button>
=======
<h1>result</h1>
pageId : <%=pageContext.getAttribute("pageId") %> <br>
reqId : <%=request.getAttribute("reqId") %> <br>
sessionId : <%=session.getAttribute("sessionId") %> <br>
appId : <%=application.getAttribute("appId") %> <br>
>>>>>>> practice/JSP_Scope

</body>
</html>