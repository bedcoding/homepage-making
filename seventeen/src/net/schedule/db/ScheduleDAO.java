package net.schedule.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ScheduleDAO {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public ScheduleDAO() {
		try{
			Context init = new InitialContext();
	  		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
	  		con = ds.getConnection();
		}catch(Exception ex){
			System.out.println("DB 연결 실패 : " + ex);
			return;
		}
	}
	
	public boolean addSc(ScheduleBean sc) {
		   int num = 0;
		   String sql = "";

		   int result = 0;

		   try {
		      pstmt = con.prepareStatement("select max(sc_num) from schedule");
		      rs = pstmt.executeQuery();

		      if (rs.next())
		         num = rs.getInt(1) + 1;
		      else
		         num = 1;
		      
		      pstmt=con.prepareStatement("select * from schedule where sc_year=? and sc_month=? and sc_day=?");
		      pstmt.setInt(1, sc.getSc_year());
		      pstmt.setInt(2,  sc.getSc_month());
		      pstmt.setInt(3,  sc.getSc_day());
		      rs = pstmt.executeQuery();
		      if(rs.next()) {
		         return false;
		      }
		System.out.println(num);
		      sql = "insert into schedule (sc_num,sc_content,sc_year,sc_month,sc_day) values (?,?,?,?,?)";
		   

		      pstmt = con.prepareStatement(sql);
		      pstmt.setInt(1, num);
		      pstmt.setString(2, sc.getSc_content());
		      pstmt.setInt(3, sc.getSc_year());
		      pstmt.setInt(4,  sc.getSc_month());
		      pstmt.setInt(5,  sc.getSc_day());
		      result = pstmt.executeUpdate();
		      if (result == 0)
		         return false;

		      return true;
		   } catch (Exception ex) {
		      System.out.println("addSc 에러 : " + ex);
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
		   return false;
		}


		public List getScList() {
		   System.out.println("스케줄");

		   String board_list_sql = "select * from schedule";

		   List list = new ArrayList();

		   try {
		      pstmt = con.prepareStatement(board_list_sql);

		      rs = pstmt.executeQuery();
		System.out.println("아아아아try:");
		      while (rs.next()) {
		         System.out.println("아아아아rs.next:");
		         ScheduleBean sc = new ScheduleBean();
		         
		         sc.setSc_num(rs.getInt("sc_num"));
		         sc.setSc_year(rs.getInt("sc_year"));
		         sc.setSc_month(rs.getInt("sc_month"));
		         sc.setSc_day(rs.getInt("sc_day"));
		         sc.setSc_content(rs.getString("sc_content"));
		         System.out.println("디버기이이이이이이잉입니댱"+rs.getString("sc_content"));
		         list.add(sc);
		      }

		      return list;
		   } catch (Exception ex) {
		      System.out.println("getScList 에러 : " + ex);
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

		public boolean deleteSc(int sc_num) {
		   String sql = "DELETE FROM schedule WHERE sc_num=?";
		   int result = 0;

		   try {
		      pstmt = con.prepareStatement(sql);
		      pstmt.setInt(1, sc_num);

		      result = pstmt.executeUpdate();

		      if (result != 0) {
		         return true;
		      }
		   } catch (Exception ex) {
		      System.out.println("deleteSc 에러: " + ex);
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

		   return false;
		}

		public boolean modifySc(ScheduleBean modifysc) {
		   // TODO Auto-generated method stub
		   String sql = "update schedule set sc_content=? where sc_num=?";

		   try {
		      pstmt = con.prepareStatement(sql);
		      pstmt.setString(1, modifysc.getSc_content());
		      pstmt.setInt(2, modifysc.getSc_num());
		      pstmt.executeUpdate();
		      return true;
		   } catch (Exception ex) {
		      System.out.println("modifySc 에러 : " + ex);
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
		   return false;

		}
}
	