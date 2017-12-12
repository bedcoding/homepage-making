<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="net.board.db4.BoardBean"%> 
<%
	String id=(String)session.getAttribute("loggedID");
	BoardBean board=(BoardBean)request.getAttribute("boarddata");
	System.out.println("id 들어왔나 체크: "+id);
%>



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
	
	<script language="javascript">
	function addboard()
	{
		boardform.submit();
	}
	</script>

 </head>

 
 <body>
 <!--Wrap-->
 <div id="wrap">	
	<p class="m_top"><img src="image/main/main_blue.jpg" border="0" alt=""></p>
	
	
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
<!--Container-->
<div id="container_msub">
	<div class="board_01" >
		<p class="board_title"><img src="image/sub/board_title01.jpg" border="0" alt="notice"></p>
		
 
 <link type="text/css" rel="stylesheet" href="css/board.css" />

	<div id="s_container">
		<p class="subimgArea04"></p>
		
<div class="sc_box">


<div class="right_cons">
 <div id="board_area" class="pt40" >
		
		
		<form action="./BoardAddAction.bo4" method="post" enctype="multipart/form-data" name="boardform">
			<table cellpadding="0" cellspacing="0" class="free_board_view" summary="" >
				
 				<tr>
					<th><img src="board_img/t_02.png" width="31" height="14" border="0" alt="작성자"></th>
					<td>
						<input type="text" name="BOARD_NAME" value="<%=id %>" readonly class="write_bar_close">
					</td>
					<th><img src="board_img/t_pass.png" width="41" height="14" border="0" alt="비밀번호"></th>
					<td><input type="password" class="write_bar" name="BOARD_PASS" value="" />				
					</td>
				</tr>
				
				<tr>
					<th><img src="board_img/t_01.png" width="30" height="14" border="0" alt="제 목"></th>
					<td colspan="3">
					<input type="text" class="write_title" title="title"  name="BOARD_SUBJECT" value="" />
					</td>
				</tr>
				
				<tr>
					<th><img src="board_img/t_05.png" width="41" height="14" border="0" alt="파일첨부"></th>
					<td colspan="3">
					<input type="file" name="BOARD_FILE" class="write_file" >
						
					</td>
				</tr>
				
				<tr>
					<th><img src="board_img/t_06.png" width="30" height="14" border="0" alt="내 용"></th>
					<td colspan="3">
					<textarea name="BOARD_CONTENT" class="write_texta" title="">
					
					</textarea>
					</td>
				</tr>
			</table>
		</form>
			
			
			<!--Button-->
			<div class="board_btn"> 
				<tr align="center" valign="middle">
					<td colspan="5">
						<input type="button" class="board_bt_style01" value="작성하기" onclick="location.href='javascript:addboard()' " />
						<input type="button" class="board_bt_style02" value="취소하기" onclick="location.href='javascript:history.go(-1)' " />
					</td>
				</tr>
			</div>
		
		
		<br /><br />
 </div><!--END Board-->
<script type="text/javascript" src="/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="/lib/js/validation/validation.js"></script>
<script type="text/javascript">

	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "contents",
		sSkinURI: "/smarteditor/SmartEditor2Skin.html",	
		htParams : {
			bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			fOnBeforeUnload : function(){
				//alert("아싸!");	
			}
		}, //boolean
		fOnAppLoad : function(){
			//예제 코드
			//oEditors.getById["contents"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
		},
		fCreator: "createSEditor2"
	});

	$(function(){
		$("#write_img").css("cursor","pointer").bind("click",function(){
			go_write(1);
		})

		$("#reply_img").css("cursor","pointer").bind("click",function(){
			go_write(2);
		})

		$("#del_img").css("cursor","pointer").bind("click",function(){
			go_del();
		})
	})

	function writeBtnBind(){
		$("#write_img").css("cursor","pointer").bind("click",function(){
			go_write(1);
		})	
	}

	function go_write(n){
		var check = new validation();

		oEditors.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);

		if (!check.nullcheck("users", "이름")) return;
		if (!check.nullcheck("pwd", "비밀번호")) return;
		if (!check.nullcheck("title", "제목")) return;
		if (!check.nullcheck("contents", "내용")) return;

		$("#write_img").unbind("click");
		$("#write_Frm").attr({"target":"action_ifrm","action":"/asp/board/general/write_proc.asp"});
		$("#write_Frm").submit();
	}

</script>
<iframe name="action_ifrm" id="action_ifrm" width="0" height="0" frameborder="0" ></iframe></div></div></div>

	</div>
</div><!--END Container-->

	<!--Footer-->
	<div id="footer">
		<p class="pt20 pb20">Seventeen Copyrightⓒ2013 PLEDIS Co.,Ltd. All Rights Reserved.</p>
	</div><!--END Footer-->
	
 </div><!--END Wrap-->
  
 </body>
</html>
<script type="text/javascript">


function setCookie(name,value,expiredays) {	
	var today = new Date();
	today.setDate(today.getDate()+expiredays);
	document.cookie = name + "=" + escape(value) + "; path=/; expires=" + today.toGMTString() + ";";
}

function getCookie( name ) {
   var nameOfCookie = name + "="; 
   var x = 0; 
   while ( x <= document.cookie.length ) 
   { 
		   var y = (x+nameOfCookie.length); 
		   if ( document.cookie.substring( x, y ) == nameOfCookie ) { 
				   if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 ) 
						   endOfCookie = document.cookie.length; 
				   return unescape( document.cookie.substring( y, endOfCookie ) ); 
		   } 
		   x = document.cookie.indexOf( " ", x ) + 1; 
		   if ( x == 0 ) 
				   break; 
   } 
   return ""; 
}



var popups = "".split(",");

function popupLocationGo(url, target){
	if (target == 1) //부모창... 요기는 현재 자신창
	{
		location.href= url;
	}
	else
	{
		window.open(url, '', '');
	}
}

function layerPopupDisplay(obj){
//	alert(obj);
//	return;
	$("#" + obj).css("display", "none");
}

$(function(){
	$(popups).each(function(n){		
		
		var this_name = popups[n].substring(0, popups[n].lastIndexOf("_"));
		var this_type = popups[n].substring(popups[n].lastIndexOf("_") + 1, popups[n].length);
		var this_idx = popups[n].split("_")[1];
		
		if (getCookie(this_name) != "no")
		{
			if (this_type == 1) // 팝업형
			{
				window.open('/popup/img_popup.asp?seq='+this_idx, 'tomato_popup_'+n, 'width=50, height=50, left=0, top=0, toolbar=no, menubar=no, scrollbars=no');
			}
			else //레이어형
			{		
				$.get("/popup/layer_popup.asp", {seq:this_idx}, function(data){$(window.document.body).append(data);});				
			}
		}		
	});
});
</script>