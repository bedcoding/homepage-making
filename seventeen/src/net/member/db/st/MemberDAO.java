package net.member.db.st;
/*login_new.jsp 로그인 페이지입니다.
join_new.jsp 국내/국외 선택하는 페이지 입니다.
join00_2.jsp 회원가입창 페이지 입니다. 
email_chk.java 이메일 체크 하는 부분
id_chk.java  아이디 체크 하는 부분
JoinAction.java 가입 DB저장 부분입니다.
LoginAction.java DB체크해서 로그인하는 부분입니다. 세션생성 
LogoutAction.java 세션 없앱니다. 
각 jsp에는 로그인 로그아웃 if문을 만들어주세요.*/
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import net.board.db.BoardBean;

import net.member.db.st.MemberBean;

public class MemberDAO {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;

	public MemberDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
			con = ds.getConnection();
		} catch (Exception ex) {
			System.out.println("DB 연결 실패 : " + ex);
			return;
		}

	}
	public int isMember(MemberBean member) {
		String sql = "SELECT * FROM SITEMEMBER WHERE ID=?";
		int result = -1;

		try {

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				if (rs.getString(3).equals(member.getPassword())) {
					result = 1;// 일치.
					System.out.println("비밀 번호 까지 확인");
				} else {
					result = 0;// 불일치.
					System.out.println("불일치");
				}
			} else {
				result = -1;// 아이디 존재하지 않음.
				System.out.println("아이디 존재하지 않음.");
			}
		} catch (Exception ex) {
			System.out.println("isMember 에러: " + ex);
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

		return result;
	}
	
	public boolean checkUsername(String id) {
		
		String sql = "SELECT * FROM SITEMEMBER WHERE ID=?";
		boolean result = false;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = true; // 해당 아이디 존재
			System.out.println("아이디랑 같은게 잇음.");
			return result;}

		} catch (Exception ex) {
			System.out.println("checkUsername 에러: " + ex);
		} finally {
			if (rs != null) {
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
		}
		System.out.println("아이디체크 다오");
		return result;
	}
	public boolean checkEmail(String email) {
		String sql = "SELECT * FROM SITEMEMBER WHERE EMAIL=?";
		boolean result = false;
		System.out.println(email);
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = true; // 해당 아이디 존재

			return result;
			}
		} catch (Exception ex) {
			System.out.println("checkUsername 에러: " + ex);
		} finally {
			if (rs != null) {
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
		}
		System.out.println("이메일체크 다오");
		return result;
			
	}
	public boolean joinMember(MemberBean memberbean) {
		System.out.println("조인 멤버 다오에 들어옴");
		int result = 0;
		String sql = "INSERT INTO SITEMEMBER VALUES (?,?,?,?,?)";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberbean.getName());
			pstmt.setString(2, memberbean.getId());
			pstmt.setString(3, memberbean.getPassword());
			pstmt.setString(4, memberbean.getNation());
			pstmt.setString(5, memberbean.getEmail());
			result = pstmt.executeUpdate();
			System.out.println("DB에 들어갔는지 확인"+result);
			if (result != 0) {
				return true;
			}
		
	} catch (Exception ex) {
		System.out.println("joinMember 에러: " + ex);
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
