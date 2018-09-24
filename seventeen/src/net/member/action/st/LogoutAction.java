package net.member.action.st;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.action.Action;
import net.board.action.ActionForward;
/*login_new.jsp 로그인 페이지입니다.
join_new.jsp 국내/국외 선택하는 페이지 입니다.
join00_2.jsp 회원가입창 페이지 입니다. 
email_chk.java 이메일 체크 하는 부분
id_chk.java  아이디 체크 하는 부분
JoinAction.java 가입 DB저장 부분입니다.
LoginAction.java DB체크해서 로그인하는 부분입니다. 세션생성 
LogoutAction.java 세션 없앱니다. 
각 jsp에는 로그인 로그아웃 if문을 만들어주세요.*/
public class LogoutAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		 ActionForward forward = new ActionForward(); 
		  
	   System.out.println("로그아웃액션에 들어옴");
       
         
        //로그인 성공. 
        response.setContentType("text/html;charset=UTF-8"); 
       
        request.getSession().invalidate();
        System.out.println("세션죽이고 Login_new.me로 다시보내기");
        forward.setRedirect(true); 
        forward.setPath("./login_new.me"); 
     
        return forward; 

	}
}
