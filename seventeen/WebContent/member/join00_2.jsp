<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
 
	<!--div class="black_bg">
		<div class="black_bg_in">
			<p><img src="image/main/poster_nt.jpg" width="980" height="728" border="0" alt=""></p>
		</div>
	</div-->

		
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
<iframe name="action_ifrm" id="action_ifrm" width="0" height="0" frameborder="0" ></iframe>
 <script type="text/javascript" src="./lib/js/validation/validation.js"></script>
 <script type="text/javascript">
 
	function nextFocus(obj, next_obj){
		if (parseInt($("#"+obj).val().length) == parseInt($("#"+obj).attr("maxlength"))){
			$("#"+next_obj).focus();
			//$("#"+obj).focusout()
			//$("#"+next_obj).focusin().focus();
		}
		
	}

	function id_chk(){

		if ($("#id").val() == ""){
			alert("Please enter your ID");
			$("#id").focus();
			return;
		}

		if (document.getElementById("id").value.length < 3 || document.getElementById("id").value.length > 12){
			alert("Please enter ID is less than twelve letters at least two characters");
			return;
		}

		$.ajax({
			
			url: "./id_chk.me",
			data: {id: $("#id").val()},
			async: true,
			error: function(xhr){
						alert('Error~');
					},
			success: function(data){
								if (data == "Y"){
									$("#id_ck").val("Y");
									alert("The ID that can be used");
									return;
								}
								else{
									$("#id_ck").val("N");
									alert("The ID can not be used");
									return;
								}
						   }
			});		
	}

	
	function email_chk(){

		if ($("#email1").val() == ""){
			alert("Please enter your E-mail");
			$("#email1").focus();
			return;
		}

		if ($("#email2").val() == ""){
			alert("Please enter your E-mail");
			$("#email2").focus();
			return;
		}

		$.ajax({
			url: "./email_chk.me",
			data: {email1: $("#email1").val(), email2: $("#email2").val()},
			async: true,
			error: function(xhr){
						alert('Error~');
					},
			success: function(data){
				/* var random = Math.round( Math.random()*999999 ); */
								if (data == "Y"){
									$("#email_ck").val("Y");
									$("#onechk").val("45555");
								 		
									alert("The E-mail that can be used");
									return;
								}
								else{
									$("#email_ck").val("N");
									alert("The E-mail that can not be used");
									return;
								}
						   }
			});	

	}

	/* function email_code(){

		if($("#email_ck").val() == "N"){
			alert('Please check your email ');
			return;
		}

		if($('#email1').val() == ""){
			alert('Please enter your email');
			$('#email1').focus();
			return;
		}

		if($('#email2').val() == ""){
			alert('Please enter your email domain name');
			$('#email2').focus();
			return;
		}

		$.ajax({
			url: "/email_code.me",
			data: {email1: $('#email1').val(), email2: $('#email2').val(), code: $('#onechk').val()},
			async: true,
			error: function(xhr){alert('Ajax Error !!!\n'+xhr)},
			success: function(data){
				if(data == "SEND"){
					alert('Sent a verification number to your email.');
					return;
				}else{
					alert('Failed to send email.');
					return;
				}
			}
		});
	
	}
 */

	$(function(){
		$("#submit_img").css("cursor","pointer").bind("click",function(){
			go_join();
		})
	})

	function go_join(){
		var check = new validation();

		if($('#name').val() == ""){
			alert('Please enter your Name');
			$('#name').focus();
			return;
		}

		if($('#id').val() == ""){
			alert('Please enter your ID');
			$('#id').focus();
			return;
		}

		if (document.getElementById("id").value.length < 3 || document.getElementById("id").value.length > 12){
			alert("Please enter ID is less than twelve letters at least two characters");
			document.getElementById("id").focus();
			return;
		}
		if ($("#id_ck").val() == "N"){
			alert("Please verify your username duplicate");
			return;
		}

		if($('#pwd').val() == ""){
			alert('Please enter your Password');
			$('#pwd').focus();
			return;
		}
		
		//if (!check.nullcheck("pwd", "Password")) return;

		if (document.getElementById("pwd").value.length < 4 ){
			alert("Please enter at least four characters password");
			document.getElementById("pwd").focus();
			return;
		}

		if($('#re_pwd').val() == ""){
			alert('Confirm your password');
			$('#re_pwd').focus();
			return;
		}

		//if (!check.nullcheck("re_pwd", "비밀번호 확인")) return;

		if ($("#pwd").val() != $("#re_pwd").val()){
			$("#pwd_ck").val("N")
			alert("Passwords do not match");
			return;
		}
		else{
			$("#pwd_ck").val("Y");
		}
		if ($("#pwd_ck").val() == "N"){
			alert("Please, match the password");
			return;
		}

		if($('#nation').val() == ""){
			alert('Please enter your Country');
			$('#nation').focus();
			return;
		}

		if($('#email1').val() == ""){
			alert('Please enter your E-mail');
			$('#email1').focus();
			return;
		}

		if($('#email2').val() == ""){
			alert('Please enter your E-mail');
			$('#email2').focus();
			return;
		}

		//if (!check.nullcheck("nation", "국가")) return;
		//if (!check.nullcheck("email1", "이메일")) return;
		//if (!check.nullcheck("email2", "이메일")) return;

		if ($("#email_ck").val() == "N"){
			alert("Please check your email to duplicate");
			return;
		}

		if($('#onechk').val() != $('#ckval').val()){
			alert('E-mail confirmation code is incorrect.');
			return;
		}

		$("#join_Frm").attr({"target":"action_ifrm","action":"./joinaction.me"});
		$("#join_Frm").submit();
	}


	function post_popup(){
		window.open("/post.jsp", "post_popup", 'width=430, height=420, scrollbars=no');
	}
 	

 </script>

	<!--Container-->
	<div id="container_m">

		<!-- join -->
	<div class="join01">
		<p class="join_title"><img src="image/member/join.png" alt=""/></p>
		<div class="join_contents">
		<form name="join_Frm" id="join_Frm" method="post" >
		<input type="hidden" name="pwd_ck" id="pwd_ck" value="N">
		<input type="hidden" name="id_ck" id="id_ck" value="N">
		<input type="hidden" name="email_ck" id="email_ck" value="N">
		<input type="hidden" name="nick_ck" id="nick_ck" value="N">
		<input type="hidden" name="flag" id="flag" value="for">
		<!-- <input type="hidden" name="onechk" id="onechk" value=""> -->
		<input type="hidden" name="charset" id="charset" value="eng">
		<div class="join02">

			<p class="sub_text_title mt20">Register for the following items: Please enter the correct</p>
			<p class="">* By signing up, you agree to our Terms of Use, Privacy and to receive our emails, newsletters & updates. </p>

			<dl class="join2">
				<dt>Name</dt>
				<dd>
					<input type="text" class="j_in01" name="name" id="name" >
				</dd>
				<dt>ID</dt>
				<dd>
					<input type="text" class="j_in01" maxlength="20" name="id" id="id"> <a onclick="id_chk();" style="cursor:pointer;"><img src="image/member/btn_name.png" style="vertical-align:middle;"></a> 
				<!-- &nbsp; * 4~12자의 영문 대소문자와 숫자와 '_' 만 가능합니다. -->
				</dd>
				<dt>Password</dt>
				<dd><input type="password" class="j_in01" title="Password" value="" name="pwd" id="pwd" maxlength="12"></dd>

				<dt>Repeat Password</dt>
				<dd><input type="password" class="j_in01" title="Password" value="" name="re_pwd" id="re_pwd" maxlength="12"></dd>


				<dt>Nation</dt>
				<dd>
					<input type="text" class="j_in01" name="nation" id="nation" >
				</dd>
				<dt>E-mail</dt>
				<dd>
					<input type="text" class="j_in01" title="E-mail" value="" name="email1" id="email1"> @ <input type="text" class="j_in01" title="이메일 선택란" value="" name="email2" id="email2" >
					<a onclick="email_chk();" style="cursor:pointer;"><img src="img/btn_name.png" style="vertical-align:middle;"></a>
				</dd>
				<!-- <dt>E-mail Check</dt>
				<dd>
					<input class="j_in01"type="text" name="ckval" id="ckval"> <button type="button" onclick="email_code()">E-mail confirmation</button>
				</dd> -->
			</dl>
		</div>
		<p class="join_text03">When creating an account make sure to type in the right information or else there could be disadvantages on later events or notices.</p>
		</form>

	<p class="btn a_center mt30 mb30">
		<a href="./login_new.me">
		<img src="image/member/btn_ok_en.jpg" alt="" id="submit_img" />
		</a> 
	
		<a href="./login_new.me">
			<img src="image/member/btn_can_en.jpg" />
		</a>
	</p>
	</div><!-- END join -->
	</div>

	</div><!--END Container-->



	<!--Quick-->
	<!--div id="quick">
		<ul>
			<li><a href="/"><img src="image/common/quick_home.png" alt="HOME"></a></li>	
				
					<li><a href="./login_new.jsp"><img src="image/common/quick_login.png" alt="LOGIN"></a></li>
					<li><a href="./join_new.jsp"><img src="image/common/quick_join.png" alt="JOIN"></a></li>
				
		</ul>
	</div--><!--END Quick-->
	<!--Footer-->
	<div id="footer">
		<p class="pt20 pb20">Seventeen Copyrightⓒ2013 PLEDIS Co.,Ltd. All Rights Reserved.</p>
	</div><!--END Footer-->
	
 </div><!--END Wrap-->
  
 </body>
</html><iframe name="action_ifrm" id="action_ifrm" width="0" height="0" frameborder="0" ></iframe>