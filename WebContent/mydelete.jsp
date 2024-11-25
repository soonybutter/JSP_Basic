<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8");%>

<%@ page import="com.my.model.dao.MyBoardDao" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	int myno = Integer.parseInt(request.getParameter("myno"));
	
	MyBoardDao dao = new MyBoardDao();
	System.out.println("delete page\n");
	int res = dao.delete(myno);
	
	if(res>0){
%>
	<h1>글 작성 성공</h1>
	<button onclick="location.href='mylist.jsp'">확인</button>
<% 
	}else{
%>		
	<h1>글 삭제 실패</h1>
	<button onclick ="location.href='selectone.jsp?myno=<%=myno%>'">확인</button>
<%
	}
%>


</body>
</html>