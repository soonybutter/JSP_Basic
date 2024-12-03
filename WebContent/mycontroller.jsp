<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@page import="com.mvc.dao.MVCBoardDao" %>
<%@page import="com.mvc.dto.MVCBoardDto" %>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	//view���� ��û�� ������ ���� �Ķ����
	String command = request.getParameter("command");
	
	System.out.println("[command: "+command+"]");
	MVCBoardDao dao = new MVCBoardDao();
	
	if(command.equals("boardlist")){
		List<MVCBoardDto> list = dao.selectAll();
		
		request.setAttribute("allList", list);
		
		pageContext.forward("boardlist.jsp");
		//������ �̵�
		/*
			1. forward()
			request�� ��� ���� ��ȿ(����).
			req, res��ü�� ����.
			: pageContext.forward(), <jsp:forward>, requestDispatcher
			
			2. redirect
			���ο� ������ ��û�ѰͰ� ���� ������� �̵�.
			req,res��ü�� �������� �ʴ´�.
			: response, sendRedirect()
			
			
		*/
		
	} // �̰�쿡 ȭ���� �ٲ�����
	else if(command.equals("boardinsertform")){
		response.sendRedirect("boardinsert.jsp");
		
	}
	else if(command.equals("boardinsert")){
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		MVCBoardDto dto = new MVCBoardDto();
		dto.setWriter(writer);
		dto.setTitle(title);
		dto.setContent(content);
		
		int res = dao.insert(dto);
		
		if(res>0){ //����������
			request.setAttribute("msg","�� �ۼ� ����");
			request.setAttribute("url", "mycontroller.jsp?command=boardlist");
		}
		else{ //���� ������
			request.setAttribute("msg","�� �ۼ� ����");
			request.setAttribute("url","mycontroller.jsp?command=boardinsertform");
		}
		
		pageContext.forward("result.jsp"); //forward������� ȭ���� ��ȯ�ȴ�.
	
		
	}
	else if(command.equals("boarddetail")){
		int seq = Integer.parseInt(request.getParameter("seq"));
		
		MVCBoardDto dto = dao.selectOne(seq);
		
		request.setAttribute("dto",dto);
		pageContext.forward("boarddetail.jsp");
	}
	else if(command.equals("boardupdateform")){
		int seq = Integer.parseInt(request.getParameter("seq"));
		
		MVCBoardDto dto = dao.selectOne(seq);
		
		request.setAttribute("dto",dto);
		pageContext.forward("boardupdate.jsp");
		
	}
	else if(command.equals("boardupdate")){
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int seq = Integer.parseInt(request.getParameter("seq"));
		
		MVCBoardDto dto = new MVCBoardDto();
		dto.setTitle(title);
		dto.setContent(content);
		dto.setSeq(seq);
		
		int res = dao.update(dto);
		
		if(res>0){
			request.setAttribute("msg","�� ���� ����");
			request.setAttribute("url", "mycontroller.jsp?command=boarddetail&seq="+seq);
		}
		else{
			request.setAttribute("msg","�� ���� ����");
			request.setAttribute("url","mycontroller.jsp?command=boardupdateform&seq="+seq);
		}
		pageContext.forward("result.jsp");
	}
	else if(command.equals("boarddelete")){
		int seq = Integer.parseInt(request.getParameter("seq"));
		int res = dao.delete(seq);
		
		
		if(res>0){
			request.setAttribute("msg","�� ���� ����");
			request.setAttribute("url","mycontroller.jsp?command=boardlist");
		}
		else{
			request.setAttribute("msg","�� ���� ����");
			request.setAttribute("url","mycontroller.jsp?command=boarddetail&seq="+seq);
			
			
		}
		pageContext.forward("result.jsp");
		
		
	}
	else if(command.equals("muldel")){
		//name = chk �� parameter�� ����
		String[] seq = request.getParameterValues("chk");
		
		int res = dao.multiDelete(seq);
		
		if(res>0){
			request.setAttribute("msg", "üũ�� �۵��� ���� �����Ͽ����ϴ�.");
			request.setAttribute("url", "mycontroller.jsp?command=boardlist");
		}
		else{
			request.setAttribute("msg","üũ�� �۵��� ���� ���� �Ͽ����ϴ�.");
			request.setAttribute("url","mycontroller.jsp?command=boardlist");
			
		}
		
		pageContext.forward("result.jsp");
		
	}
	
%>

</body>
</html>








