package net.board.action4;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.db4.BoardDAO;

public class BoardListAction implements Action {
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      BoardDAO boarddao = new BoardDAO();
      List boardlist = new ArrayList();

      int page = 1;
      int limit = 10;
      request.setCharacterEncoding("UTF-8");
      response.setContentType("text/html; charset=UTF-8");

      if (request.getParameter("page") != null) {
         page = Integer.parseInt(request.getParameter("page"));
      }

      String types = request.getParameter("types");
      String search_val = request.getParameter("search_val");

      System.out.println("BoardListAction 테스트1: " + types + "/" + search_val);
      int listcount = 0;
      
      if (request.getParameter("types") != null) {
         System.out.println("BoardListAction 테스트2: " + types + "/" + search_val);
         listcount = boarddao.getListCount(types, search_val);
         boardlist = boarddao.getBoardList(page, limit, types, search_val);
      } else {
         System.out.println("BoardListAction 테스트3: ");
         listcount = boarddao.getListCount();
         boardlist = boarddao.getBoardList(page, limit); 
      }
   
      int maxpage = (int) ((double) listcount / limit + 0.95); 
   
      int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;

      int endpage = maxpage;

      if (endpage > startpage + 10 - 1)
         endpage = startpage + 10 - 1;

      request.setAttribute("page", page); 
      request.setAttribute("maxpage", maxpage); 
      request.setAttribute("startpage", startpage); 
      request.setAttribute("endpage", endpage);
      request.setAttribute("listcount", listcount); 
      request.setAttribute("boardlist", boardlist);

      ActionForward forward = new ActionForward();
      forward.setRedirect(false);
      forward.setPath("./board4/qna_board_list.jsp");
      return forward;
   }
}