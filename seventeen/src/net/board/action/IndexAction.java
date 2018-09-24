package net.board.action;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.board.db.BoardDAO;

public class IndexAction implements Action {
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      BoardDAO boarddao = new BoardDAO();
      List boardlist = new ArrayList();

      request.setCharacterEncoding("UTF-8");
      response.setContentType("text/html;charset=UTF-8");
      boardlist = boarddao.getBoardList(1, 10);


      request.setAttribute("boardlist", boardlist);

      ActionForward forward = new ActionForward();
      forward.setRedirect(false);
      forward.setPath("index.jsp");
      return forward;
   }
}