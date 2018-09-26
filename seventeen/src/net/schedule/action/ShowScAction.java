package net.schedule.action;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.action.Action;
import net.board.action.ActionForward;
import net.schedule.db.ScheduleDAO;

public class ShowScAction implements Action {
	   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	      ScheduleDAO boarddao = new ScheduleDAO();
	      List sclist = new ArrayList();

	      
	      request.setCharacterEncoding("UTF-8");
	      response.setContentType("text/html;charset=UTF-8");

	      sclist = boarddao.getScList();
	    
	      request.setAttribute("sclist", sclist);

	      ActionForward forward = new ActionForward();
	      forward.setRedirect(false);
	      forward.setPath("./schedule/schedule.jsp");
	      return forward;
	   }
	}
