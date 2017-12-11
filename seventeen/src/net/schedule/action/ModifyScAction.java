package net.schedule.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.action.Action;
import net.board.action.ActionForward;
import net.schedule.db.ScheduleBean;
import net.schedule.db.ScheduleDAO;

public class ModifyScAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
		       throws Exception{
		       request.setCharacterEncoding("UTF-8");
		       ActionForward forward = new ActionForward();
		       boolean result = false;
		       
		       int sc_num=Integer.parseInt(request.getParameter("sc_num"));
		       
		       ScheduleDAO boarddao=new ScheduleDAO();
		      ScheduleBean scdata=new ScheduleBean();
		       
		       
		       try{
		          scdata.setSc_num(sc_num);
		          scdata.setSc_content(request.getParameter("sc_content"));
		          
		          result = boarddao.modifySc(scdata);
		          if(result==false){
		               System.out.println("sc수정 액션 실패");
		               return null;
		             }
		             System.out.println("sc수정 액션 성공");
		             
		             forward.setRedirect(true);
		             forward.setPath("./ShowScM.sc");
		             return forward;
		          }catch(Exception ex){
		               ex.printStackTrace();    
		       }
		       
		       return null;
		    }


}
