
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 
<!-- Mirrored from seventeen-17.com/asp/notice_new.asp by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 06 Dec 2017 07:19:56 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
<head>
  <title> SEVENTEEN Official website </title>
  <meta name="Author" content="minee">
  <meta name="Publisher" content="MyelHub">
  <meta name="Description" content="">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=9">
  <link type="text/css" rel="stylesheet" href="../css/default.css" />
  <script type="text/javascript" src="../../code.jquery.com/jquery-1.7.1.min.js"></script>
  <script type="text/javascript" src="../js/doorer.js"></script>
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
			<p><img src="../image/main/poster_nt.jpg" width="980" height="728" border="0" alt=""></p>
		</div>
	</div-->

		
	<p class="m_top"><img src="../image/main/main_blue.jpg"border="0" alt=""></p>
	<!--Header-->
	<div id="header_new">
		<ul class="m_menu">
			<li><img src="../image/common/menu/menu_left.jpg"border="0" alt=""></li>
			<li><a href="../index.html"><img src="../image/common/menu/menu01.jpg" border="0" alt=""></a></li>
			<!--li><a href="../index_02.asp"><img src="../image/common/menu/menu01.jpg" border="0" alt=""></a></li-->
			<li><a href="profile.html"><img src="../image/common/menu/menu02.jpg" border="0" alt=""></a></li>
			<!--li><a href="javascript:alert('준비중입니다');"><img src="../image/common/menu/menu02.jpg" border="0" alt=""></a></li-->
			<li><a href="notice_new.html"><img src="../image/common/menu/menu03.jpg" border="0" alt=""></a></li>
			<li><a href="schedule.html"><img src="../image/common/menu/menu04.jpg" border="0" alt=""></a></li>
			<li><a href="vote_newff79.html?cate_idx=42"><img src="../image/common/menu/menu05.jpg" border="0" alt=""></a></li>
			<!--li><a href="javascript:alert('준비중입니다');"><img src="../image/common/menu/menu05.jpg" border="0" alt=""></a></li-->
			<li><a href="fanboard.html"><img src="../image/common/menu/lnb01.jpg" border="0" alt=""></a></li>
			<li><a href="from_st.html"><img src="../image/common/menu/lnb02.jpg" border="0" alt=""></a></li>
			
				<li><a href="login_new.html"><img src="../image/common/menu/lnb03.jpg" border="0" alt=""></a></li>
			
			<li><img src="../image/common/menu/menu_right.jpg"border="0" alt=""></li>
		</ul>
	</div><!--END Header-->
	<iframe name="action_ifrm" id="action_ifrm" width="0" height="0" frameborder="0" ></iframe>

<!--Container-->
<div id="container_msub">
			<ul class="notice_new_btn">
				<li class="bdl"><a href="notice_new.html" class="b_on">NOTICE</a></li>
				<li><a href="appliance.html">APPLICATION</a></li>
			</ul>
	<div class="board_01" >
			
			

		<p class="board_title"><img src="../image/sub/board_title01.jpg" border="0" alt="notice"></p>
		
<link type="text/css" rel="stylesheet" href="../css/board.css" />

