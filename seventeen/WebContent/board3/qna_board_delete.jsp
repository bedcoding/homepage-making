<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="net.board.db3.*" %>
<%
	int num=Integer.parseInt(request.getParameter("num"));
	BoardBean board = (BoardBean)request.getAttribute("boarddata");

%>
<html>
<head>
<title>MVC 게시판</title>
</head>
<body>
<form name="deleteForm" action="./BoardDeleteAction.bo3?num=<%=num %>" 
	method="post">
<table border=1>

<%
	String ida = null;
	ida = (String) session.getAttribute("loggedID");
	System.out.println("글쓰기 버튼 세션에 저장된 아이디 확인: " + ida);

	if(ida!=null && ida.equals("admin")) 
	{	
%> 		<tr>
			<td>
				<font size=2>글 비밀번호 : </font>
			</td>
			
			<td>
				<input name="BOARD_PASS" type="password">
			</td>
		</tr>
		<tr>
			<td colspan=2 align=center>
				<a href="javascript:deleteForm.submit()">삭제</a>
				&nbsp;&nbsp;
				<a href="javascript:history.go(-1)">돌아가기</a>
			</td>
		</tr>
<%  } 

	else 
	{
%>		<tr>
			<td colspan=2 align=center>
				삭제할 권한이 없습니다. <br>
				&nbsp;&nbsp;
				<a href="javascript:history.go(-1)">돌아가기</a>
			</td>
		</tr>		
<%	}  
%>




</table>
</form>
</body>
</html>