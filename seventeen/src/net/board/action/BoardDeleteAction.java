package net.board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.set.SynchronizedSet;

import net.board.db.*;

public class BoardDeleteAction implements Action {
    public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
       throws Exception{
       
      ActionForward forward = new ActionForward();
      request.setCharacterEncoding("UTF-8");
      
         boolean result=false;
         boolean usercheck=false;
         int num=Integer.parseInt(request.getParameter("num"));
         response.setContentType("text/html;charset=UTF-8");
         PrintWriter out=response.getWriter();
         BoardDAO boarddao=new BoardDAO();
         usercheck=boarddao.isBoardWriter(num, request.getParameter("BOARD_PASS"));
         
         if(usercheck==false){
            
            out.println("<script>");
            out.println("alert('비밀번호 틀림');");
            out.println("location.href='./BoardList.bo';");
            out.println("window.close();");
            out.println("</script>");
            out.close();
            return null;
         }
         
         result=boarddao.boardDelete(num);
         System.out.println("삭체취소 작동 0");
         if(result==false){
            System.out.println("삭제취소 작동 1");
            out.println("<script>");
            out.println("alert('삭제취소');");
            out.println(" opener.location.reload()';");
            out.println("window.close();");
            out.println("</script>");
            out.close();
            System.out.println("삭체취소 작동 2");
            return null;
         }
         
         System.out.println("삭제 성공");
         out.println("<script>");
         out.println("window.close();");
         out.println("opener.location.href='./BoardList.bo';");
         out.println("</script>");    
         out.close();

         forward.setRedirect(true);
         forward.setPath("./BoardList.bo");
         return forward;
    }
}