<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script>
	function confirm(bool){ //���̵� �ߺ�üũâ���� ������ ��������
		if(bool=="true"){
			opener.document.getElementsByName("mypw")[0].focus();
			opener.document.getElementsByName("myid")[0].title="y";
		}
		else{
			opener.document.getElementsByName("myid")[0].focus();
		}
		
		self.close();
	}
	
	window.onload = function(){
		let id = opener.document.getElementsByName("myid")[0].value;
		document.getElementsByName("id")[0].value = id;
		
	}

</script>
</head>
<body>
<%
	String idnotused =request.getParameter("idnotused");

%>

<table>
	<tr>
		<td><input type="text" name="id" size="10"></td>
	</tr>
	<tr>
		<td><%=idnotused.equals("true")?"���̵� ���� ����":"���̵� �ߺ�" %></td>
	</tr>
	<tr>
		<td>
			<input type="button" value="Ȯ��" onclick="confirm('<%=idnotused%>');">
		</td>
	</tr>
	
</table>

</body>
</html>