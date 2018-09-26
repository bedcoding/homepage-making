package net.member.action.st;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.action.Action;
import net.board.action.ActionForward;
import net.board.db.BoardBean;
import net.board.db.BoardDAO;
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
public class id_chk implements Action {
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	         throws Exception{  
	             System.out.println("들어옴CHECK");
	          
	            MemberDAO memberdao =new MemberDAO(); 
	              
	   
	             
	            String id = request.getParameter("id");
	            System.out.println("없음?"+id);
	            boolean isCheck = memberdao.checkUsername(id);

	        	if(isCheck){
	        		response.setContentType("text/html;charset=UTF-8");
	    			PrintWriter out = response.getWriter();
	        		System.out.println("중복");
	        		out.print("N");
	        		out.close();
	        	}else{
	        		System.out.println("중복 없음으로 체크");
	        		response.setContentType("text/html;charset=UTF-8");
	    			PrintWriter out = response.getWriter();
	        		System.out.println("중복X");
	        		out.print("Y");
	        		out.close();
	        	}
	              
	             return null;
	    } 
}
