package net.schedule.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.action.Action;
import net.board.action.ActionForward;
import net.schedule.db.ScheduleBean;
import net.schedule.db.ScheduleDAO;

public class AddScAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
	       request.setCharacterEncoding("UTF-8");
	      ScheduleDAO boarddao=new ScheduleDAO();
	         ScheduleBean scdata=new ScheduleBean();
	         ActionForward forward=new ActionForward();

	         
	         boolean result=false;
	         
	         try{
	            
	            scdata.setSc_content((String)request.getParameter("c"));
	            scdata.setSc_year(Integer.parseInt(request.getParameter("y")));
	            scdata.setSc_month(Integer.parseInt(request.getParameter("m")));
	            scdata.setSc_day(Integer.parseInt(request.getParameter("d")));
	            
	            result=boarddao.addSc(scdata);
	            
	            if (result == false) {
	                System.out.println("sc추가 실패");
	                response.setContentType("text/html;charset=UTF-8");
	                PrintWriter out = response.getWriter();
	                out.println("<script>");
	                out.println("alert('일정 추가 실패: 이미 등록 되어있는 날짜에 추가했는지 확인하세요.');");
	                out.println("location.href='./ShowScM.sc';");
	                out.println("</script>");
	                out.close();
	                // return null;
	             }
	            System.out.println("sc추가 성공");
	            
	            forward.setRedirect(true);
	            forward.setPath("./ShowScM.sc");
	            return forward;
	            
	        }catch(Exception ex){
	            ex.printStackTrace();
	         }
	        return null;
	    }


}
