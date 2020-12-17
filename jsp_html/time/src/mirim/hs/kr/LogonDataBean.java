package mirim.hs.kr;

import java.sql.*;
import javax.sql.*;
import javax.naming.*;

public class LogonDataBean {
	
	private static LogonDataBean instance = new LogonDataBean();
	
	public static LogonDataBean getInstance() {
		return instance;
	}
	
	public  LogonDataBean() {
		
	}
	
	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("mysqljdbc");
		return ds.getConnection();
	} //getConnection()
	
	public void insertMember(LogonDBBean member) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;		
		try {
			conn = getConnection();
			
			String sql = "insert into user values(?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPasswd());
			pstmt.setString(3, member.getEmail());
			pstmt.setString(4, member.getNickname());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if(pstmt!=null) { try { pstmt.close(); } catch(Exception e) { } }
			if(conn!=null) { try { conn.close(); } catch(Exception e) { } }
		}		
	} //insertMember

	public int userCheck(String id, String passwd) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpasswd = "";
		int x = -1;
		
		try {
			conn = getConnection();
			String sql = "select passwd from user where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {	//회원
				dbpasswd = rs.getString("passwd");
				if(dbpasswd.equals(passwd)) {
					x = 1;	//회원인증 성공
				}
				else {
					x = 0;	//비밀번호 확인
				}
			}
			else {	//비회원
				x = -1;
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if(rs!=null) { try { rs.close(); } catch(Exception e) { } }
			if(pstmt!=null) { try { pstmt.close(); } catch(Exception e) { } }
			if(conn!=null) { try { conn.close(); } catch(Exception e) { } }
		}		
		return x;		
	} //userCheck
	
	public int confirmId(String id) throws Exception {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = -1;
		
		try {
			conn = getConnection();
			String sql = "select id from user where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				x = 1;	//해당 아이디가 존재함.
			}
			else {
				x = -1;	//해당 아이디가 없음.
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if(rs!=null) { try { rs.close(); } catch(Exception e) { } }
			if(pstmt!=null) { try { pstmt.close(); } catch(Exception e) { } }
			if(conn!=null) { try { conn.close(); } catch(Exception e) { } }
		}	
		return x;
	} //confirmId()
	
	public LogonDBBean getMember(String id) throws Exception {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		LogonDBBean member = null;
		
		try {
			conn = getConnection();
			String sql = "select * from member where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				member = new LogonDBBean();
				member.setId(rs.getString("id"));
				member.setPasswd(rs.getString("pw"));
				member.setEmail(rs.getString("email"));
				member.setNickname(rs.getString("nickname"));
				
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if(rs!=null) { try { rs.close(); } catch(Exception e) { } }
			if(pstmt!=null) { try { pstmt.close(); } catch(Exception e) { } }
			if(conn!=null) { try { conn.close(); } catch(Exception e) { } }
		}			
		return member;		
	} //getMember()
	
	public void updateMember(LogonDBBean member) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {			
			conn = getConnection();
			String sql = "update member set passwd=?, nickname=?, email=? where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getPasswd());
			pstmt.setString(2, member.getNickname());
			pstmt.setString(3, member.getEmail());
			pstmt.setString(5, member.getId());
			pstmt.executeUpdate();			
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if(pstmt!=null) { try { pstmt.close(); } catch(Exception e) { } }
			if(conn!=null) { try { conn.close(); } catch(Exception e) { } }
		}		
	} //updateMember
	
	public int deleteMember(String id, String passwd) throws Exception {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbPasswd = "";
		int x = -1;
		
		try {
			conn = getConnection();
			String sql = "select passwd from member where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dbPasswd = rs.getString("passwd");
				if(dbPasswd.equals(passwd)) {
					pstmt = conn.prepareStatement("delete from member where id = ?");
					pstmt.setString(1, id);
					pstmt.executeUpdate();
					x = 1;
				}
				else {
					x = 0;	//  비밀번호 틀림
				}				
			} //if
			else {
				x = -1;	// 비회원
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if(rs!=null) { try { rs.close(); } catch(Exception e) { } }
			if(pstmt!=null) { try { pstmt.close(); } catch(Exception e) { } }
			if(conn!=null) { try { conn.close(); } catch(Exception e) { } }
		}			
		return x;
	} //deleteMember
}
