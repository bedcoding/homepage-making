<%@ page contentType="text/html; charset=UTF-8"%>

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

<script>
   //div보여주는 함수 X 13+숨기는 함수 
   function view1() {
      document.getElementById("pic").src="popup/scoups.PNG";
      document.getElementById("one").style.display = 'inline';
   }
   function view2() {
      document.getElementById("pic").src="popup/woozi.PNG";
      document.getElementById("one").style.display = 'inline';
   }
   function view3() {
      document.getElementById("pic").src="popup/hoshi.PNG";
      document.getElementById("one").style.display = 'inline';
   }
   function view4() {
      document.getElementById("pic").src="popup/mingyu.PNG";
      document.getElementById("one").style.display = 'inline';
   }
   function view5() {
      document.getElementById("pic").src="popup/wonwoo.PNG";
      document.getElementById("one").style.display = 'inline';
   }
   function view6() {
      document.getElementById("pic").src="popup/vernon.PNG";
      document.getElementById("one").style.display = 'inline';
   }
   function view7() {
      document.getElementById("pic").src="popup/seungkwan.PNG";
      document.getElementById("one").style.display = 'inline';
   }
   function view8() {
      document.getElementById("pic").src="popup/dino.PNG";
      document.getElementById("one").style.display = 'inline';
   }
   function view9() {
      document.getElementById("pic").src="popup/jun.PNG";
      document.getElementById("one").style.display = 'inline';
   }
   function view10() {
      document.getElementById("pic").src="popup/dk.PNG";
      document.getElementById("one").style.display = 'inline';
   }
   function view11() {
      document.getElementById("pic").src="popup/joshua.PNG";
      document.getElementById("one").style.display = 'inline';
   }
   function view12() {
      document.getElementById("pic").src="popup/jeonghan.PNG";
      document.getElementById("one").style.display = 'inline';
   }
   function view13() {
      document.getElementById("pic").src="popup/the8.PNG";
      document.getElementById("one").style.display = 'inline';
   }
   function close() {
      document.getElementById("one").style.display = 'none';
   }
</script>
<style>

.popup {
   position: fix;
   z-index: 15;
   top: 80%;
   left: 50%;
   width: 30%;
   margin: -100px 0 0 -150px;
}
</style>
</head>

<body>
   <!--Wrap-->
   <div id="wrap">

      <!--div class="black_bg">
      <div class="black_bg_in">
         <p><img src="../image/main/poster_nt.jpg" width="980" height="728" border="0" alt=""></p>
      </div>
   </div-->

      <div class="pop_w">
         <p class="m_top">
            <img src="image/main/main_blue.jpg" border="0" alt="">
         </p>
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
            </ul>
         </div>
         <!--END Header-->
   

         <!-- 마우스 올릴 때 글 보이게 하는 스크립트 -->
         <script type="text/javascript">
            $(document).ready(function() {
               
               $(".pro_text").hide();

               $(".img").hover(function() {
                  $("#pro_text").show();
               }, function() {
                  $("#pro_text").hide()
               });

               $(".img1").hover(function() {
                  $("#pro_text1").show();
               }, function() {
                  $("#pro_text1").hide()
               });

               $(".img2").hover(function() {
                  $("#pro_text2").show();
               }, function() {
                  $("#pro_text2").hide()
               });

               $(".img3").hover(function() {
                  $("#pro_text3").show();
               }, function() {
                  $("#pro_text3").hide()
               });

               $(".img4").hover(function() {
                  $("#pro_text4").show();
               }, function() {
                  $("#pro_text4").hide()
               });

               $(".img5").hover(function() {
                  $("#pro_text5").show();
               }, function() {
                  $("#pro_text5").hide()
               });

               $(".img6").hover(function() {
                  $("#pro_text6").show();
               }, function() {
                  $("#pro_text6").hide()
               });

               $(".img7").hover(function() {
                  $("#pro_text7").show();
               }, function() {
                  $("#pro_text7").hide()
               });

               $(".img8").hover(function() {
                  $("#pro_text8").show();
               }, function() {
                  $("#pro_text8").hide()
               });

               $(".img9").hover(function() {
                  $("#pro_text9").show();
               }, function() {
                  $("#pro_text9").hide()
               });

               $(".img10").hover(function() {
                  $("#pro_text10").show();
               }, function() {
                  $("#pro_text10").hide()
               });

               $(".img11").hover(function() {
                  $("#pro_text11").show();
               }, function() {
                  $("#pro_text11").hide()
               });

               $(".img12").hover(function() {
                  $("#pro_text12").show();
               }, function() {
                  $("#pro_text12").hide()
               });

            });
         </script>
         <!--Container-->
         <div id="layer1" class="profile_popup" style="display: block">
         </div>

         <!-- 레이어POPUP 끝-->
         <!-- 이미지 클릭시 뜨는 div -->
         <div class="popup" id="one"
            style="position: absolute; z-index: 100; display: none; background: none rgba(0, 0, 0, 1);  margin-right: 60px; filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#80000000', endColorstr='#80000000');"
            align='center'>
            <img src="popup/scoups.PNG" width="90%" height="90%" border="0" id="pic"
               alt=""> <br> <a href="javascript:close();"><font size='3' color='white'><b>CLOSE</b></font></a>
         </div>

         <div id="container_m">
            <p class="mt30">
               <!--img src="../image/sub/profile_text.jpg" border="0" alt=""-->
            </p>
            <div class="profile">
               <p class="profile_title">
                  <img src="image/sub/profile_title01.jpg" border="0" alt="">
               </p>

