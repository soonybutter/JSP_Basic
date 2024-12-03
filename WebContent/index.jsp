<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
=======

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    
>>>>>>> practice/JSP_Scope
=======
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
    
>>>>>>> practice/JSP_LoginBoard
=======
    
<% request.setCharacterEncoding("UTF-8"); %>    
<% response.setContentType("text/html; charset=UTF-8"); %>    
>>>>>>> practice/JSP_Myboard_Mybatis
=======
    
<% request.setCharacterEncoding("UTF-8"); %>    
<% response.setContentType("text/html; charset=UTF-8"); %>    
>>>>>>> practice/JSP_Myboard
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
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
=======
<script type="text/javascript">
	function registForm(){
		location.href="membercontroller.jsp?command=registform";
	}
	
</script>
<title>Insert title here</title>
</head>
<body>
<div style="width:300px;">
	<h1 style="text-align:center">LOGIN</h1>
	<form action ="membercontroller.jsp" method="post">
		<input type="hidden" name="command" value="login">
		<table>
			<col width="100"><col width="100">
			<tr>
				<th>I D</th>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<th>P W</th>
				<td><input type="text" name="pw"></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="login">
					<input type="button" value="regist" onclick="registForm();">
				</td>
			</tr>
		</table>
	</form>

</div>








>>>>>>> practice/JSP_LoginBoard

=======
=======
>>>>>>> practice/JSP_Myboard
<title>Insert title here</title>
</head>
<body>

<!-- forward 액션태그 : 다른 페이지로 이동 (순수 html에는 x) -->
<jsp:forward page="./mylist.jsp"></jsp:forward>
<<<<<<< HEAD
>>>>>>> practice/JSP_Myboard_Mybatis
=======
>>>>>>> practice/JSP_Myboard
</body>
</html>