<script type="text/javascript">

	$(function(){

		$("#search_img").css("cursor","pointer").bind("click",function(){
			/*
			if (document.getElementById("types").value != ""){
				if ($("#search_val").val() == ""){
					alert("검색어를 입력해 주세요");
					return;
				}
			}
			*/
			$("#search_Frm").submit();
		})
	})


	function pwd_check(board_seq,i){
		if ($("#chk_pwd"+i).val() == ""){
			alert("비밀번호를 입력해 주세요");
			$("#chk_pwd"+i).focus();
			return;
		}

		$.ajax({
			url: "/asp/board/general/_pwd_chk.asp",
			data: {chk_pwd: $("#chk_pwd"+i).val(), board_seq : board_seq},
			dataType: "json",
			async: true,
			error: function(xhr){
						alert('에러발생!!');
					},
			success: function(data){
								if (data == "_ok"){
									location.href="data_view81cc.html?board_seq="+board_seq+"&parameter=&board_code=1&types=&search_val=&page=1";
								}
								else{
									alert("비밀번호가 일치하지 않습니다");
									return;
								}
						   }
			});	
	}

	function viewpwd(j){
		
			if (j==1)
			{
				$("#pwd_chk"+(j)).show();
			}
			else{
				$("#pwd_chk1").hide();
			}
		
			if (j==2)
			{
				$("#pwd_chk"+(j)).show();
			}
			else{
				$("#pwd_chk2").hide();
			}
		
			if (j==3)
			{
				$("#pwd_chk"+(j)).show();
			}
			else{
				$("#pwd_chk3").hide();
			}
		
			if (j==4)
			{
				$("#pwd_chk"+(j)).show();
			}
			else{
				$("#pwd_chk4").hide();
			}
		
			if (j==5)
			{
				$("#pwd_chk"+(j)).show();
			}
			else{
				$("#pwd_chk5").hide();
			}
		
			if (j==6)
			{
				$("#pwd_chk"+(j)).show();
			}
			else{
				$("#pwd_chk6").hide();
			}
		
			if (j==7)
			{
				$("#pwd_chk"+(j)).show();
			}
			else{
				$("#pwd_chk7").hide();
			}
		
			if (j==8)
			{
				$("#pwd_chk"+(j)).show();
			}
			else{
				$("#pwd_chk8").hide();
			}
		
			if (j==9)
			{
				$("#pwd_chk"+(j)).show();
			}
			else{
				$("#pwd_chk9").hide();
			}
		
			if (j==10)
			{
				$("#pwd_chk"+(j)).show();
			}
			else{
				$("#pwd_chk10").hide();
			}
		
	}

