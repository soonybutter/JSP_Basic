<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<% request.setCharacterEncoding("UTF-8"); %>    
<% response.setContentType("text/html; charset=UTF-8"); %>    
<%@ page import="com.my.model.dto.MyBoard" %>    
<%@ page import="com.my.model.dao.MyBoardDao" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	//1. parameter�� �Ѿ���� �����͸� �޴´�.
	String myname = request.getParameter("myname");
	String mytitle = request.getParameter("mytitle");
	String mycontent = request.getParameter("mycontent");

	
	MyBoard dto = new MyBoard(myname, mytitle, mycontent);
	
	//2. db�� ����
	MyBoardDao dao = new MyBoardDao();
	int res = dao.insert(dto);
	
	if(res>0){
%>		
	<script type="text/javascript">
		alert("�� ��� ����");
		location.href="mylist.jsp";
	</script>
<%
    }else{
%>
		<script type="text/javascript">
			alert("�� ��� ����");
			location.href="myinsert.jsp";
		</script>
<%
    }
%>
</body>
</html>