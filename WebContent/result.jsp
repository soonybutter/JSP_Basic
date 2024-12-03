<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<% request.setCharacterEncoding("UTF-8"); %>
<<<<<<< HEAD
<% response.setContentType("text/html; charset=UTF-8"); %>    
=======
<% response.setContentType("text/html; charset=UTF-8"); %>  
>>>>>>> practice/JSP_Scope
=======
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

>>>>>>> practice/JSP_LoginBoard
=======
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    	
>>>>>>> practice/JSP_MVC_Mybatis
=======
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    	
>>>>>>> practice/JSP_MVC
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
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
=======
<%
	String msg =(String)request.getAttribute("msg");
	String url =(String)request.getAttribute("url");
	
%>
<h1> <%=msg %></h1>
<button onclick="location.href='<%=url%>'">확인</button>
>>>>>>> practice/JSP_LoginBoard
=======
=======
>>>>>>> practice/JSP_MVC
<%
	String msg = (String)request.getAttribute("msg");// String 값으로 가져옴으로 형변환
	String url = (String)request.getAttribute("url");
%>
<h1><%=msg %></h1>
<button onclick="location.href='<%=url%>'">확인</button>

<<<<<<< HEAD
>>>>>>> practice/JSP_MVC_Mybatis
=======
>>>>>>> practice/JSP_MVC

</body>
</html>