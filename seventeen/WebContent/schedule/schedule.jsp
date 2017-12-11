<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="net.schedule.db.*"%>
<%@ page import="java.io.PrintWriter"%>
<%

	request.setCharacterEncoding("UTF-8");
    List sclist=(List)request.getAttribute("sclist");
	List boardList=(List)request.getAttribute("boardlist");
	
	String ida = null;
	ida = (String) session.getAttribute("loggedID");

if(sclist!=null) System.out.println("스케쥴 진입");
   java.util.Calendar cal = java.util.Calendar.getInstance(); //Calendar객체 cal생성
   int currentYear = cal.get(java.util.Calendar.YEAR); //현재 날짜 기억
   int currentMonth = cal.get(java.util.Calendar.MONTH);
   int currentDate = cal.get(java.util.Calendar.DATE);
   String Year = request.getParameter("year"); //나타내고자 하는 날짜
   String Month = request.getParameter("month");
   int year, month;
   if (Year == null && Month == null) { //처음 호출했을 때
      year = currentYear;
      month = currentMonth;
   } else { //나타내고자 하는 날짜를 숫자로 변환
      year = Integer.parseInt(Year);
      month = Integer.parseInt(Month);
      if (month < 0) {
         month = 11;
         year = year - 1;
      } //1월부터 12월까지 범위 지정.
      if (month > 11) {
         month = 0;
         year = year + 1;
      }
   }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>SEVENTEEN Official website</title>
<meta name="Author" content="minee">
<meta name="Publisher" content="MyelHub">
<meta name="Description" content="">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=9">
<link type="text/css" rel="stylesheet" href="css/default.css" />
<script type="text/javascript"
   src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="/js/doorer.js"></script>
</head>

<!--게시판넣기-->
<script language='javascript' type='text/javascript'>
   //<![CDATA[
   function doResize(id) {
      var obj = (typeof (id) == 'string') ? document.getElementById(id) : id;
      obj.height = obj.contentWindow.document.body.scrollHeight;
   }
   //]]>
</script>

<body>
   <!--Wrap-->
   <div id="wrap">

      <p class="m_top">
         <img src="image/main/main_blue.jpg" border="0" alt="">
      </p>
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
					ida = null;
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
      </div>
      <!--END Header-->
      <iframe name="action_ifrm" id="action_ifrm" width="0" height="0"
         frameborder="0"></iframe>

      <!--Container-->
      <div id="container_msub">

         <div class="schedule">
            <p class="schedule_title">
               <img src="image/sub/board_title04.jpg" border="0" alt="schedule" />
            </p>
            <!--클릭하면 스케쥴내용 노출-->

            <script type="text/javascript">
               function move_date() {
                  var current_date = $("#schedule_year").val() + "-"
                        + $("#schedule_month").val() + "-01";
                  location = "/asp/schedule.asp?pageflag=&current_date="
                        + current_date + "&cate=&board_code=1";
               }

               function show_sc(title1, title2, title3, title4, title5,
                     months, days) {

                  $(".sb_pop_text").show();
                  $("#h_sc").html(
                        months + "월 " + days
                              + "일 <span>Schedule</span>");
                  if (title1 != "") {
                     $("#ptitle1").show();
                     $("#spantitle1")
                           .html(
                                 title1
                                       .replace(
                                             /\,/g,
                                             "<img src='../image/sub/sd_icon01.png' width='18' height='18' border='0' alt='con'>"));
                  } else {
                     $("#ptitle1").hide();
                     $("#spantitle1").html("");
                  }
                  if (title2 != "") {
                     $("#ptitle2").show();
                     $("#spantitle2")
                           .html(
                                 title2
                                       .replace(
                                             /\,/g,
                                             "<img src='../image/sub/sd_icon02.png' width='18' height='18' border='0' alt='con'>"));
                  } else {
                     $("#ptitle2").hide();
                     $("#spantitle2").html("");
                  }
                  if (title3 != "") {
                     $("#ptitle3").show();
                     $("#spantitle3")
                           .html(
                                 title3
                                       .replace(
                                             /\,/g,
                                             "<img src='../image/sub/sd_icon03.png' width='18' height='18' border='0' alt='con'>"));
                  } else {
                     $("#ptitle3").hide();
                     $("#spantitle3").html("");
                  }
                  if (title4 != "") {
                     $("#ptitle4").show();
                     $("#spantitle4")
                           .html(
                                 title4
                                       .replace(
                                             /\,/g,
                                             "<img src='../image/sub/sd_icon04.png' width='18' height='18' border='0' alt='con'>"));
                  } else {
                     $("#ptitle4").hide();
                     $("#spantitle4").html("");
                  }
                  if (title5 != "") {
                     $("#ptitle5").show();
                     $("#spantitle5")
                           .html(
                                 title5
                                       .replace(
                                             /\,/g,
                                             "<img src='../image/sub/sd_icon05.png' width='18' height='18' border='0' alt='con'>"));
                  } else {
                     $("#ptitle5").hide();
                     $("#spantitle5").html("");
                  }
               }
            </script>

            

            <div id="Schedule" class="sd_wrap">
               <div class="sd_title">
                  <a
                     href="ShowSc.sc?year=<%out.print(year);%>&month=<%out.print(month - 1);%>"><img
                     src="image/sub/sd_left_btn.png" alt="" /></a> <span> <%
    out.print(year);
 %>. <%
    out.print(month + 1);
 %>
                  </span> <a
                     href="ShowSc.sc?year=<%out.print(year);%>&month=<%out.print(month + 1);%>"><img
                     src="image/sub/sd_right_btn.png" alt="" /></a>
               </div>

               <ul class="sd_header sd_view">
                  <li>SUN</li>
                  <li>MON</li>
                  <li>TUE</li>
                  <li>WED</li>
                  <li>THU</li>
                  <li>FRI</li>
                  <li>SAT</li>
               </ul>

               <%
                  cal.set(year, month, 1); //현재 날짜를 현재 월의 1일로 설정
                  int startDay = cal.get(java.util.Calendar.DAY_OF_WEEK); //현재날짜(1일)의 요일
                  int end = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH); //이 달의 끝나는 날
                  int br = 0; //7일마다 줄 바꾸기
                  out.println("<ul class='sd_list sd_view'>");
                  for (int i = 0; i < (startDay - 1); i++) { //빈칸출력
                     /*
                     <li>
                           
                              18
                        <div class='sd_text' onclick="show_sc('','','','','','03','18');" >
                           <p class="icon">
                              
                           </p>
                        </div>
                     
                        </li>
                           
                     */
                     out.println("<li>   <div class='sd_text'> &nbsp; </div></li>");
                     br++;
                     if ((br % 7) == 0) {
                        out.println("<br>");
                     }
                  }
                  for (int i = 1; i <= end; i++) { //날짜출력
                     out.println("<li><div class='sd_text'>"+i+"<br>");
                     for(int j=0;j<sclist.size();j++) {
                        ScheduleBean sb=(ScheduleBean)sclist.get(j);
                        
                        if(sb.getSc_year()==year&&sb.getSc_month()==month+1&&sb.getSc_day()==i){
                           System.out.println(sb.getSc_content());
                           out.println(sb.getSc_content()+"</div>");
                        }
                        
                     }
                     
                      out.println("</li>");
                     br++;
                     if ((br % 7) == 0 && i != end) {
                        out.println("<br>");
                     }
                  }
                  while ((br++) % 7 != 0) //말일 이후 빈칸출력
                     out.println("<li>&nbsp;</li>");
               %>
               </ul>

               
