var msg_data = null;
var validation = function(){	
	var obj;

	function returnObject(obj_name){
		if (typeof obj_name == "object")
		{
			return obj_name;
		}
		else
		{
			return document.getElementById(obj_name);
		}
	}

	//입력값 체크
	this.nullcheck = function(id, massage){		
	
		if (document.getElementById(id).value == "")
		{
			alert(massage + "을(를) 입력해 주세요");
			document.getElementById(id).focus();
			return;
		}
		return true;
	}


	//숫자값만 입력해야하는 경우, 음수포함
	this.numbercheck = function(obj_name, msg, id){
		obj = returnObject(obj_name);	
		if (obj.value.match(/^-?[0-9]+$/gi) == null)
		{
			alert(msg+"는 숫자만 입력해 주세요");
			document.getElementById(id).focus();
			return;
		}

		return true;
	}	




	//셀렉트 체크
	this.checkSelect = function(obj_name, msg){
		obj = returnObject(obj_name);		
		if (!checkNullSelect(obj.value, msg)){			
			focusObj(obj);
			return;
		}	

		return true;
	}

	//입력값 null or 공백체크(입력값없음)
	function checkNull(val, msg){				
		if (val.indexOf(" ") == 0)
		{		
			alert(formatingMsg(msg_data.msg_do_not_start_space, postpositionalWord(msg, "은", "는")));
			return false;
		}

		var tmp_val = val.replace( /^\s+|\s+$/g, "" )
		if (tmp_val == ""){
			alert(formatingMsg(msg_data.msg_basic, postpositionalWord(msg, "을", "를")));		
			return false;
		}
		return true;
	}

	//입력값 null or 공백체크(입력값없음) 셀렉트 박스
	function checkNullSelect(val, msg){
		
		
		var tmp_val = val.replace( /^\s+|\s+$/g, "" )
		if (tmp_val == ""){
			alert(formatingMsg(msg_data.msg_select, postpositionalWord(msg, "을", "를")));		
			return false;
		}
		return true;
	}

	//입력값에 공백이 들어갔는지 체크
	function checkSpace(val, msg){				
		for (var i = 0 ; i < val.length ;i++ ){
			if (val.charAt(i) == ' '){
				alert(formatingMsg(msg_data.msg_do_not_space, postpositionalWord(msg, "은", "는")));	
				return false;
			}
		}		
		return true;
	}	

	//입력값 길이체크
	function checkLen(obj_name, nlen, mlen, msg, en){
		obj = returnObject(obj_name);
		var max_msg = (en == "Y") ? msg_data.msg_en_check_input_max_length : msg_data.msg_check_input_max_length;
		var min_msg = (en == "Y") ? msg_data.msg_en_check_input_min_length : msg_data.msg_check_input_min_length;
		var this_length = 0; //입력값의 현재 길이값

		for (var i = 0;i < obj.value.length; i++){
			var tmp = obj.value.charAt(i);
			if (escape(tmp).length > 4){
				this_length = this_length + 2;
			}else{
				this_length++;
			}

		}
		
		if (this_length < nlen){
			alert(formatingMsg(min_msg, postpositionalWord(msg, "은", "는"), nlen, parseInt(nlen/2)));
			focusObj(obj);
			return false;
		}

		if (this_length > mlen){
			alert(formatingMsg(max_msg, postpositionalWord(msg, "은", "는"), mlen, parseInt(mlen/2)));
			focusObj(obj);
			return false;
		}
		return true;
	}

	//입력값과 길이 동시 체크
	this.checkValNLen = function(obj_name, nlen, mlen, msg, space, en){					

		if (!this.checkVal(obj_name, msg, space))
		{
			return;
		}

		if (!checkLen(obj_name, nlen, mlen, msg, en)){			
			return;
		}

		return true;
	}	 
	



	//숫자값과 - 만 입력해야하는 경우 [전화번호, 사업자 번호등]
	this.checkNumber2 = function(obj_name, msg){
		obj = returnObject(obj_name);	
		if (obj.value.match(/^[0-9-]+$/gi) == null)
		{
			alert(formatingMsg(msg_data.msg_check_number_2, postpositionalWord(msg, "은", "는")));
			obj.value = "";
			focusObj(obj);
			return;
		}

		return true;
	}	

	//이메일체크
	var mailExp = /^([0-9a-zA-Z\_\-\.]+)@([0-9a-zA-Z\_\-]+)(\.[0-9a-zA-Z\_\-]+){1,2}$/; 

	//이메일 입력폼이 1개일때
	this.checkEmail = function(obj_name, msg){

		if (!this.checkVal(obj_name, msg, "Y"))
		{
			return;
		}

		obj = returnObject(obj_name);	
		if (!mailExp.test(obj.value)){
			alert(formatingMsg(msg_data.msg_check_mail_exp, postpositionalWord(msg, "을", "를")));
			obj.value= "";
			focusObj(obj);
			return false;
		}
		
		return true;
	}


	//이메일값을 받을때
	this.checkEmail2 = function(obj_name, val, msg){

		//obj_name는 이메일 값이 아닐때 포커스가 갈 input

		obj = returnObject(obj_name);	
		if (!mailExp.test(val)){
			alert(formatingMsg(msg_data.msg_check_mail_exp, postpositionalWord(msg, "을", "를")));
			focusObj(obj);
			return false;
		}	
		
		return true;
	}

	//메세지 생성
	function formatingMsg(msg_form)	{
		var tmp_word = ''
		if (arguments.length > 1)
		{
			for (var msg_i = 0; msg_i < arguments.length; msg_i++)
			{
				msg_form = msg_form.replace(new RegExp("\\{" + msg_i + "\\}", "gi"), arguments[msg_i + 1]);
			}			
		}
		
		return msg_form;
	}
	
	function postpositionalWord(msg, postpositional_word_1, postpositional_word_2){
		if (language != "" && language != "kor")
		{
			return msg;
		}

		var check_word = '가갸거겨고교구규그기개걔게계과괘궈궤괴귀긔까꺄꺼껴꼬꾜꾸뀨끄끼깨꺠께꼐꽈꽤꿔꿰꾀뀌끠나냐너녀노뇨누뉴느니내냬네녜놔놰눠눼뇌뉘다댜더뎌도됴두듀드디대댸데뎨돠돼둬뒈되뒤듸따땨떠뗘또뚀뚜뜌뜨띠때떄떼뗴똬뙈뚸뛔뙤뛰띄라랴러려로료루류르리래럐레례롸뢔뤄뤠뢰뤼마먀머며모묘무뮤므미매먜메몌뫄뫠뭐뭬뫼뮈믜바뱌버벼보뵤부뷰브비배뱨베볘봐봬붜붸뵈뷔븨빠뺘뻐뼈뽀뾰뿌쀼쁘삐빼뺴뻬뼤뽜뽸뿨쀄뾔쀠사샤서셔소쇼수슈스시새섀세셰솨쇄숴쉐쇠쉬싀싸쌰써쎠쏘쑈쑤쓔쓰씨쌔썌쎄쎼쏴쐐쒀쒜쐬쒸씌아야어여오요우유으이애얘에예와왜워웨외위자쟈저져조죠주쥬즈지재쟤제졔좌좨줘줴죄쥐즤짜쨔쩌쪄쪼쬬쭈쮸쯔찌째쨰쩨쪠쫘쫴쭤쮀쬐쮜쯰차챠처쳐초쵸추츄츠치채챼체쳬촤쵀춰췌최취카캬커켜코쿄쿠큐크키캐컈케켸콰쾌쿼퀘쾨퀴킈타탸터텨토툐투튜트티태턔테톄톼퇘퉈퉤퇴튀틔파퍄퍼펴포표푸퓨프피패퍠페폐퐈퐤풔풰푀퓌하햐허혀호효후휴흐히해햬헤혜화홰훠훼회휘희';
		var check_word_flag = true;	
		
		for (var word_i = 0;word_i < check_word.length ; word_i++)
		{			
			if (check_word.charAt(word_i) == msg.charAt(msg.length-1))
			{			
				check_word_flag = false;
				break;
			}			
		}		 

		if (check_word_flag)
		{
			return msg + postpositional_word_1;
		}
		else
		{
			return msg + postpositional_word_2;
		}
	}


	this.postpositionalWord = function(msg, postpositional_word_1, postpositional_word_2){
		
		return postpositionalWord(msg, postpositional_word_1, postpositional_word_2);
	}

	//필수 or 선택 입력 체크시
	this.checkEss = function(obj_name, state){		
		obj = returnObject(obj_name)
		if (obj)
		{			
			if ((obj.value != "" && "Y" != state) || "Y" == state)
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		
		return false;
	}
	

	//포커스 에디터등 display:none 인경우 에러가 나는걸 방지위해 
	function focusObj(obj){		
		try{			
			obj.focus();
		}
		catch(e){
			//
		}
	}

}