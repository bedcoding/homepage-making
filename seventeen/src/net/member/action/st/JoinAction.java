package net.member.action.st;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
public class JoinAction implements Action{
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	         throws Exception{
		request.setCharacterEncoding("UTF-8");
	 		System.out.println("조인액션 자바에 들어옴.");
	         ActionForward forward = new ActionForward();

			MemberDAO memberdao = new MemberDAO();
			MemberBean memberbean = new MemberBean();

			boolean result = false;
			memberbean.setName(request.getParameter("name"));
			memberbean.setId(request.getParameter("id"));
			memberbean.setPassword(request.getParameter("pwd"));
			memberbean.setNation(request.getParameter("nation"));
			memberbean.setEmail1(request.getParameter("email1"));
			memberbean.setEmail2(request.getParameter("email2"));
			memberbean.setEmail(memberbean.getEmail1()+"@"+memberbean.getEmail2());
			System.out.println(memberbean.getEmail());
			result = memberdao.joinMember(memberbean);
			
			if (result == false) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('회원가입 오류!');");
				out.println("location.href='./join00_2.me';");
				out.println("</script>");
				out.close();
				System.out.println("회원가입 실패");
				return null;
			}
			
			// 회원가입 성공.
			forward.setRedirect(true);
			forward.setPath("./login_new.me");
			return forward;
		}
	}
