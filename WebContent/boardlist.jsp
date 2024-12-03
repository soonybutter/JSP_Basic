<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<<<<<<< HEAD
<<<<<<< HEAD
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
=======
=======
>>>>>>> practice/JSP_MVC
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charser=UTF-8"); %>

<%@ page import="java.util.List" %>
<%@ page import="com.mvc.dto.MVCBoardDto" %>

<<<<<<< HEAD
>>>>>>> practice/JSP_MVC_Mybatis
=======
>>>>>>> practice/JSP_MVC
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<<<<<<< HEAD
<<<<<<< HEAD
</head>
<body>
<h1>글 목록</h1>
<table>
	<col width="50"><col width="300"><col width="100"><col width="100">
	<tr>
		<th>글번호</th>
		<th>제 목</th>
		<th>작성자</th>
		<th>작성일</th>
	</tr>
	<c:choose>
		<c:when test="${empty list }">
			<tr>
				<td colspan="4">=========작성된 글이 없습니다.=========</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${list }" var="dto">
				<tr>
					<td>${dto.boardno }</td>
					<td>
						<c:forEach begin="1" end="${dto.titletab }">
							&nbsp;
						</c:forEach>
						<a href="answer.do?command=detail&boardno=${dto.boardno }">${dto.title }</a>
					</td>
					<td>${dto.writer }</td>
					<td>${dto.date }</td>
				
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	<tr>
		<td colspan="4">
			<input type="button" value="글쓰기" onclick="location.href='answer.do?command=writeform'">
		</td>
	</tr>
</table>
=======
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script>
	$(function(){
		$("#muldelform").submit(function(){
			if($("#muldelform input:checked").length==0){
				alert("하나 이상 체크해주세요!");
				return false;
			}
		});
	});
</script>
=======
>>>>>>> practice/JSP_MVC
</head>
<body>
<% List<MVCBoardDto> list = (List<MVCBoardDto>)request.getAttribute("allList");%>

<h1>LIST</h1>
<<<<<<< HEAD
<form action="mycontroller.jsp" method="post" id="muldelform">
	<input type="hidden" name="command" value="muldel">
	<table>
		<col width="50px"><col width="100px"><col width="100px"><col width="100px">
		<tr>
			<th>&nbsp;&nbsp;</th>
			<th>SEQ</th>
			<th>WRITER</th>
			<th>TITLE</th>
			<th>DATE</th>
		</tr>
	<%
		if(list.size()==0){
	%>
		<tr>
			<td colspan="4"> ----글이 존재하지 않습니다----</td>
		</tr>
	<% 		
		}else{
			for(MVCBoardDto dto:list){
	%>
				<tr>
					<td><input type="checkbox" name="chk" value="<%=dto.getSeq() %>"></td>
					<td><%=dto.getSeq() %></td>
					<td><%=dto.getWriter() %></td>
					<td><a href="mycontroller.jsp?command=boarddetail&seq=<%=dto.getSeq()%>"><%=dto.getTitle()%></a></td>
					<td><%=dto.getRegdate() %></td>
				</tr>
	<% 			
			
			}
		}
	%>
		<tr>
			<td colspan="4">
				<input type="submit" value="삭제">
				<input type="button" value="write" 
				onclick="location.href='mycontroller.jsp?command=boardinsertform'">
				
			</td>
		</tr>
	
	</table>
</form>
=======
<table>
	<col width="50px"><col width="100px"><col width="100px"><col width="100px">
	<tr>
		<th>SEQ</th>
		<th>WRITER</th>
		<th>TITLE</th>
		<th>DATE</th>
	</tr>
<%
	if(list.size()==0){
%>
	<tr>
		<td colspan="4"> ----글이 존재하지 않습니다----</td>
	</tr>
<% 		
	}else{
		for(MVCBoardDto dto:list){
%>
			<tr>
				<td><%=dto.getSeq() %></td>
				<td><%=dto.getWriter() %></td>
				<td><a href="mycontroller.jsp?command=boarddetail&seq=<%=dto.getSeq()%>"><%=dto.getTitle()%></a></td>
				<td><%=dto.getRegdate() %></td>
			</tr>
<% 			
			
		}
	}
%>
	<tr>
		<td colspan="4">
			<input type="button" value="write" 
			onclick="location.href='mycontroller.jsp?command=boardinsertform'">
		</td>
	</tr>
	
</table>
>>>>>>> practice/JSP_MVC









<<<<<<< HEAD
>>>>>>> practice/JSP_MVC_Mybatis

=======
>>>>>>> practice/JSP_MVC
</body>
</html>