package net.schedule.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.board.action.Action;
import net.board.action.ActionForward;
import net.schedule.db.ScheduleDAO;

public class ScDeleteAction implements Action {

	@Override
	   public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
		         throws Exception{ 
		             ActionForward forward = new ActionForward(); 
		              
		             ScheduleDAO memberdao=new  ScheduleDAO(); 
		              
		            boolean result=false; 
		             
		          
		              
		             int sc_num=Integer.parseInt(request.getParameter("sc_num")); 
		             result=memberdao.deleteSc(sc_num); 
		              
		             if(result==false){ 
		                 System.out.println("sc 삭제 실패"); 
		                 return null; 
		             } 
		             System.out.println("sc 삭제 성공");
		             forward.setRedirect(true); 
		             forward.setPath("./ShowScM.sc"); 
		             return forward; 
		    } 


}