</script>
<div class="right_cons">
 <div id="board_area">
	<div class="board_search">
		<form name="search_Frm" id="search_Frm" action="http://seventeen-17.com/asp/notice_new.asp" method="get" >
		<input type="hidden" name="board_code" value="1">
		<select name="types" id="types" >
			<option value="">전체</option>
			<option value="title" >제목</option>
			<option value="CONTENTS" >내용</option>
		</select>
		<input type="text" name="search_val" id="search_val" value="" class="board_bottom_bar">
		<input type="button" class="board_bt_style03" title="" value="검색" name="" id="search_img">
		</form>
	</div>
	<!--Board_list-->
	<table cellpadding="0" cellspacing="0" class="free_board" summary="" >
		<caption>free_board</caption>
		<colgroup>
		<col width="61"/><col width="636"/><col width="110"/><col width="83"/>
		</colgroup>
		<thead>
			<tr>
				<th class="th_bg1">NO</th>
				<th class="th_bg2">SUBJECT</th>
				<th class="th_bg3">DATE</th>
				<th class="th_bg4">ID</th>
			</tr>
		</thead>
		<tbody>
			
			<tr>
				<td><span class="notice_bg"><img src="../board_img/notice.png" border="0" alt=""></span></td>
				<td class="title_area">
				<!-- 비밀글일때 아이콘 붙는것 -->
				
						<a href="data_view6ff1.html?board_seq=31926&amp;parameter=&amp;board_code=1&amp;types=&amp;search_val=&amp;page=1">
					[NOTICE] 안녕하세요, 플레디스 입니다. 
					</a>
				</td>

				<td>2017.06.05</td>
				<td class="board_data">STAFF</td>
			</tr>
			
			<tr>
				<td><span class="notice_bg"><img src="../board_img/notice.png" border="0" alt=""></span></td>
				<td class="title_area">
				<!-- 비밀글일때 아이콘 붙는것 -->
				
						<a href="data_view398b.html?board_seq=30334&amp;parameter=&amp;board_code=1&amp;types=&amp;search_val=&amp;page=1">
					[NOTICE] 세븐틴(SEVENTEEN)팬클럽 캐럿(CARAT)의 공식 색상을 발표 합니다.
					</a>
				</td>

				<td>2016.10.06</td>
				<td class="board_data">STAFF</td>
			</tr>
			
			<tr>
				<td><span class="notice_bg"><img src="../board_img/notice.png" border="0" alt=""></span></td>
				<td class="title_area">
				<!-- 비밀글일때 아이콘 붙는것 -->
				
						<a href="data_view8f3b.html?board_seq=29937&amp;parameter=&amp;board_code=1&amp;types=&amp;search_val=&amp;page=1">
					[NOTICE] 팬클럽 규칙 및 질서유지 관련 안내사항입니다. 
					</a>
				</td>

				<td>2016.08.11</td>
				<td class="board_data">STAFF</td>
			</tr>
			
			<tr>
				<td>184</td>
				<td class="title_area">
				
				
				<!-- 비밀글일때 아이콘 붙는것 -->
				
						<a href="data_view80f7.html?board_seq=32155&amp;parameter=&amp;board_code=1&amp;types=&amp;search_val=&amp;page=1">
					[NOTICE] 2017 세븐틴 1ST WORLD TOUR ‘DIAMOND EDGE-서울 빨간우체통 당첨자 ..
					</a>
				</td>

				<td>2017.08.22</td>
				<td class="board_data">STAFF</td>
			</tr>
			
			<tr>
				<td>183</td>
				<td class="title_area">
				
				
				<!-- 비밀글일때 아이콘 붙는것 -->
				
						<a href="data_view1094.html?board_seq=32121&amp;parameter=&amp;board_code=1&amp;types=&amp;search_val=&amp;page=1">
					[NOTICE] 팬클럽 규칙 및 질서 유지 관련 안내 입니다.
					</a>
				</td>

				<td>2017.08.04</td>
				<td class="board_data">STAFF</td>
			</tr>
			
			<tr>
				<td>182</td>
				<td class="title_area">
				
				
				<!-- 비밀글일때 아이콘 붙는것 -->
				
						<a href="data_view48e1.html?board_seq=32097&amp;parameter=&amp;board_code=1&amp;types=&amp;search_val=&amp;page=1">
					[NOTICE] 세븐틴＜OFFICIAL LIGHT STICK CARAT BONG＞온라인 4차 판매 공지 및 ..
					</a>
				</td>

				<td>2017.07.28</td>
				<td class="board_data">STAFF</td>
			</tr>
			
			<tr>
				<td>181</td>
				<td class="title_area">
				
				
				<!-- 비밀글일때 아이콘 붙는것 -->
				
						<a href="data_viewa2db.html?board_seq=32044&amp;parameter=&amp;board_code=1&amp;types=&amp;search_val=&amp;page=1">
					[NOTICE] 2017 세븐틴 1ST WORLD TOUR ‘DIAMOND EDGE-서울’ 공식 MD 현장 ..
					</a>
				</td>

				<td>2017.07.10</td>
				<td class="board_data">STAFF</td>
			</tr>
			
			<tr>
				<td>180</td>
				<td class="title_area">
				
				
				<!-- 비밀글일때 아이콘 붙는것 -->
				
						<a href="data_view2287.html?board_seq=32018&amp;parameter=&amp;board_code=1&amp;types=&amp;search_val=&amp;page=1">
					[NOTICE] 세븐틴 공식 팬클럽 CARAT 2기 팬클럽 물품 배송 관련 공지. 
					</a>
				</td>

				<td>2017.06.30</td>
				<td class="board_data">STAFF</td>
			</tr>
			
			<tr>
				<td>179</td>
				<td class="title_area">
				
				
				<!-- 비밀글일때 아이콘 붙는것 -->
				
						<a href="data_view3313.html?board_seq=32002&amp;parameter=&amp;board_code=1&amp;types=&amp;search_val=&amp;page=1">
					[NOTICE] 2017 세븐틴 1ST  WORLD TOUR &#39;DIAMOND EDGE&#39; –  ..
					</a>
				</td>

				<td>2017.06.23</td>
				<td class="board_data">STAFF</td>
			</tr>
			
			<tr>
				<td>178</td>
				<td class="title_area">
				
				
				<!-- 비밀글일때 아이콘 붙는것 -->
				
						<a href="data_viewed99.html?board_seq=32001&amp;parameter=&amp;board_code=1&amp;types=&amp;search_val=&amp;page=1">
					[NOTICE] 2017 세븐틴 1ST WORLD TOUR ‘DIAMOND EDGE 공식 MD 상세 안내. 
					</a>
				</td>

				<td>2017.06.23</td>
				<td class="board_data">STAFF</td>
			</tr>
			
			<tr>
				<td>177</td>
				<td class="title_area">
				
				
				<!-- 비밀글일때 아이콘 붙는것 -->
				
						<a href="data_view5763.html?board_seq=32000&amp;parameter=&amp;board_code=1&amp;types=&amp;search_val=&amp;page=1">
					[NOTICE] 2017 세븐틴 1ST WORLD TOUR ‘DIAMOND EDGE 공식 MD 예약판매 안내
					</a>
				</td>

				<td>2017.06.22</td>
				<td class="board_data">STAFF</td>
			</tr>
			
			<tr>
				<td>176</td>
				<td class="title_area">
				
				
				<!-- 비밀글일때 아이콘 붙는것 -->
				
						<a href="data_viewfe2b.html?board_seq=31998&amp;parameter=&amp;board_code=1&amp;types=&amp;search_val=&amp;page=1">
					[NOTICE] 세븐틴 4th Mini Album &#39;Al1&#39; 팬사인회 공지
					</a>
				</td>

				<td>2017.06.21</td>
				<td class="board_data">STAFF</td>
			</tr>
			
			<tr>
				<td>175</td>
				<td class="title_area">
				
				
				<!-- 비밀글일때 아이콘 붙는것 -->
				
						<a href="data_viewebc8.html?board_seq=31997&amp;parameter=&amp;board_code=1&amp;types=&amp;search_val=&amp;page=1">
					[NOTICE] 세븐틴 4th Mini Album &#39;Al1&#39; 팬사인회 공지
					</a>
				</td>

				<td>2017.06.21</td>
				<td class="board_data">STAFF</td>
			</tr>
			
		</tbody>
	</table>
	<div class="board_btn2">
		
	</div> 
	<!--Page Number-->
	<div class="number a_center" >
		<img src='../board_img/arrow_l_end.gif' border='0' alt=''> <img src='../board_img/arrow_l.gif' border='0' alt=''> <b class="bbs_page"> &nbsp;1&nbsp; </b><a href='notice_newe4dd.html?page=2&amp;board_code=1&amp;types=&amp;search_val=' class="bbs"> &nbsp;2&nbsp; </a><a href='notice_new57b5.html?page=3&amp;board_code=1&amp;types=&amp;search_val=' class="bbs"> &nbsp;3&nbsp; </a><a href='notice_new7192.html?page=4&amp;board_code=1&amp;types=&amp;search_val=' class="bbs"> &nbsp;4&nbsp; </a><a href='notice_new1cff.html?page=5&amp;board_code=1&amp;types=&amp;search_val=' class="bbs"> &nbsp;5&nbsp; </a><a href='notice_newcaae.html?page=6&amp;board_code=1&amp;types=&amp;search_val=' class="bbs"> &nbsp;6&nbsp; </a><a href='notice_newc6c5.html?page=7&amp;board_code=1&amp;types=&amp;search_val=' class="bbs"> &nbsp;7&nbsp; </a><a href='notice_new4f10.html?page=8&amp;board_code=1&amp;types=&amp;search_val=' class="bbs"> &nbsp;8&nbsp; </a><a href='notice_new3f19.html?page=9&amp;board_code=1&amp;types=&amp;search_val=' class="bbs"> &nbsp;9&nbsp; </a><a href='notice_new8fbd.html?page=10&amp;board_code=1&amp;types=&amp;search_val=' class="bbs"> &nbsp;10&nbsp; </a><a href='notice_new9e80.html?page=11&amp;board_code=1&amp;types=&amp;search_val='> <img src='../board_img/arrow_r.gif' border='0' alt=''></a><a href='notice_new159c.html?page=19&amp;board_code=1&amp;types=&amp;search_val='> <img src='../board_img/arrow_r_end.gif' border='0' alt=''></a>
	</div>
 </div><!--END Board-->

</div>

	</div>
</div><!--END Container-->


<!--Quick-->
	<!--div id="quick">
		<ul>
			<li><a href="/"><img src="../image/common/quick_home.png" alt="HOME"></a></li>	
				
					<li><a href="../asp/login_new.asp"><img src="../image/common/quick_login.png" alt="LOGIN"></a></li>
					<li><a href="../asp/join_new.asp"><img src="../image/common/quick_join.png" alt="JOIN"></a></li>
				
		</ul>
	</div--><!--END Quick-->
	<!--Footer-->
	<div id="footer">
		<p class="pt20 pb20">Seventeen Copyrightⓒ2013 PLEDIS Co.,Ltd. All Rights Reserved.</p>
	</div><!--END Footer-->
	
 </div><!--END Wrap-->
  
 </body>

<!-- Mirrored from seventeen-17.com/asp/notice_new.asp by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 06 Dec 2017 07:20:13 GMT -->
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