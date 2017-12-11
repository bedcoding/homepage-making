<%@ page import="net.board.db.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("UTF-8");
	BoardBean board = (BoardBean)request.getAttribute("boarddata");
int p = 1;
if (request.getAttribute("prev") != null) {
   p = (Integer) request.getAttribute("prev");
   System.out.println("CHECK(request)------->" + p);
}
String s = "board_view 테스트";

s = (String) request.getAttribute("prevSub");
System.out.println("CHECK(request)------->" + s);

int n =1; String sn = "board_view 테스트2";

if(request.getAttribute("next")!=null){
   n = (Integer) request.getAttribute("next");
   System.out.println("CHECK(request)------->" + n);
}
sn = (String) request.getAttribute("nextSub");
System.out.println("CHECK(request)------->" + sn);

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
<!--Container-->
<div id="container_msub">
	<div class="board_01" >
		<p class="board_title"><img src="image/sub/board_title01.jpg" border="0" alt="notice"></p>
		
		
<script type="text/javascript" src="lib/js/validation/validation.js"></script>

<!-- 
<script type="text/javascript">

// 자바스크립트로 게시글 수정/삭제를 구현한 것 (하지만 우리는 MVC2 패턴으로 할 것이므로 아예 날림) 
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

	function go_write(n){
		if (n==2){
			mode = "reply";
			location.href="data_writec8e3.html?board_seq=108&amp;board_code=1&amp;mode="+mode;
		}
		else{
			$("#flag").val('edit');
			$("#pwd_chk").show();
			mode = "edit"
		}
	}

	function go_del(){
		$("#flag").val('del');
		$("#pwd_chk").show();
	}

	function pwd_check(){
		$.ajax({
			type: "post",
			url: "/asp/board/general/_pwd_chk.asp",
			data: {chk_pwd: $("#chk_pwd").val(), board_seq : 108},
			dataType: "json",
			async: true,
			error: function(xhr){
						alert('에러발생!!');
					},
			success: function(data){
								if (data == "_ok"){
									if ($("#flag").val() == "edit"){
										location.href="data_write1251.html?board_seq=108&amp;board_code=1&amp;mode=edit";
									}
									else{
										real_del();
									}
								}
								else{
									alert("비밀번호가 일치하지 않습니다");
									return;
								}
						   }
			});	
	}

	function real_del(){
		if (confirm("정말 삭제하시겠습니까?")){
			$("#del_Frm").attr("target","action_ifrm");
			$("#del_Frm").attr("action","board/general/view_del.html");
			$("#del_Frm").submit();
		}	
	}

 </script>
 -->

<link type="text/css" rel="stylesheet" href="css/board.css" />

	<div id="s_container">
		<p class="subimgArea04"></p>
		
<div class="sc_box">

<div class="right_cons">
	
 <div id="board_area" class="pt35">
		<!--Board_View-->
		<table cellpadding="0" cellspacing="0" class="free_board_view" summary="" >
			<form name="write_Frm" id="write_Frm" method="post" enctype="multipart/form-data">
			<input type="hidden" name="board_seq" id="board_seq" value="108">
			<input type="hidden" name="user_seq" id="user_seq" value="1">
			<input type="hidden" name="board_code" id="board_code" value="1">
			<input type="hidden" name="mode" id="mode" value="edit">
			<input type="hidden" name="user_email" id="user_email" value="">
			<input type="hidden" name="parameter" id="parameter" value="?board_code=1&types=&search_val=&page=19">
			<input type="hidden" name="tbname" id="tbname" value="boardgeneral">
			<input type="hidden" name="user_name" id="user_name" value="">
			<input type="hidden" name="COMMENT_IDX" id="COMMENT_IDX" value="">
			<input type="hidden" name="pwdck_flag" id="pwdck_flag" value="general">
			<input type="hidden" name="flag" id="flag">
	
			<caption>free_board_view</caption>
			<colgroup>
				<col width="85"/><col width="*"/><col width="85"/><col width="100"/><col width="85"/><col width="100"/>
			</colgroup>
			<tbody>
				<tr>
					<th><img src="board_img/t_01.png" border="0" alt="제 목 "></th>
					<td colspan="4" class="board_title01" style="padding-left:10px;" > <%=board.getBOARD_SUBJECT()%> 
					</td>
					
					<td style="text-align:center;"><!-- sns버튼추가 
					<span><a href="#"><img src="../board_img/bt_metoday.gif" width="16" height="16" border="0" alt=""></a></span>
					<span><a href="#"><img src="../board_img/bt_twitter.gif" width="16" height="16" border="0" alt=""></a></span>
					<span><a href="#"><img src="../board_img/bt_facebook.gif" width="17" height="16" border="0" alt=""></a></span>
					sns버튼추가 끝 -->
					</td>
					 
				</tr>
				<tr>
					<th><img src="board_img/t_05.png" width="41" height="14" border="0" alt="첨부파일"></th>
					<td style="padding-left:10px;" >	
						
									<!--<img src="/board_img/file/jpg.gif">-->
								
									<!--<img src="../board_img/document-wordpdfexceljpg.gif" width="16" height="16" border="0" alt="">-->
								
							<input type="hidden" name="file_seq" id="file_seq" value="15">
								
								<%if(!(board.getBOARD_FILE()==null)){ %>
									<a href="boardupload/<%=board.getBOARD_FILE()%>">
										<%=board.getBOARD_FILE() %>
									</a>	
									<%} %>
															


							<!-- <img src="board_img/file/jpg.gif"> -->
							
					</td>
					<th style="padding-left:10px;" ><img src="board_img/t_02.png" width="31" height="14" border="0" alt="작성자"></th>
					<td class="board_data" style="padding-left:10px;" ><%=board.getBOARD_NAME() %></td>
					<th><img src="board_img/t_04.png" border="0" alt="등록일 "></th>
					<td class="board_data" style="padding-left:10px;" ><%=board.getBOARD_DATE() %></td>
				</tr>
				<tr>
					<td colspan="6">
						<div class="view_pd">
							<div class="_1x1">
