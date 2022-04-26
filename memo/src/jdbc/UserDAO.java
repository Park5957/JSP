package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.NamingException;

import util.ConnectionPool;

public class UserDAO {
	public boolean insert(String userid, String userpw, String username) //회원가입
			throws NamingException, SQLException {
				
				Connection conn = null;
				PreparedStatement pstmt = null;
								
				try {
					String sql = "INSERT INTO memouser(userid,userpw,username,usertype) VALUES(?,?,?,?)";
					conn = ConnectionPool.get();
					pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, userid);
						pstmt.setString(2, userpw);
						pstmt.setString(3, username);
						pstmt.setString(4, "1"); // 1은 정상회원 0는 탈퇴회원으로 처리할 것임
						
						
					int result = pstmt.executeUpdate();
					
					return (result==1) ? true : false;			
					
				} finally {
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				}
			}
	public boolean exists(String userid) //회원확인
			throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
						
		String sql = "SELECT userid FROM memouser WHERE userid = ?";
		conn = ConnectionPool.get();
		pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
				
		rs = pstmt.executeQuery();
			
		return rs.next();
	}
	
	
	
	//회원탈퇴
		public boolean delete(String userid) 
		throws NamingException, SQLException {
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			String sql = "DELETE FROM memouser WHERE userid= ?";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userid);
				
			int count = pstmt.executeUpdate();
			
			return (count == 1) ? true : false;
		}
	
	public int login(String userid, String userpw) //회원확인
			throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
						
		String sql = "SELECT userid,userpw FROM memouser WHERE userid = ?";
		conn = ConnectionPool.get();
		pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			
				
		rs = pstmt.executeQuery();
			if (!rs.next()) {//비어있다면
				return 1;
			}
			if(!userpw.equals(rs.getString("userpw"))) { //비밀번호가 같지 않다면
				return 2;
			}
		return 0;
	}
	

}
