<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="net.schedule.db.*"%>
<%
   request.setCharacterEncoding("UTF-8");
   List sclist = (List) request.getAttribute("sclist");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>스케줄관리</title>

</head>
<body>
   <center>
      <table width="500" align="center" bgcolor="#eaf3f8" border=1 frame=box
         rules=rows>
         <tr align=center>
            <td bgcolor="#779ecb" colspan=2>스케줄 목록</td>
         </tr>
         <%
            for (int i = 0; i < sclist.size(); i++) {
               ScheduleBean sc = (ScheduleBean) sclist.get(i);
         %>
         <tr align=center>
            <td>
               <form action="ScModifyAction.sc" method="post" name="modifyform">
                  	날짜:<%=sc.getSc_year()%>.<%=sc.getSc_month()%>.<%=sc.getSc_day()%> <br>
                  <textarea name="sc_content" cols="10" rows="5"><%=sc.getSc_content()%> </textarea>
            
            	  <input type="hidden" value=<%=sc.getSc_num()%> name="sc_num"> <br>
                  <input type="submit" value="수정" />
                  <input type="submit" value="삭제" /> <br> <br>
                  
               </form>
          
			</td>
			<td>
               <form action="ScDeleteAction.sc" method="post">
                  <input type="hidden" value=<%=sc.getSc_num()%> name="sc_num">
               </form>
            </td>
         </tr>
         <%
            }
         %>

         
      </table>
      <hr>
      <H5>일정 추가</H5>
      <HR>
      <form name=memoAdd method=post action="AddSc.sc">
         <input id="year" type="text" size="1" name="y">년 <select
            id="month" name="m">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option>
            <option value="7">7</option>
            <option value="8">8</option>
            <option value="9">9</option>
            <option value="10">10</option>
            <option value="11">11</option>
            <option value="12">12</option>
         </select>월 <select id="day" name="d">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option>
            <option value="7">7</option>
            <option value="8">8</option>
            <option value="9">9</option>
            <option value="10">10</option>
            <option value="11">11</option>
            <option value="12">12</option>
            <option value="13">13</option>
            <option value="14">14</option>
            <option value="15">15</option>
            <option value="16">16</option>
            <option value="17">17</option>
            <option value="18">18</option>
            <option value="19">19</option>
            <option value="20">20</option>
            <option value="21">21</option>
            <option value="22">22</option>
            <option value="23">23</option>
            <option value="24">24</option>
            <option value="25">25</option>
            <option value="26">26</option>
            <option value="27">27</option>
            <option value="28">28</option>
            <option value="29">29</option>
            <option value="30">30</option>
            <option value="31">31</option>
         </select>일 - 일정 : <input type=text name="c"> <input type=submit
            value="추가">
      </form>
      <hr>
      <br> <a href="ShowSc.sc" style="text-decoration: none">스케줄
         페이지로</a>
   </center>
</body>
</html>