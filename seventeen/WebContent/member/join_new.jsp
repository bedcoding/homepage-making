<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--login_new.jsp 로그인 페이지입니다.
	join_new.jsp 국내/국외 선택하는 페이지 입니다.
	join00_2.jsp 회원가입창 페이지 입니다. 
	email_chk.java 이메일 체크 하는 부분
	id_chk.java  아이디 체크 하는 부분
	JoinAction.java 가입 DB저장 부분입니다.
	LoginAction.java DB체크해서 로그인하는 부분입니다. 세션생성 
	LogoutAction.java 세션 없앱니다. 
	각 jsp에는 로그인 로그아웃 if문을 만들어주세요.
	-->

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

 <body>
 <!--Wrap-->
 <div id="wrap">
 

		
	<p class="m_top"><img src="image/main/main_blue.jpg"border="0" alt=""></p>
	<!--Header-->
	<div id="header_new">
		<ul class="m_menu">
			<li><img src="image/common/menu/menu_left.jpg"border="0" alt=""></li>
			<li><a href="Index.bo"><img src="image/common/menu/menu01.jpg" border="0" alt=""></a></li>
			<li><a href="asp/profile.html"><img src="image/common/menu/menu02.jpg" border="0" alt=""></a></li>
						
			<li><a href="BoardList.bo"><img src="image/common/menu/menu03.jpg" border="0" alt=""></a></li>
			<li><a href="ShowSc.sc"><img src="image/common/menu/menu04.jpg" border="0" alt=""></a></li>			
			<li><a href="asp/vote.html"><img src="image/common/menu/menu05.jpg" border="0" alt=""></a></li>			
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


	<iframe name="action_ifrm" id="action_ifrm" width="0" height="0" frameborder="0" ></iframe><!--Quick-->

		<script language='javascript'>
			window.name ="Parent_window";

			function fnPopup(){
				window.open('', 'popupChk', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
				document.form_chk.action = "https://nice.checkplus.co.kr/CheckPlusSafeModel/checkplus.cb";		
				document.form_chk.target = "popupChk";
				document.form_chk.submit();
				
			}
		</script>
		<form name="form_chk" method="post" style="margin:0;padding:0;">
			<input type="hidden" name="m" value="checkplusSerivce">						<!-- 필수 데이타로, 누락하시면 안됩니다. -->
			<input type="hidden" name="EncodeData" value="AgAFRzgwNjll7KgTDzM8aswT+/+XkQd9K8QzqqQAfzUYgXwgKk9ULkYBNe9vPEuBRZDWPwWZZJIH1i+S9UlAkYDatom1ihY01utRuKreQT2jowuyO5th98v+/BZES0nPzktGKIHuhLLrUmGcKNmJS0hHcGrm6dDeKRSEyIyZZME2iLY/lb3b6F0/U8IBgQH4s9zZeP1Qv8jzmupLBhH8VLu3rOjln2Jdw/bYuvRrwc80lrBlvEEeXSY0dgUd3An1sLu11OMHBP9IF3jU7XhoBPLO76D8YOhsjKq7HCmLys1BW7VoxkHyRxit00EtRbSmbLyMUEIbTm4OO43l6Cn/gFq4gxOpFGMBxhEZYJDAiw6ZcIEDRQiCtEjgxeyONAMK2Vh2aoHyUCO9/YHEGkXWUi5FAUYzEC+MGCp56X5/9n9XaIkNapYrBrMBDdcU7pXtnYNF5UdTQcQLFJ228g/+ykdA1PnNzIly+OTn4OenMQjjq8qjLkykHw==">		<!-- 위에서 업체정보를 암호화 한 데이타입니다. -->
		</form>
	<!--Container-->
	<div id="container_m">

		<!-- join -->
		<div class="join03">
			<a href="javascript:fnPopup();"><img src="image/member/join_korea.jpg"  border="0" alt=""></a>&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="./join00_2.me"><img src="image/member/join_for.jpg" border="0" alt=""></a>
		</div><!-- END join -->

	</div><!--END Container-->

		<!--Footer-->
	<div id="footer">
		<p class="pt20 pb20">Seventeen Copyrightⓒ2013 PLEDIS Co.,Ltd. All Rights Reserved.</p>
	</div><!--END Footer-->
	
 </div><!--END Wrap-->
  
 </body>
</html>