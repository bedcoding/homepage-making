<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.net.URLDecoder" %>
<!--login_new.jsp 로그인 페이지입니다.
	join_new.jsp 국내/국외 선택하는 페이지 입니다.
	join00_2.jsp 회원가입창 페이지 입니다.  -->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <title> SEVENTEEN Official website </title>
  <meta name="Author" content="minee">
  <meta name="Publisher" content="MyelHub">
  <meta name="Description" content="">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=9">
  <link type="text/css" rel="stylesheet" href="css/default.css" />
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
  <script type="text/javascript" src="/js/doorer.js"></script>
 </head>
 
<%  //세션이 있는지 확인
	String id =null;
	id=(String)session.getAttribute("loggedID");
	System.out.println("<login_new.jsp>세션에 저장된 아이디:"+id);
%>
 <!--게시판넣기-->
<script language='javascript' type='text/javascript'>

		//<![CDATA[
		function doResize(id) 
		{ 
		var obj = (typeof(id)=='string')?document.getElementById(id):id; 
		obj.height = obj.contentWindow.document.body.scrollHeight; 
		}
		//]]> 
	</script>

 <body
 
 >
 <!--Wrap-->
 <div id="wrap">
 		
	<p class="m_top"><img src="image/main/main_blue.jpg"border="0" alt=""></p>
	<!--Header-->
	<div id="header_new">
		<ul class="m_menu">
			<li><img src="image/common/menu/menu_left.jpg"border="0" alt=""></li>
			<li><a href="Index.bo"><img src="image/common/menu/menu01.jpg" border="0" alt=""></a></li>
			<li><a href="Profile.bo"><img src="image/common/menu/menu02.jpg" border="0" alt=""></a></li>
			<li><a href="BoardList.bo"><img src="image/common/menu/menu03.jpg" border="0" alt=""></a></li>
			<li><a href="ShowSc.sc"><img src="image/common/menu/menu04.jpg" border="0" alt=""></a></li>			
			<li><a href="Vote.bo"><img src="image/common/menu/menu05.jpg" border="0" alt=""></a></li>			
			<li><a href="BoardList.bo3"><img src="image/common/menu/lnb01.jpg" border="0" alt=""></a></li>
			<li><a href="BoardList.bo4"><img src="image/common/menu/lnb02.jpg" border="0" alt=""></a></li>
			
				<%
					String ida = null;
					ida = (String) session.getAttribute("loggedID");
					System.out.println("세션에 저장된 아이디: " + ida);
					if (ida == null) 
					{
				%>		<li><a href="login_new.me">
						<img src="image/common/menu/lnb03.jpg" border="0" alt=""></a></li>
				<%
					} else {
				%>
						<li><a href="logoutaction.me">
						<img src="image/common/menu/lnb03_out.jpg" border="0" alt=""></a></li>
				<%
					}
				%>
			
			<li><img src="image/common/menu/menu_right.jpg"border="0" alt=""></li>		
		</ul>
	</div><!--END Header-->
	<iframe name="action_ifrm" id="action_ifrm" width="0" height="0" frameborder="0" ></iframe>
 <script type="text/javascript" src="./lib/js/validation/validation.js"></script>
 <script type="text/javascript">
 
 
/* function returnObject(obj_name){
		if (typeof obj_name == "object")
		{
			return obj_name;
		}
		else
		{
			return document.getElementById(obj_name);
		}
	}

	//입력값 체크
	this.nullcheck = function(id, massage){		
	
		if (document.getElementById(id).value == "")
		{
			alert(massage + "을(를) 입력해 주세요");
			document.getElementById(id).focus();
			return;
		}
		return true;
	}
 */
 $(function(){
		$("#submit_img").css("cursor","pointer").bind("click",function(){
			go_login();
		})
	})

	function go_login(){
		var check = new validation();
		if (!check.nullcheck("id", "아이디")) return;
		/*  var a= document.getElementById("id").value;
		 alert(a); */
		if (!check.nullcheck("pwd", "비밀번호")) return;
		/* var b= document.getElementById("pwd").value;
		 alert(b); */
		/* $("#login_Frm").attr({"target":"action_ifrm","action":"/loginaction.me"}); */
		$("#login_Frm").submit();
	}

	function enters(ent){
		if (event.keyCode == 13){
			ent();
		}
	}


	

 </script>
		<!--Container-->
	<div id="container_m">

		<!--login -->
			<div class="dh_admin">
			<ul class="dh_idpass">
				<form name="login_Frm" id="login_Frm" method="post" action="./loginaction.me" >
				<input type="hidden" name="backurl" id="backurl" value="/">
				<li><img src="img/adm_id.png" alt=""/>
				<input type="text" class="dh_in01" title="" value="" name="id" id="id" onkeypress="enters(function(){go_login()});" /></li>
				<li><img src="img/adm_pass.png" alt=""/>
				<input type="password" class="dh_in01" name="pwd" id="pwd" onkeypress="enters(function(){go_login()});" /></li>
				</form>
			</ul>
			
			
			<p class="dh_btn"><img src="image/member/adm_btn.jpg" alt="login" id="submit_img" /></p>
			
			<!-- 
			<ul class="btns01">
				<li><a href="./id.jsp"><img src="image/member/btn_id.png" alt="아이디찾기"/></a></li>
				<li><a href="./pass.jsp"><img src="image/member/btn_pass.png" alt="비밀번호 찾기"/></a></li>
			</ul>
			 -->
			
			<p class="btns02"><a href="./join_new.me"><img src="image/member/btn_join.png" alt="회원가입하기"/></a></p>
		</div><!--END login -->

	</div><!--END Container-->


<!--Quick-->
	<!--div id="quick">
		<ul>
			<li><a href="/"><img src="image/common/quick_home.png" alt="HOME"></a></li>	
				
					<li><a href="../asp/login_new.asp"><img src="image/common/quick_login.png" alt="LOGIN"></a></li>
					<li><a href="../asp/join_new.asp"><img src="image/common/quick_join.png" alt="JOIN"></a></li>
				
		</ul>
	</div--><!--END Quick-->
	<!--Footer-->
	<div id="footer">
		<p class="pt20 pb20">Seventeen Copyrightⓒ2013 PLEDIS Co.,Ltd. All Rights Reserved.</p>
	</div><!--END Footer-->
	
 </div><!--END Wrap-->
  
 </body>
</html>