<!-- 프로필 사진 ul -->
               <ul class="profile_list_t">

                  <li class="img" style="cursor: pointer;"><a
                     href="javascript:view1();"> <img
                        src="upload/board/file/FILE20171113173144.jpg" width="100%"
                        height="100%" border="0" alt="">
                        <div id="pro_text" class="pro_text" style="display: block;">
                           <h1>에스.쿱스</h1>
                           <h2>S.COUPS</h2>
                           <p>95.08.08</p>
                           <p class="pro_btn01">
                              <img src="image/sub/profile_btn01.png" border="0" alt="">
                           </p>
                        </div>
                  </a></li>





                  <li class="img1" style="cursor: pointer;"><a
                     href="javascript:view2();"> <img
                        src="upload/board/file/FILE20171113173213.jpg" width="100%"
                        height="100%" border="0" alt="">
                        <div id="pro_text1" class="pro_text" style="display: block;">
                           <h1>우지</h1>
                           <h2>WOOZI</h2>
                           <p>96.11.22</p>
                           <p class="pro_btn01">
                              <img src="image/sub/profile_btn01.png" border="0" alt="">
                           </p>
                        </div>
                  </a></li>

                  <li class="img2" style="cursor: pointer;"><a
                     href="javascript:view3();"> <img
                        src="upload/board/file/FILE20171113173236.jpg" width="100%"
                        height="100%" border="0" alt="">
                        <div id="pro_text2" class="pro_text" style="display: block;">
                           <h1>호시</h1>
                           <h2>HOSHI</h2>
                           <p>96.06.15</p>
                           <p class="pro_btn01">
                              <img src="image/sub/profile_btn01.png" border="0" alt="">
                           </p>
                        </div>
                  </a></li>

                  <li class="img3" style="cursor: pointer;"><a
                     href="javascript:view4();"> <img
                        src="upload/board/file/FILE20171113173250.jpg" width="100%"
                        height="100%" border="0" alt="">
                        <div id="pro_text3" class="pro_text" style="display: block;">
                           <h1>민규</h1>
                           <h2>MINGYU</h2>
                           <p>97.04.06</p>
                           <p class="pro_btn01">
                              <img src="image/sub/profile_btn01.png" border="0" alt="">
                           </p>
                        </div>
                  </a></li>

                  <li class="img4" style="cursor: pointer;"><a
                     href="javascript:view5();"> <img
                        src="upload/board/file/FILE20171113173305.jpg" width="100%"
                        height="100%" border="0" alt="">
                        <div id="pro_text4" class="pro_text" style="display: block;">
                           <h1>원우</h1>
                           <h2>WONWOO</h2>
                           <p>96.07.17</p>
                           <p class="pro_btn01">
                              <img src="image/sub/profile_btn01.png" border="0" alt="">
                           </p>
                        </div>
                  </a></li>

                  <li class="img5" style="cursor: pointer;"><a
                     href="javascript:view6();"> <img
                        src="upload/board/file/FILE20171113173325.jpg" width="100%"
                        height="100%" border="0" alt="">
                        <div id="pro_text5" class="pro_text" style="display: block;">
                           <h1>버논</h1>
                           <h2>VERNON</h2>
                           <p>98.02.18</p>
                           <p class="pro_btn01">
                              <img src="image/sub/profile_btn01.png" border="0" alt="">
                           </p>
                        </div>
                  </a></li>

                  <li class="img6 mr0_1" style="cursor: pointer;"><a
                     href="javascript:view7();"> <img
                        src="upload/board/file/FILE20171113173343.jpg" width="100%"
                        height="100%" border="0" alt="">
                        <div id="pro_text6" class="pro_text" style="display: block;">
                           <h1>승관</h1>
                           <h2>SEUNGKWAN</h2>
                           <p>98.01.16</p>
                           <p class="pro_btn01">
                              <img src="image/sub/profile_btn01.png" border="0" alt="">
                           </p>
                        </div>
                  </a></li>

               </ul>
               <ul class="profile_list_b">

                  <li class="img7" style="cursor: pointer;"><a
                     href="javascript:view8();"> <img
                        src="upload/board/file/FILE20171113173403.jpg" width="100%"
                        height="100%" border="0" alt="">
                        <div id="pro_text7" class="pro_text" style="display: block;">
                           <h1>디노</h1>
                           <h2>DINO</h2>
                           <p>99.02.11</p>
                           <p class="pro_btn01">
                              <img src="image/sub/profile_btn01.png" border="0" alt="">
                           </p>
                        </div>
                  </a></li>

                  <li class="img8" style="cursor: pointer;"><a
                     href="javascript:view9();"> <img
                        src="upload/board/file/FILE20171113173453.jpg" width="100%"
                        height="100%" border="0" alt="">
                        <div id="pro_text8" class="pro_text" style="display: block;">
                           <h1>준</h1>
                           <h2>JUN</h2>
                           <p>96.06.10</p>
                           <p class="pro_btn01">
                              <img src="image/sub/profile_btn01.png" border="0" alt="">
                           </p>
                        </div>
                  </a></li>

                  <li class="img9" style="cursor: pointer;"><a
                     href="javascript:view10();"> <img
                        src="upload/board/file/FILE20171113173506.jpg" width="100%"
                        height="100%" border="0" alt="">
                        <div id="pro_text9" class="pro_text" style="display: block;">
                           <h1>도겸</h1>
                           <h2>DK</h2>
                           <p>97.02.18</p>
                           <p class="pro_btn01">
                              <img src="image/sub/profile_btn01.png" border="0" alt="">
                           </p>
                        </div>
                  </a></li>

                  <li class="img10" style="cursor: pointer;"><a
                     href="javascript:view11();"> <img
                        src="upload/board/file/FILE20171113173520.jpg" width="100%"
                        height="100%" border="0" alt="">
                        <div id="pro_text10" class="pro_text" style="display: block;">
                           <h1>조슈아</h1>
                           <h2>JOSHUA</h2>
                           <p>95.12.30</p>
                           <p class="pro_btn01">
                              <img src="image/sub/profile_btn01.png" border="0" alt="">
                           </p>
                        </div>
                  </a></li>

                  <li class="img11" style="cursor: pointer;"><a
                     href="javascript:view12();"> <img
                        src="upload/board/file/FILE20171113173536.jpg" width="100%"
                        height="100%" border="0" alt="">
                        <div id="pro_text11" class="pro_text" style="display: block;">
                           <h1>정한</h1>
                           <h2>JEONGHAN</h2>
                           <p>95.10.04</p>
                           <p class="pro_btn01">
                              <img src="image/sub/profile_btn01.png" border="0" alt="">
                           </p>
                        </div>
                  </a></li>

                  <li class="img12" style="cursor: pointer;"><a
                     href="javascript:view13();"> <img
                        src="upload/board/file/FILE20171113173556.jpg" width="100%"
                        height="100%" border="0" alt="">
                        <div id="pro_text12" class="pro_text" style="display: block;">
                           <h1>디에잇</h1>
                           <h2>THE8</h2>
                           <p>97.11.07</p>
                           <p class="pro_btn01">
                              <img src="image/sub/profile_btn01.png" border="0" alt="">
                           </p>
                        </div>
                  </a></li>

               </ul>
            </div>
         </div>
         <!--END Container-->
      </div>
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