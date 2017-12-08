			$(function(){
				$("#comment_img").css("cursor","pointer").bind("click",function(){
					go_comment();
				})			
			})

			function go_comment(){

				var check = new validation();

				if (!check.nullcheck("users", "Name")) return;
				if (!check.nullcheck("pwd", "Password")) return;
				if (!check.nullcheck("comment", "comment")) return;

				$("#mode").val("write");

				$("#write_Frm").attr("target","action_ifrm");
				$("#write_Frm").attr("action","board/module/comment_write.html");
				$("#write_Frm").submit();	
			}

			function go_comment_edit(idx){
				$("#pwd_chk"+idx).show();
				$("#mode").val("edit");
				$("#COMMENT_IDX").val(idx);
			}

			function go_comment_del(idx){
				$("#pwd_chk"+idx).show();
				$("#mode").val("del");
				$("#COMMENT_IDX").val(idx);
			}


			function pwd_check_comment(idx, mode){
				
				if ($("#chk_pwd"+idx).val() == ""){
					alert("비밀번호를 입력해 주세요");
					$("#chk_pwd"+idx).focus();
					return;
				}

				$.ajax({
					type:"post",
					url: "/asp/board/module/_comment_pwd_chk.asp",
					data: {chk_pwd: $("#chk_pwd"+idx).val(), mode : $("#mode").val(), comment_idx:idx, flag:$("#pwdck_flag").val()},
					async: true,
					error: function(xhr){
								alert('에러발생!!');
							},
					success: function(data){
										data = data.split("&&&")
										if (data[0] == "_ok"){
											if ($("#mode").val() == "del"){
												go_comment_edit_info(idx)
											}
											else{
												$('#pwd_chk'+idx).hide();
												$('#chk_pwd'+idx).val('');
												$("#editcommenttb"+idx).show();
												$("#users"+idx).val(data[1]);
												$("#pwd"+idx).val(data[2]);
												$("#comment"+idx).val(data[3]);											
											}
										}
										else{
											alert("비밀번호가 일치하지 않습니다");
											$("#editcommenttb"+idx).hide();
											return;
										}
								   }
					});	
			}

			function go_comment_edit_info(idx){

				if ($("#mode").val() == "edit"){
					var check = new validation();
					if (!check.nullcheck("users"+idx, "Name")) return;
					if (!check.nullcheck("pwd"+idx, "password")) return;
					if (!check.nullcheck("comment"+idx, "comment")) return;
				}

				$("#mode").val($("#mode").val());
				$("#COMMENT_IDX").val(idx);
				$("#write_Frm").attr("target","action_ifrm");
				$("#write_Frm").attr("action","board/module/comment_write.html");
				$("#write_Frm").submit();
			}