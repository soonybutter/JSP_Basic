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
	{ //command 'login'일때
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		//id, pw 둘 다 dao로 보내겠다.
		MyMemberDto dto = dao.login(id,pw);
		
		if(dto.getMyid() != null )
		{
			
			//session에 이름 똑같게 담아준다
			//request: 코드 바꾼 화면(전환된 화면)까지만 유효하다
			//session: 브라우저에 하나씩 만들어짐.
			session.setAttribute("dto", dto);
			
			//default:30분
			session.setMaxInactiveInterval(60*60);
			
			
			/*
			page 영역: 하나의 jsp 페이지 내에서만 객체를 공유하는 영역
					pageContext객체 -> 해당 jsp페이지 내에서만 유효.
		    
		    request 영역: 응답하는 페이지까지 유효한 영역.
		    			setAttribute로 저장하고 getAttribute로 받고.
		    			-> forward 방식: request 공유ㅇ
		    			+redirect 방식: request 공유 x
		    session 영역: 하나의 브라우저당 1개의 session 객체
		    			같은 브라우저 내에서 요청되는 페이지들은 같은 객체를 공유.
		    
		    application 영역: 어플리케이션 당 1개의 application 객체가 생성.
		    				같은 어플리케이션 내에서 요청되는 모든 페이지들은 같은 객체 공유
		    				
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
				//로그인 실패시
				response.sendRedirect("logRes.jsp");
			}
		    		
			
		}
		
		//pageContext.forward("userinfo.jsp");
		//response.sendRedirect("userinfo.jsp");
	}
	
	else if(command.equals("logout"))
	{
			//로그아웃
			//세션에 담아둔 정보를 삭제한다."invalidate()" -> 비어있음으로 null이네? 
			session.invalidate();
			response.sendRedirect("index.jsp");
    }
		
	else if(command.equals("userlistall"))
	{
			//전체 유저 정보 조회
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
			request.setAttribute("msg","회원등급 조정 성공");
			request.setAttribute("url","membercontroller.jsp?command=userlistall");
		}
		else
		{
			request.setAttribute("msg","회원등급 조정 실패");
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
		//string+ 다른 타입 (string이랑 연산처리가 됨 . 최종: String) 
		
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
			request.setAttribute("msg","회원가입 성공");
			request.setAttribute("url","index.jsp");
		}
		else{
			request.setAttribute("msg","회원가입 실패");
			request.setAttribute("url", "membercontroller.jsp?command=registform");
		}
		pageContext.forward("result.jsp");
		
	}
	else if(command.equals("deleteuser")){
		//1. request에 담겨 넘어오는 "myno" 받기
		int myno = Integer.parseInt(request.getParameter("myno"));
		
		//2. dao 실행하여 탈퇴진행
		int res = dao.deleteUser(myno);
		
		//4. 탈퇴 처리 후 result.jsp로 화면전환
		if(res>0){
			request.setAttribute("msg","탈퇴 성공");
			request.setAttribute("url","membercontroller.jsp?command=logout");
			
		}
		else{
			request.setAttribute("msg","탈퇴실패");
			request.setAttribute("url", "membercontroller.jsp?command=userinfo&myno="+myno);
		}
		
		pageContext.forward("result.jsp");
	}
		
	
%>

</body>
</html>