<div class="userContentWrapper">

<%=board.getBOARD_CONTENT() %>

</div></div></div>
					
						
					</td>
				</tr>
			</tbody>
		</table>
		<!-- END View -->

		<!-- Comment -->
		
		<!--Preview/Next-->
		<form>
		<table cellpadding="0" cellspacing="0" class="pre_next" summary=""   >
			<caption>이전글/다음글</caption>
			<colgroup>
				<col width="80"/><col width=""/>
			</colgroup>
			<tbody>
				<tr>
					<th><img src="board_img/t_prev.png" width="44" height="11" border="0" alt="이전글"></th>
					
					<td class="title_area">
					
					
<%
	if (request.getAttribute("prev") != null) 
	{
%>		<a href="./BoardDetailAction.bo?num=<%=p%>"><%=s%></a> <%
    }
	
	else
	{
%>		이전글이 없습니다.
<%
 	}
%>
						
						<%-- <%=board.getBOARD_SUBJECT()%> --%>
						
					</td>
				</tr>
				
				<tr>
					<th><img src="board_img/t_next.png" width="44" height="11" border="0" alt="다음글"></th>
					
					<td class="title_area">
						
<%
    if (request.getAttribute("next") != null) 
    {
%>
 
 <a href="./BoardDetailAction.bo?num=<%=n%>"><%=sn%></a> 
<%
    }

    else
    {
%> 		다음글이 없습니다.
<%
    }
%>
					</td>
				</tr>
			</tbody>
		</table>
		</form>
		
		
		<!--Button-->
		<div style="position:relative;top:0px;left:0px;z-index:9999;display:none;" id="pwd_chk">
		<div style="position:absolute;top:-100px;left:0px;">
		<table width="290"  border="0" cellpadding="0" cellspacing="5" style="background-color:#fff; border:2px solid #555;"  align="center">
			<tr>
			  <td>
			   <table width="260" height="100"  border="0" cellpadding="0" cellspacing="0" align="center" style="background-color:#fff">
					<tr>
					<td colspan="2" height="0" style="border:0px;"></td>
					</tr>
					<input type="hidden" name="bbs_view_edit" value="1">
					<tr align="center">
					<td align="right">&nbsp;&nbsp;&nbsp; <b>비밀번호</b></td>
					<td align="left"> &nbsp;&nbsp;<input type="password" name="chk_pwd" id="chk_pwd" class="input" style="border:1px solid #ccc; height:20px;width:145px;"></td>
				  </tr>

				  <tr>
					<td colspan="2" height="23" align="center">
						<input type="image" src="image/sub/pop_regist.gif" border=0  value="submit" style="padding-bottom:15px" onclick="pwd_check();" style="vertical-align:top;">&nbsp;
						<a onclick="$('#pwd_chk').hide();$('#chk_pwd').val('');" style="cursor:pointer;" ><img src="image/sub/pop_cancel.gif" border="0"style="vertical-align:top;"  ></a>
					</td>
				  </tr>
			  </table></td>
			</tr>
		  </table>
		  </div>
		 </div>
		<div class="board_btn">
			<p class="board_fLeft">
				<input type="button" class="board_bt_style01" title="수정하기" value="수정하기" name="" id="write_img" onClick="location='./BoardModify.bo?num=<%=board.getBOARD_NUM() %>' " />
				<input type="button" class="board_bt_style02" title="삭제하기" value="삭제하기" name="" id="del_img" onClick="location='./BoardDelete.bo?num=<%=board.getBOARD_NUM() %>' "/>
			</p>
			<p class="board_fRight"><input type="button" class="board_bt_style01" title="목록으로" value="목록으로" name="" onClick="location='./BoardList.bo'"/></p>

		</div>
		<br /><br />
 </div><!--END Board-->
<form name="del_Frm" id="del_Frm" method="post" >
<input type="hidden" name="del_board_seq" id="del_board_seq" value="108">
<input type="hidden" name="del_board_code" id="del_board_code" value="1">
<input type="hidden" name="list_page" id="list_page" value="notice_new.html">
</form></div></div></div>
<iframe name="action_ifrm" id="action_ifrm" width="0" height="0" frameborder="0" ></iframe>		

	</div>
</div><!--END Container-->

	<!--Footer-->
	<div id="footer">
		<p class="pt20 pb20">Seventeen Copyrightⓒ2013 PLEDIS Co.,Ltd. All Rights Reserved.</p>
	</div><!--END Footer-->
	
 </div><!--END Wrap-->
  
 </body>

<!-- Mirrored from seventeen-17.com/asp/data_view.asp?board_seq=108&parameter=&board_code=1&types=&search_val=&page=19 by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 06 Dec 2017 08:09:39 GMT -->
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
				window.open('../popup/img_popupfa50.html?seq='+this_idx, 'tomato_popup_'+n, 'width=50, height=50, left=0, top=0, toolbar=no, menubar=no, scrollbars=no');
			}
			else //레이어형
			{		
				$.get("../popup/layer_popup.html", {seq:this_idx}, function(data){$(window.document.body).append(data);});				
			}
		}		
	});
});
</script>