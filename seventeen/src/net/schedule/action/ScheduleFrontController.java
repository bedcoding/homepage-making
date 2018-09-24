package net.schedule.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.action.Action;
import net.board.action.ActionForward;


/**
 * Servlet implementation class ScheduleFrontController
 */

public class ScheduleFrontController extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		ActionForward forward = null;
		Action action = null;

		System.out.println("디버깅>>"+command);
		 if (command.equals("/AddSc.sc")) {
	         System.out.println("아아아아아아아아@@@@@@@@@@@@@@@@@@");
	         action = new AddScAction();
	         try {
	            forward = action.execute(request, response);
	         } catch (Exception e) {
	            e.printStackTrace();
	         }
	      }
	      
	      else if (command.equals("/ShowSc.sc")) {
	         System.out.println("SHOWSC");
	         action = new ShowScAction();
	         try {
	            forward = action.execute(request, response);
	         } catch (Exception e) {
	            e.printStackTrace();
	         }
	      }

	      else if (command.equals("/ShowScM.sc")) {
	         System.out.println("SHOWSCM");
	         action = new ShowScMAction();
	         try {
	            forward = action.execute(request, response);
	         } catch (Exception e) {
	            e.printStackTrace();
	         }
	      }
	      else if(command.equals("/ScDeleteAction.sc")) {
	         System.out.println("DELETESC");
	         action = new ScDeleteAction();
	         try {
	            forward = action.execute(request, response);
	         } catch (Exception e) {
	            e.printStackTrace();
	         }
	      }
	      
	      else if(command.equals("/ScModifyAction.sc")) {
	         System.out.println("MODIFYSC");
	         action = new ModifyScAction();
	         try {
	            forward = action.execute(request, response);
	         } catch (Exception e) {
	            e.printStackTrace();
	         }
	      }
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
