<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	function idConfirm(){
		let nameInput = document.getElementsByName("myid")[0];
		if(nameInput.title == "n"){ //���̵� �ߺ�üũ �ȵǸ� �ȳѾ�� 
			alert("���̵� �ߺ�üũ�� ���ּ���");
			nameInput.focus(); //focus�� ���̵�â���� �̵��ϵ���!
			
		}
	}
	function idChk(){
		let doc = document.getElementsByName("myid")[0];
		if(doc.value.trim()=="" || doc.value==null){
			alert("���̵� �Է��� �ּ���");
			
		}
		else{
			let target="membercontroller.jsp?command=idchk&myid="+doc.value.trim();
			window.open(target,"","width=200,height=200");
		}
	}
	
</script>
</head>
<body>
<h1>ȸ������</h1>
<form action="membercontroller.jsp" method="post">
	<input type="hidden" name="command" value="insertuser">
	<table>
		<tr>
			<th>���̵�</th>
			<td>
			<input type="text" name="myid" title="n" required="required">
			<input type ="button" value="�ߺ�üũ" onclick="idChk();">
			</td>
		</tr>
		<tr>
			<th>��й�ȣ</th>
			<td>
				<input type="text" name="mypw" onclick="idConfirm();" required="required">
			</td>
		</tr>
		<tr>
			<th>�̸�</th>
			<td>
				<input type="text" name="myname" onclick="idConfirm();" required="required">
			</td>
		</tr>
		<tr>
			<th>�ּ�</th>
			<td>
				<input type="text" name="myaddr" onclick="idConfirm();" required="required">
			</td>
		</tr>
		<tr>
			<th>��ȭ��ȣ</th>
			<td>
				<input type="text" name="myphone" onclick="idConfirm();" required="required">
			</td>
		</tr>
		<tr>
			<th>�̸���</th>
			<td>
				<input type="text" name="myemail" onclick="idConfirm();" required="required">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="����">			
			</td>
		</tr>
	</table>

</form>

</body>
</html>