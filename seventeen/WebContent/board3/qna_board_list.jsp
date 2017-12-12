<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="net.board.db3.*" %>
<%@ page import="java.io.PrintWriter"%>

<%
	request.setCharacterEncoding("UTF-8");
	List boardList=(List)request.getAttribute("boardlist");
	int listcount=((Integer)request.getAttribute("listcount")).intValue();
	int nowpage=((Integer)request.getAttribute("page")).intValue();
	int maxpage=((Integer)request.getAttribute("maxpage")).intValue();
	int startpage=((Integer)request.getAttribute("startpage")).intValue();
	int endpage=((Integer)request.getAttribute("endpage")).intValue();
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
   
   
 <body>
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


<!--Container-->
		<div id="container_msub">
						
			<div class="board_01">

				<p class="board_title">
					<img src="image/sub/board_title02.jpg" border="0" alt="fanboard">
				</p>

				<link type="text/css" rel="stylesheet" href="/css/board.css" />

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
         url: "/board/general/_pwd_chk.jsp",
         data: {chk_pwd: $("#chk_pwd"+i).val(), board_seq : board_seq},
         dataType: "json",
         async: true,
         error: function(xhr){
                  alert('에러발생!!');
               },
         success: function(data){
                        if (data == "_ok"){
                           location.href="/data_view.jsp?board_seq="+board_seq+"&parameter=&board_code=1&types=&search_val=&page=1";
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
						
						
                     <form name="search_Frm" id="search_Frm" action="BoardList.bo3"
                        method="POST">
                        <input type="hidden" name="board_code" value="1"> <select
                           name="types" id="types">
                           <option value="0">전체</option>
                           <option value="1">제목</option>
                           <option value="2">내용</option>
                        </select> <input type="text" name="search_val" id="search_val" value=""
                           class="board_bottom_bar"> <input type="submit"
                           class="board_bt_style03" title="" value="검색" name=""
                           id="search_img">
                     </form>
                   
                   
                     
                   </div>
						<!--Board_list-->
						<table cellpadding="0" cellspacing="0" class="free_board"
							summary="">
							<caption>free_board</caption>
							<colgroup>
								<col width="61" />
								<col width="636" />
								<col width="110" />
								<col width="83" />
							</colgroup>
							<thead>
								<tr>
									<th class="th_bg1">NO</th>
									<th class="th_bg2">SUBJECT</th>
									<th class="th_bg3">DATE</th>
									<th class="th_bg4">ID</th>
								</tr>
							</thead>

 
						<%
							for(int i=0;i<boardList.size();i++) {
								BoardBean bl=(BoardBean)boardList.get(i);
						%>
	
							<tbody style = "text-align:center;">
								<tr>
									<td><%=bl.getBOARD_NUM()%></td>
									<td class="title_area">
										<!-- 비밀글일때 아이콘 붙는것 --> 
										
									<a
										href="./BoardDetailAction.bo3?num=<%=bl.getBOARD_NUM()%>">
											<%=bl.getBOARD_SUBJECT()%>

									</a>
									</td>

									<td><%=bl.getBOARD_DATE() %></td>
									<td class="board_data"><%=bl.getBOARD_NAME() %></td>
								</tr>
								<%} %>
							</tbody>
						</table>

						
						
						
						
						<div class="number a_center">
							<tr align=center height=20>
								<td colspan=7 style="font-family: Tahoma; font-size: 10pt;">
					
					
																	
			<%if(nowpage<=1)
			{ %>
		
			<!-- ◁ 이전 버튼1 -->			
			<img src='board_img/arrow_l_end.gif' border='0' alt=''>	
			&nbsp; 
			<%}
			
			else 
			{ %> 
			
			<!-- ◁◁ 이전 버튼1 -->
			<a 
				href="./BoardList.bo3?page=<%=1 %>">
				<img src='board_img/arrow_l_end.gif' border='0' alt=''>
			</a>
			&nbsp; 
			<%} %> 
			
			
			
			
			
			
			
			<%if(nowpage<=1)
			{ %>
		
			<!-- ◁ 이전 버튼2 -->			
			<img src='board_img/arrow_l.gif' border='0' alt=''>	
			&nbsp; 
			<%}
			
			else
			{ %> 
			
			<!-- ◁ 이전 버튼2 -->
			<a 
				href="./BoardList.bo3?page=<%=nowpage-1 %>">
				<img src='board_img/arrow_l.gif' border='0' alt=''>
			</a>
			&nbsp; 
			<%} %> 
			
			
			
			
			
			
			<!-- 숫자 버튼 -->
			<%for(int a=startpage;a<=endpage;a++)
			{
				if(a==nowpage)
				{%> <%=a%> <% } 
				
				
				else
				{ %> 
				<a href="./BoardList.bo3?page=<%=a%>"> <%=a%> </a>
				&nbsp;
				<%} %> 
			<%} %> 
				
				
				
				
				<!-- 다음 버튼1 -->
				<%if(nowpage>=maxpage)
				{ %> 
					<!-- 다음 버튼 -->
					<img src='board_img/arrow_r.gif' border='0' alt=''>

				<%}
				
				else
				{ %> 
				<a
					href="./BoardList.bo3?page=<%=nowpage+1 %>">
					<img src='board_img/arrow_r.gif' border='0' alt=''>
				</a>
			  <%} %>
			  
			  
			
				
				<!-- 다음 버튼2 -->
				<%if(nowpage>=maxpage)
				{ %> 
					<!-- 다음 버튼 -->
					<img src='board_img/arrow_r_end.gif' border='0' alt=''>

				<%}
				
				else
				{ %> 
				<a
					href="./BoardList.bo3?page=<%=maxpage %>">
					<img src='board_img/arrow_r_end.gif' border='0' alt=''>
				</a>
			  <%} %>
			  
			  
		</td>
	</tr>
</div>



				<%
					System.out.println("글쓰기 버튼 세션에 저장된 아이디 확인: " + ida);
					
					if(ida!=null) 
					{	
				%> 		<div class="board_btn2">	
							<input type="button" class="board_bt_style01" title="" value="글쓰기" name="" onClick="location='./BoardWrite.bo3'"/>
						</div> 
				<%  } 
			
					else 
					{
						
				 	}  
				%>

</div> <!--END Board-->

				</div>
			</div>
		</div>
		<!--END Container-->


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
//   alert(obj);
//   return;
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
            window.open('/popup/img_popup.jsp?seq='+this_idx, 'tomato_popup_'+n, 'width=50, height=50, left=0, top=0, toolbar=no, menubar=no, scrollbars=no');
         }
         else //레이어형
         {      
            $.get("/popup/layer_popup.jsp", {seq:this_idx}, function(data){$(window.document.body).append(data);});            
         }
      }      
   });
});
</script>

</html>