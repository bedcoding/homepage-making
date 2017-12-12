package net.board.action4;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.db4.BoardDAO;
import net.board.db4.BoardBean;

 public class BoardDetailAction implements Action {
    public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
      request.setCharacterEncoding("UTF-8");
         System.out.println("들어옴 details action class");
      BoardDAO boarddao=new BoardDAO();
         BoardBean boarddata=new BoardBean();
         BoardBean boarddata2 = new BoardBean();
         BoardBean boarddata3 = new BoardBean();
         int num=Integer.parseInt(request.getParameter("num"));

         boarddata=boarddao.getDetail(num);
         boarddata2= boarddao.getPrev(num);//
         boarddata3= boarddao.getNext(num);//
         if(boarddata2!=null) {
            request.setAttribute("prev", boarddata2.getBOARD_NUM());
            request.setAttribute("prevSub", boarddata2.getBOARD_SUBJECT());
            System.out.println("BoardDetailAction boarddata2 접근:"+request.getAttribute("prevSub"));
            System.out.println("details>>>"+boarddata2.getBOARD_NUM());
            System.out.println("details>>>"+boarddata2.getBOARD_SUBJECT());
         }
         
         if(boarddata3!=null) {
            request.setAttribute("next", boarddata3.getBOARD_NUM());
            request.setAttribute("nextSub", boarddata3.getBOARD_SUBJECT());
            System.out.println("BoardDetailAction boarddata3 접근:"+request.getAttribute("nextSub"));
            System.out.println("details>>>"+boarddata3.getBOARD_NUM());
            System.out.println("details>>>"+boarddata3.getBOARD_SUBJECT());
         }

         
         if(boarddata==null){
            System.out.println("상세 보기 실패");
            return null;
         }
         System.out.println("상세 보기 성공");
         
         request.setAttribute("boarddata", boarddata);
         ActionForward forward = new ActionForward();
         forward.setRedirect(false);
         forward.setPath("./board4/qna_board_view.jsp");
         return forward;

    }
}