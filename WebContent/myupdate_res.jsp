<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <% request.setCharacterEncoding("UTF-8"); %>
    <% response.setContentType("text/html; charset=UTF-8"); %>
    
    <%@page import="com.my.model.dao.MyBoardDao" %>
    <%@page import="com.my.model.dto.MyBoard" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	int myno = Integer.parseInt(request.getParameter("myno"));
	String mytitle = request.getParameter("mytitle");
	String mycontent = request.getParameter("mycontent");
	
	MyBoard dto = new MyBoard();
	dto.setMyno(myno);
	dto.setMytitle(mytitle);
	dto.setMycontent(mycontent);
	
	MyBoardDao dao = new MyBoardDao();
	int res = dao.update(dto);
	
	if(res>0){
%>
	<script type="text/javascript">
	alert("�� ���� ����");
	location.href='selectone.jsp?myno=<%=dto.getMyno()%>';
	</script>
<%
	}else{
%>
	<script type="text/javascript">
		alert("�� ���� ����");
		location.href='update.jsp?myno=<%=dto.getMyno()%>';
	</script>
<%
	}
%>








</body>
</html>