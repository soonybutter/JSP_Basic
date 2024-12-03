<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ page import= "com.login.dao.MyMemberDao" %>
<%@ page import= "com.login.dto.MyMemberDto" %>
<%@ page import= "java.util.List" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String command = request.getParameter("command");
	System.out.println("[command: "+command+"]");
	
	MyMemberDao dao = new MyMemberDao();
	
	if(command.equals("login"))
	{ //command 'login'�϶�
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		//id, pw �� �� dao�� �����ڴ�.
		MyMemberDto dto = dao.login(id,pw);
		
		if(dto.getMyid() != null )
		{
			
			//session�� �̸� �Ȱ��� ����ش�
			//request: �ڵ� �ٲ� ȭ��(��ȯ�� ȭ��)������ ��ȿ�ϴ�
			//session: �������� �ϳ��� �������.
			session.setAttribute("dto", dto);
			
			//default:30��
			session.setMaxInactiveInterval(60*60);
			
			
			/*
			page ����: �ϳ��� jsp ������ �������� ��ü�� �����ϴ� ����
					pageContext��ü -> �ش� jsp������ �������� ��ȿ.
		    
		    request ����: �����ϴ� ���������� ��ȿ�� ����.
		    			setAttribute�� �����ϰ� getAttribute�� �ް�.
		    			-> forward ���: request ������
		    			+redirect ���: request ���� x
		    session ����: �ϳ��� �������� 1���� session ��ü
		    			���� ������ ������ ��û�Ǵ� ���������� ���� ��ü�� ����.
		    
		    application ����: ���ø����̼� �� 1���� application ��ü�� ����.
		    				���� ���ø����̼� ������ ��û�Ǵ� ��� ���������� ���� ��ü ����
		    				
			*/
			
			if(dto.getMyrole().equals("ADMIN"))
			{
				
				response.sendRedirect("adminmain.jsp");
			}
			else if(dto.getMyrole().equals("USER"))
			{
				response.sendRedirect("usermain.jsp");
			}
			else
			{
				//�α��� ���н�
				response.sendRedirect("logRes.jsp");
			}
		    		
			
		}
		
		//pageContext.forward("userinfo.jsp");
		//response.sendRedirect("userinfo.jsp");
	}
	
	else if(command.equals("logout"))
	{
			//�α׾ƿ�
			//���ǿ� ��Ƶ� ������ �����Ѵ�."invalidate()" -> ����������� null�̳�? 
			session.invalidate();
			response.sendRedirect("index.jsp");
    }
		
	else if(command.equals("userlistall"))
	{
			//��ü ���� ���� ��ȸ
			List<MyMemberDto> list = dao.selectAll();
			
			request.setAttribute("list",list);
			pageContext.forward("userlistall.jsp");
			
	}
	else if(command.equals("updateroleform"))
	{
		int myno = Integer.parseInt(request.getParameter("myno"));
		MyMemberDto dto = dao.selectUser(myno);
		
		request.setAttribute("selectone",dto);
		pageContext.forward("updateroleform.jsp");
	}
	else if(command.equals("updaterole"))
	{
		int myno = Integer.parseInt(request.getParameter("myno"));
		String myrole = request.getParameter("myrole");
		
		int res = dao.updateRole(myno,myrole);
		
		if(res>0)
		{
			request.setAttribute("msg","ȸ����� ���� ����");
			request.setAttribute("url","membercontroller.jsp?command=userlistall");
		}
		else
		{
			request.setAttribute("msg","ȸ����� ���� ����");
			request.setAttribute("url","membercontroller.jsp?command=updateroleform&myno="+myno);
		}
		
		pageContext.forward("result.jsp");
		
	}
	else if(command.equals("userinfo"))
	{
		int myno = Integer.parseInt(request.getParameter("myno"));
		MyMemberDto dto = dao.selectUser(myno);
		
		request.setAttribute("dto",dto);
		
		
		//response.sendRedirect("userinfo.jsp");
		
		//pageContext.forward("userinfo.jsp");
	}
	else if(command.equals("registform"))
	{
		response.sendRedirect("registform.jsp");
	}
	else if(command.equals("idchk"))
	{
		String myid = request.getParameter("myid");	
		
		String res = dao.idChk(myid);
		
		boolean idnotused = true;
		if(res != null){
			idnotused = false;
		}
		
		
		response.sendRedirect("idchk.jsp?idnotused=" + idnotused ); 
		//string+ �ٸ� Ÿ�� (string�̶� ����ó���� �� . ����: String) 
		
	}
	else if(command.equals("insertuser")){
		String myid = request.getParameter("myid");
		String mypw = request.getParameter("mypw");
		String myname = request.getParameter("myname");
		String myaddr = request.getParameter("myaddr");
		String myphone = request.getParameter("myphone");
		String myemail = request.getParameter("myemail");
		
		MyMemberDto dto = new MyMemberDto();
		dto.setMyid(myid);
		dto.setMypw(mypw);
		dto.setMyname(myname);
		dto.setMyaddr(myaddr);
		dto.setMyphone(myphone);
		dto.setMyemail(myemail);
		
		int res = dao.insertUser(dto);
		
		if(res>0){
			request.setAttribute("msg","ȸ������ ����");
			request.setAttribute("url","index.jsp");
		}
		else{
			request.setAttribute("msg","ȸ������ ����");
			request.setAttribute("url", "membercontroller.jsp?command=registform");
		}
		pageContext.forward("result.jsp");
		
	}
	else if(command.equals("deleteuser")){
		//1. request�� ��� �Ѿ���� "myno" �ޱ�
		int myno = Integer.parseInt(request.getParameter("myno"));
		
		//2. dao �����Ͽ� Ż������
		int res = dao.deleteUser(myno);
		
		//4. Ż�� ó�� �� result.jsp�� ȭ����ȯ
		if(res>0){
			request.setAttribute("msg","Ż�� ����");
			request.setAttribute("url","membercontroller.jsp?command=logout");
			
		}
		else{
			request.setAttribute("msg","Ż�����");
			request.setAttribute("url", "membercontroller.jsp?command=userinfo&myno="+myno);
		}
		
		pageContext.forward("result.jsp");
	}
		
	
%>

</body>
</html>