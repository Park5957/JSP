package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import util.ConnectionPool;

public class MemoDAO {
	
	public boolean insert(String uid, String mtext)
			throws NamingException, SQLException {
				
				Connection conn = null;
				PreparedStatement pstmt = null;
								
				try {
					String sql = "INSERT INTO memo(uid,mtext,mdone) VALUES(?,?,?)";
					conn = ConnectionPool.get();
					pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, uid);
						pstmt.setString(2, mtext);
						pstmt.setString(3, "1");//1은 해결 안됨. 0은 해결됨으로 지정
						
						
					int result = pstmt.executeUpdate();
					
					return (result==1) ? true : false;			
					
				} finally {
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				}
			}
	
	public ArrayList<MemoDTO> getList() throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql="SELECT * FROM memo WHERE uid='test' AND mdone='1' ORDER BY mtime DESC";
			//uid 가 test 인 사람들과 mdone이 1인 사람들을 가지고 돌아옴
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			ArrayList<MemoDTO> memos = new ArrayList<MemoDTO>();
		
			while(rs.next()) {
				memos.add(new MemoDTO(rs.getString("mid"),
									  rs.getString("uid"),
									  rs.getString("mtext"),
									  rs.getString("mdone"),
									  rs.getString("mtime")));
			}
			return memos;
	} finally {
		if(rs !=null) rs.close();
		if(pstmt !=null) pstmt.close();
		if(conn !=null) conn.close();
	}
}
	
	public boolean delete(String mid)
			throws NamingException, SQLException {
				
				Connection conn = null;
				PreparedStatement pstmt = null;
								
				try {
					String sql = "UPDATE memo SET mdone = '0' WHERE mid=?";
					conn = ConnectionPool.get();
					pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, mid);
					
						
						
					int result = pstmt.executeUpdate();
					
					return (result==1) ? true : false;			
					
				} finally {
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				}
			}
	public ArrayList<MemoDTO> getDelList() throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql="SELECT * FROM memo WHERE uid='test' AND mdone='0' ORDER BY mtime DESC";
			//uid 가 test 인 사람들과 mdone이 1인 사람들을 가지고 돌아옴
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			ArrayList<MemoDTO> memos = new ArrayList<MemoDTO>();
		
			while(rs.next()) {
				memos.add(new MemoDTO(rs.getString("mid"),
									  rs.getString("uid"),
									  rs.getString("mtext"),
									  rs.getString("mdone"),
									  rs.getString("mtime")));
			}
			return memos;
	} finally {
		if(rs !=null) rs.close();
		if(pstmt !=null) pstmt.close();
		if(conn !=null) conn.close();
	}
}
	public boolean Update(String mid)
			throws NamingException, SQLException {
				
				Connection conn = null;
				PreparedStatement pstmt = null;
								
				try {
					String sql = "UPDATE memo SET mdone = '1' WHERE mid=?";
					conn = ConnectionPool.get();
					pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, mid);
					
						
						
					int result = pstmt.executeUpdate();
					
					return (result==1) ? true : false;			
					
				} finally {
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				}
			}
}



