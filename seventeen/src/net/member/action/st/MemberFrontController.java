package net.member.action.st;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.action.Action;
import net.board.action.ActionForward;
import oracle.net.ns.SessionAtts;
/*login_new.jsp 로그인 페이지입니다.
join_new.jsp 국내/국외 선택하는 페이지 입니다.
join00_2.jsp 회원가입창 페이지 입니다. 
email_chk.java 이메일 체크 하는 부분
id_chk.java  아이디 체크 하는 부분
JoinAction.java 가입 DB저장 부분입니다.
LoginAction.java DB체크해서 로그인하는 부분입니다. 세션생성 
LogoutAction.java 세션 없앱니다. 
각 jsp에는 로그인 로그아웃 if문을 만들어주세요.*/

public class MemberFrontController extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		ActionForward forward = null;
		Action action = null;
	
		System.out.println("현재 들어온 위치:" + command);

		if (command.equals("/login_new.me")) {
			System.out.println("로그인 미로 들어옴");
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./member/login_new.jsp");
		}else if(command.equals("/loginaction.me")) {
			System.out.println("로그인액션");
			action = new LoginAction();
            try{ 
                forward=action.execute(request, response); 
            }catch(Exception e){ 
                e.printStackTrace(); 
            } 
        }
		else if (command.equals("/join_new.me")) {
			System.out.println("회원가입창 외국인 묻는 창");
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./member/join_new.jsp");
		}
		else if (command.equals("/join00_2.me")) {
			System.out.println("회원가입창");
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./member/join00_2.jsp");
		}else if(command.equals("/id_chk.me")) {
			action = new id_chk();
            try{ 
                forward=action.execute(request, response); 
            }catch(Exception e){ 
                e.printStackTrace(); 
            } 
        }else if(command.equals("/email_chk.me")) {
			System.out.println("이메일체크.미 들어옴");
        	action = new email_chk();
            try{ 
                forward=action.execute(request, response); 
            }catch(Exception e){ 
                e.printStackTrace(); 
            } 
        }else if(command.equals("/joinaction.me")) {
			System.out.println("멤버조인액션 미");
        	action = new JoinAction();
            try{ 
                forward=action.execute(request, response); 
            }catch(Exception e){ 
                e.printStackTrace(); 
            } 
        }else if(command.equals("/logoutaction.me")) {
			System.out.println("멤버컨트롤 로그아웃.me에 들어옴");
        	action = new LogoutAction();
            try{ 
                forward=action.execute(request, response); 
            }catch(Exception e){ 
                e.printStackTrace(); 
            } 
        }
		/*else if(command.equals("/email_code.me")) {
			System.out.println("이메일체크.미 들어옴");
        	action = new email_code();
            try{ 
                forward=action.execute(request, response); 
            }catch(Exception e){ 
                e.printStackTrace(); 
            } 
        }*/

		if (forward.isRedirect()) {
			response.sendRedirect(forward.getPath());
		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
			dispatcher.forward(request, response);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}
}
