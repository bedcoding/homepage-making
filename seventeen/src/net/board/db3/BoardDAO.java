package net.board.db3;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public BoardDAO() {
		try{
			Context init = new InitialContext();
	  		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
	  		con = ds.getConnection();
		}catch(Exception ex){
			System.out.println("DB 연결 실패 : " + ex);
			return;
		}
	}
	
	//글의 개수 구하기.
	public int getListCount() {
		int x= 0;
		
		try{
			pstmt=con.prepareStatement("select count(*) from board3");
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				x=rs.getInt(1);
			}
		}catch(Exception ex){
			System.out.println("getListCount 에러: " + ex);			
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
		}
		return x;
	}
	
	//글 목록 보기.	
	public List getBoardList(int page,int limit){
		String board_list_sql="select * from "+
		"(select rownum rnum,BOARD_NUM,BOARD_NAME,BOARD_SUBJECT,"+
		"BOARD_CONTENT, BOARD_FILE,"+
		"BOARD_DATE from (select * from board3 order by BOARD_NUM DESC))"+
		"where rnum>=? and rnum<=?";
		
		List list = new ArrayList();
		
		int startrow=(page-1)*10+1;  //읽기 시작할 row 번호.
		int endrow=startrow+limit-1; //읽을 마지막 row 번호.		
		try{
			pstmt = con.prepareStatement(board_list_sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, endrow);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				BoardBean board = new BoardBean();
				board.setBOARD_NUM(rs.getInt("BOARD_NUM"));
				board.setBOARD_NAME(rs.getString("BOARD_NAME"));
				board.setBOARD_SUBJECT(rs.getString("BOARD_SUBJECT"));
				board.setBOARD_CONTENT(rs.getString("BOARD_CONTENT"));
				board.setBOARD_FILE(rs.getString("BOARD_FILE"));
				board.setBOARD_DATE(rs.getDate("BOARD_DATE"));
				list.add(board);
			}
			
			return list;
		}catch(Exception ex){
			System.out.println("getBoardList 에러 : " + ex);
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
		}
		return null;
	}
	
	//글 내용 보기.
	public BoardBean getDetail(int num) throws Exception{
		BoardBean board = null;
		try{
			pstmt = con.prepareStatement(
					"select * from board3 where BOARD_NUM = ?");
			pstmt.setInt(1, num);
			
			rs= pstmt.executeQuery();
			
			if(rs.next()){
				board = new BoardBean();
				board.setBOARD_NUM(rs.getInt("BOARD_NUM"));
				board.setBOARD_NAME(rs.getString("BOARD_NAME"));
				board.setBOARD_SUBJECT(rs.getString("BOARD_SUBJECT"));
				board.setBOARD_CONTENT(rs.getString("BOARD_CONTENT"));
				board.setBOARD_FILE(rs.getString("BOARD_FILE"));
				board.setBOARD_DATE(rs.getDate("BOARD_DATE"));
			}
			return board;
		}catch(Exception ex){
			System.out.println("getDetail 에러 : " + ex);
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt !=null)try{pstmt.close();}catch(SQLException ex){}
		}
		return null;
	}
	
	//글 등록.
	public boolean boardInsert(BoardBean board){
		int num =0;
		String sql="";
		
		int result=0;
		
		try{
			pstmt=con.prepareStatement("select max(board_num) from board3");
			rs = pstmt.executeQuery();
			
			if(rs.next())
				num =rs.getInt(1)+1;
			else
				num=1;
			
			sql="insert into board3 (BOARD_NUM,BOARD_NAME,BOARD_PASS,BOARD_SUBJECT,";
			sql+="BOARD_CONTENT, BOARD_FILE, "+				
				 "BOARD_DATE) values(?,?,?,?,?,?,sysdate)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, board.getBOARD_NAME());
			pstmt.setString(3, board.getBOARD_PASS());
			pstmt.setString(4, board.getBOARD_SUBJECT());
			pstmt.setString(5, board.getBOARD_CONTENT());
			pstmt.setString(6, board.getBOARD_FILE());
			
			result=pstmt.executeUpdate();
			if(result==0)return false;
			
			return true;
		}catch(Exception ex){
			System.out.println("boardInsert 에러 : "+ex);
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
		}
		return false;
	}
	
	public BoardBean getPrev(int num) {
	      // TODO Auto-generated method stub
	      BoardBean board = null;
	      try {
	         pstmt = con.prepareStatement(
	               "SELECT board_num, board_subject FROM board3 WHERE board_num IN ((SELECT MIN(board_num) FROM board3 WHERE board_num >?))");
	         pstmt.setInt(1, num);

	         rs = pstmt.executeQuery();

	         if (rs.next()) {
	            board = new BoardBean();
	            board.setBOARD_NUM(rs.getInt("BOARD_NUM"));
	            board.setBOARD_SUBJECT(rs.getString("BOARD_SUBJECT"));
	            
	         }
	         return board;
	      } catch (Exception ex) {
	         System.out.println("getPrev 에러 : " + ex);
	      } finally {
	         if (rs != null)
	            try {
	               rs.close();
	            } catch (SQLException ex) {
	            }
	         if (pstmt != null)
	            try {
	               pstmt.close();
	            } catch (SQLException ex) {
	            }
	      }
	      return null;
	   }
	   
	   public BoardBean getNext(int num) {
	      // TODO Auto-generated method stub
	      BoardBean board = null;
	      try {
	         pstmt = con.prepareStatement(
	               "SELECT board_num, board_subject FROM board3 WHERE board_num IN ((SELECT MAX(board_num) FROM board3 WHERE board_num < ?))");
	         pstmt.setInt(1, num);

	         rs = pstmt.executeQuery();

	         if (rs.next()) {
	            board = new BoardBean();
	            board.setBOARD_NUM(rs.getInt("BOARD_NUM"));
	            board.setBOARD_SUBJECT(rs.getString("BOARD_SUBJECT"));
	            
	         }
	         return board;
	      } catch (Exception ex) {
	         System.out.println("getNext 에러 : " + ex);
	      } finally {
	         if (rs != null)
	            try {
	               rs.close();
	            } catch (SQLException ex) {
	            }
	         if (pstmt != null)
	            try {
	               pstmt.close();
	            } catch (SQLException ex) {
	            }
	      }
	      return null;
	   }
	
	//글 수정.
	public boolean boardModify(BoardBean modifyboard) throws Exception{
		String sql="update board set BOARD_SUBJECT=?,BOARD_CONTENT=? where BOARD_NUM=?";
		
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, modifyboard.getBOARD_SUBJECT());
			pstmt.setString(2, modifyboard.getBOARD_CONTENT());
			pstmt.setInt(3, modifyboard.getBOARD_NUM());
			pstmt.executeUpdate();
			return true;
		}catch(Exception ex){
			System.out.println("boardModify 에러 : " + ex);
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			}
		return false;
	}
	
	//글 삭제.
	public boolean boardDelete(int num){
		String board_delete_sql="delete from board3 where BOARD_num=?";
		
		int result=0;
		
		try{
			pstmt=con.prepareStatement(board_delete_sql);
			pstmt.setInt(1, num);
			result=pstmt.executeUpdate();
			if(result==0)return false;
			
			return true;
		}catch(Exception ex){
			System.out.println("boardDelete 에러 : "+ex);
		}finally{
			try{
				if(pstmt!=null)pstmt.close();
			}catch(Exception ex) {}
		}
		
		return false;
	}
	
	
	//글쓴이인지 확인.
	public boolean isBoardWriter(int num,String pass){
		String board_sql="select * from board3 where BOARD_NUM=?";
		
		try{
			pstmt=con.prepareStatement(board_sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			rs.next();
			
			if(pass.equals(rs.getString("BOARD_PASS"))){
				return true;
			}
		}catch(SQLException ex){
			System.out.println("isBoardWriter 에러 : "+ex);
		}
		return false;
	}
	
	
	
	// 검색
	public int getListCount(String types, String search_val) {
		int x = 0;

		try {
			if (types.equals("0")) {// 전체
				pstmt = con.prepareStatement(
						"select count(*) from board3 where board_subject like ? or board_content like ? or board_name like ?");
				pstmt.setString(1, '%' + search_val + '%');
				pstmt.setString(2, '%' + search_val + '%');
				pstmt.setString(3, '%' + search_val + '%');
			} else if (types.equals("1")) {// 제목
				pstmt = con.prepareStatement("select count(*) from board3 where board_subject like ?");
				pstmt.setString(1, '%' + search_val + '%');
			} else if (types.equals("2")) {// 내용
				pstmt = con.prepareStatement("select count(*) from board3 where board_content like ?");
				pstmt.setString(1, '%' + search_val + '%');
			}
			rs = pstmt.executeQuery();

			if (rs.next()) {
				x = rs.getInt(1);
			}
		} catch (Exception ex) {
			System.out.println("getListCount 에러: " + ex);
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
		}
		return x;
	}
	
	
	
	
	// 검색2
	public List getBoardList(int page, int limit, String types, String search_val) {
		// 전체 + 제목 + 내용
		System.out.println("글목록2");

		String board_list_sql = "";
		if (types.equals("0")) {
			board_list_sql = "select * from " + "(select rownum rnum,BOARD_NUM,BOARD_NAME,BOARD_SUBJECT,"
					+ "BOARD_CONTENT, BOARD_FILE,"
					+ "BOARD_DATE from (select * from board3 where board_subject like ? or board_content like ? or board_name like ? order by BOARD_NUM DESC))"
					+
					// "(select * from board3 order by BOARD_RE_REF desc,BOARD_RE_SEQ asc)) "+
					"where rnum>=? and rnum<=?";
		} else if (types.equals("1")) {
			board_list_sql = "select * from " + "(select rownum rnum,BOARD_NUM,BOARD_NAME,BOARD_SUBJECT,"
					+ "BOARD_CONTENT, BOARD_FILE,"
					+ "BOARD_DATE from (select * from board3 where board_subject like ? order by BOARD_NUM DESC))" +
					// "(select * from board3 order by BOARD_RE_REF desc,BOARD_RE_SEQ asc)) "+
					"where rnum>=? and rnum<=?";
		} else if (types.equals("2")) {
			board_list_sql = "select * from " + "(select rownum rnum,BOARD_NUM,BOARD_NAME,BOARD_SUBJECT,"
					+ "BOARD_CONTENT, BOARD_FILE,"
					+ "BOARD_DATE from (select * from board3 where board_content like ? order by BOARD_NUM DESC))" +
					// "(select * from board3 order by BOARD_RE_REF desc,BOARD_RE_SEQ asc)) "+
					"where rnum>=? and rnum<=?";
		}

		List list = new ArrayList();

		int startrow = (page - 1) * 10 + 1; // 읽기 시작할 row 번호.
		int endrow = startrow + limit - 1; // 읽을 마지막 row 번호.
		try {
			pstmt = con.prepareStatement(board_list_sql);

			if (types.equals("0")) {
				pstmt.setString(1, '%' + search_val + '%');
				pstmt.setString(2, '%' + search_val + '%');
				pstmt.setString(3, '%' + search_val + '%');
				pstmt.setInt(4, startrow);
				pstmt.setInt(5, endrow);
			} else if (types.equals("1")) {
				pstmt.setString(1, '%' + search_val + '%');
				pstmt.setInt(2, startrow);
				pstmt.setInt(3, endrow);
			} else if (types.equals("2")) {
				pstmt.setString(1, '%' + search_val + '%');
				pstmt.setInt(2, startrow);
				pstmt.setInt(3, endrow);
			}
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardBean board = new BoardBean();
				board.setBOARD_NUM(rs.getInt("BOARD_NUM"));
				board.setBOARD_NAME(rs.getString("BOARD_NAME"));
				board.setBOARD_SUBJECT(rs.getString("BOARD_SUBJECT"));
				board.setBOARD_CONTENT(rs.getString("BOARD_CONTENT"));
				board.setBOARD_FILE(rs.getString("BOARD_FILE"));
				board.setBOARD_DATE(rs.getDate("BOARD_DATE"));
				list.add(board);
			}

			return list;
		} catch (Exception ex) {
			System.out.println("getBoardList 에러 : " + ex);
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
		}
		return null;
	}

}
	