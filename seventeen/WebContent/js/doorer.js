
function getXmlHttpRequest() {
	var xmlhttp = false;
	//Mozila
	if(window.XMLHttpRequest){
		xmlhttp = new XMLHttpRequest()	
	//IE
	} else{
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP")
	}	
	return xmlhttp;
}


function getOSInfoStr()
{
    var ua = navigator.userAgent;
    if(ua.indexOf("NT 6.0") != -1) return "Windows Vista/Server 2008";
    else if(ua.indexOf("NT 5.2") != -1) return "Windows Server 2003";
    else if(ua.indexOf("NT 5.1") != -1) return "Windows XP";
    else if(ua.indexOf("NT 5.0") != -1) return "Windows 2000";
    else if(ua.indexOf("NT 6.1") != -1) return "Windows 7";
    else if(ua.indexOf("NT") != -1) return "Windows NT";
    else if(ua.indexOf("9x 4.90") != -1) return "Windows Me";
    else if(ua.indexOf("98") != -1) return "Windows 98";
    else if(ua.indexOf("95") != -1) return "Windows 95";
    else if(ua.indexOf("Win16") != -1) return "Windows 3.x";
    else if(ua.indexOf("Windows") != -1) return "Windows";
    else if(ua.indexOf("Linux") != -1) return "Linux";
    else if(ua.indexOf("Macintosh") != -1) return "Macintosh";
    else return "OTHER OS";
}


function doorerGo()
{	
	var x = window.screen.width;
	var y = window.screen.height;
	var os = getOSInfoStr();
	var url = location.pathname;
	var ei = navigator.userAgent;
	var referrer = document.referrer

	var eiver;
	if (ei.indexOf('MSIE ') > 0){
		eiver = parseInt(ei.split(";")[1].replace(' MSIE ',''));
		ei = 'Microsoft Internet Explorer'		
	}else if (ei.indexOf('Firefox') > 0){
		eiver = parseInt(ei.split("Firefox/index.html")[1])
		ei = 'Firefox'	
	}else if (ei.indexOf('Chrome') > 0){
		eiver = ei.split(" ")[ei.split(" ").length-2].replace('Chrome/index.html','');
		ei = 'Chrome'	
	}else{
		eiver = 0;
		ei = 'OTHER BROWSER'
	}

	if (url == 'index.html'){
		url = 'index-2.html';
	}

	var xmlhttp = getXmlHttpRequest();	
	xmlhttp.open("GET.html",'doorer/doorer_ok096c.html?screenX='+x+'&screenY='+y+'&Url='+url+'&ei='+ei+'&eiVer='+eiver+'&os='+os+'&referrer='+escape(referrer),true);	
	xmlhttp.send(null);	
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4) {			
			if (xmlhttp.status == 200) {
				//아무처리 안한다.	
			}
		}
	}
	
	return false;
}

doorerGo();