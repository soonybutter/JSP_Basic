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
	<h1>�� �ۼ� ����</h1>
	<button onclick="location.href='mylist.jsp'">Ȯ��</button>
<% 
	}else{
%>		
	<h1>�� ���� ����</h1>
	<button onclick ="location.href='selectone.jsp?myno=<%=myno%>'">Ȯ��</button>
<%
	}
%>


</body>
</html>