<br>
               
            </div>

         </div>

		<%
			System.out.println("글쓰기 버튼 세션에 저장된 아이디 확인: " + ida);
			
			if(ida!=null && ida.equals("admin")) 
			{	
		%> 		<div class="board_btn2">
				   	<input class="board_bt_style01" type=button value="스케줄 관리" onclick="location.href='ShowScM.sc'"/>
				</div>
        <%  } 
		
			else 
			{
						
			}  
		%>   
            
            
      </div>
      
      <!--END Container-->


      <!--Quick-->
      <!--div id="quick">
      <ul>
         <li><a href="/"><img src="../image/common/quick_home.png" alt="HOME"></a></li>   
            
               <li><a href="../asp/login_new.asp"><img src="../image/common/quick_login.png" alt="LOGIN"></a></li>
               <li><a href="../asp/join_new.asp"><img src="../image/common/quick_join.png" alt="JOIN"></a></li>
            
      </ul>
   </div-->
      <!--END Quick-->
      <!--Footer-->
      <div id="footer">
         <p class="pt20 pb20">Seventeen Copyrightⓒ2013 PLEDIS Co.,Ltd. All
            Rights Reserved.</p>
      </div>
      <!--END Footer-->

   </div>
   <!--END Wrap-->

</body>
</html>
<script type="text/javascript">
   function setCookie(name, value, expiredays) {
      var today = new Date();
      today.setDate(today.getDate() + expiredays);
      document.cookie = name + "=" + escape(value) + "; path=/; expires="
            + today.toGMTString() + ";";
   }

   function getCookie(name) {
      var nameOfCookie = name + "=";
      var x = 0;
      while (x <= document.cookie.length) {
         var y = (x + nameOfCookie.length);
         if (document.cookie.substring(x, y) == nameOfCookie) {
            if ((endOfCookie = document.cookie.indexOf(";", y)) == -1)
               endOfCookie = document.cookie.length;
            return unescape(document.cookie.substring(y, endOfCookie));
         }
         x = document.cookie.indexOf(" ", x) + 1;
         if (x == 0)
            break;
      }
      return "";
   }

   var popups = "".split(",");

   function popupLocationGo(url, target) {
      if (target == 1) //부모창... 요기는 현재 자신창
      {
         location.href = url;
      } else {
         window.open(url, '', '');
      }
   }

   function layerPopupDisplay(obj) {
      //   alert(obj);
      //   return;
      $("#" + obj).css("display", "none");
   }

   $(function() {
      $(popups)
            .each(
                  function(n) {

                     var this_name = popups[n].substring(0, popups[n]
                           .lastIndexOf("_"));
                     var this_type = popups[n].substring(popups[n]
                           .lastIndexOf("_") + 1, popups[n].length);
                     var this_idx = popups[n].split("_")[1];

                     if (getCookie(this_name) != "no") {
                        if (this_type == 1) // 팝업형
                        {
                           window
                                 .open('/popup/img_popup.asp?seq='
                                       + this_idx, 'tomato_popup_'
                                       + n,
                                       'width=50, height=50, left=0, top=0, toolbar=no, menubar=no, scrollbars=no');
                        } else //레이어형
                        {
                           $.get("/popup/layer_popup.asp", {
                              seq : this_idx
                           }, function(data) {
                              $(window.document.body).append(data);
                           });
                        }
                     }
                  });
   });
</script>