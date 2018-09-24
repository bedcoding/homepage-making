package net.member.action.st;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.board.action.Action;
import net.board.action.ActionForward;
import net.member.db.st.MemberBean;
import net.member.db.st.MemberDAO;
/*login_new.jsp 로그인 페이지입니다.
join_new.jsp 국내/국외 선택하는 페이지 입니다.
join00_2.jsp 회원가입창 페이지 입니다. 
email_chk.java 이메일 체크 하는 부분
id_chk.java  아이디 체크 하는 부분
JoinAction.java 가입 DB저장 부분입니다.
LoginAction.java DB체크해서 로그인하는 부분입니다. 세션생성 
LogoutAction.java 세션 없앱니다. 
각 jsp에는 로그인 로그아웃 if문을 만들어주세요.*/
public class LoginAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("로그인액션 자바에 들어옴.");
        ActionForward forward = new ActionForward(); 
        PrintWriter out=response.getWriter(); 
    	response.setContentType("text/html;charset=UTF-8"); 
        HttpSession session=request.getSession(); 
       MemberDAO memberdao=new MemberDAO(); 
        MemberBean member=new MemberBean(); 
       
        int result=-1; 
         
        member.setId(request.getParameter("id")); 
        member.setPassword(request.getParameter("pwd")); 
        result=memberdao.isMember(member); 
        String id =null;
		id=(String)session.getAttribute("loggedID");
		System.out.println("로그인 액션: 세션에 저장된 아이디" + id);	
		System.out.println(result);
		
        if(result==0){ 
        	
        	
           System.out.println("비밀번호 확인요청");
           
            out.println("<script>"); 
            out.println("alert('Please check your PASSWORD.');"); 
            out.println("location.href='./login_new.me';"); 
            out.println("</script>"); 
            out.close(); 
            return null; 
        }else if(result==-1){ 
        	
        	 System.out.println("아이디 확인요청");
        	 out.println("<script>"); 
        	 out.println("alert('Please check your ID.');"); 
        	 out.println("location.href='./login_new.me';"); 
        	 out.println("</script>"); 
        	 out.close(); 
            return null; 
        } 
         
        //로그인 성공. 
        
        System.out.println("체크체크체크"+member.getId());
        session.setAttribute("loggedID", member.getId());
        forward.setRedirect(true); 
        forward.setPath("./BoardList.bo"); 
        String loggedIDa = (String)session.getAttribute("loggedID");
        System.out.println("세션체크"+loggedIDa);
        return forward; 

	}

}
