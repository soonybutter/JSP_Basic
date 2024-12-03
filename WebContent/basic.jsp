<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>EL Expression Language</h1>
	<table border="1">
		<thead>
			<tr>
				<th>EL Expression</th>
				<th>Result</th>
			</tr>
		</thead>
		<tr>
			<td>\${1 }</td>
			<td>${1 }</td>
		</tr>
	    <tr>
			<td>\${1+2}</td>
			<td>${1+2 }</td>
		</tr>
	    <tr>
			<td>\${1.2 + 2.3}</td>
			<td>${1.2+2.3 }</td>
		</tr>
	    <tr>
			<td>\${(1==2)?3:4}</td>
			<td>${(1==2)?3:4}</td>
		</tr>
	
	</table>
</body>
</html>