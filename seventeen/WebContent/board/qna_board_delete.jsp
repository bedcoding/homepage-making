<%@ page language="java" contentType="text/html; charset=UTF-8"%>


<%
   int num=Integer.parseInt(request.getParameter("num"));
%>
<html>
<head>
<title> SEVENTEEN Official website </title>
     <meta name="Author" content="minee">
     <meta name="Publisher" content="MyelHub">
     <meta name="Description" content="">
     <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <meta http-equiv="X-UA-Compatible" content="IE=9">
     <link type="text/css" rel="stylesheet" href="css/default.css" />
 <!--     <script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script> -->
  <!--    <script type="text/javascript" src="/js/doorer.js"></script> -->
   <script type="text/javascript">
   function windowclose(){
      window.close();
   }
   </script>
   
</head>



<body>
<!--Container-->


<form name="deleteForm" action="./BoardDeleteAction.bo?num=<%=num %>" 
   method="post">

   <br>
<table border="1">
<tr>
   <td>
      <font size=2>글 비밀번호 : </font>
   </td>
   <td>
      <input name="BOARD_PASS" type="password">
   </td>
</tr>
<tr >
   <td colspan=2 align=center>
      <a href="javascript:deleteForm.submit()"><img src="./image/sub/pop_regist.gif" border="0" alt=""></a>
      &nbsp;&nbsp;
      <a href="javascript:windowclose();"><img src="./image/sub/pop_cancel.gif" border="0" alt=""></a>
   </td>
</tr>
</table>
</form>


</body>
   
   
   
   
</html>