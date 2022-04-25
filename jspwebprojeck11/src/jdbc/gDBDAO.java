package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.naming.NamingException;

import util.ConnectionPool;

public class gDBDAO {
	
	public ArrayList<gDBDTO> getList()
			throws NamingException, SQLException {
				
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				try {
					String sql = "SELECT * FROM listgi";
					
					conn = ConnectionPool.get();
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					
					ArrayList<gDBDTO> boards = new ArrayList<gDBDTO>();
					
					while(rs.next()) {
						boards.add(new gDBDTO(rs.getString("gNum"),
													rs.getString("gNicName"),
													rs.getString("gTitle"),
													rs.getString("gText"),
													rs.getString("gPNumber"),
													rs.getString("gTime")));
					}
					return boards;
					
				}finally {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				}
				
				
			}
			
			
			
			
			public gDBDTO getDetail(String gNum) throws NamingException, SQLException {
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				try {
					String sql = "SELECT * FROM listgi WHERE gNum = ?";
					
					conn = ConnectionPool.get();
					pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, gNum);
					rs = pstmt.executeQuery();
					
					rs.next();
					
					gNum = rs.getString(1);
					String gNicName = rs.getString(2);
					String gTitle = rs.getString(3);
					String gText = rs.getString(4);
					String gPNumber = rs.getString(5);
					String gTime = rs.getString(6);

					
					gDBDTO board = new gDBDTO(gNum, gNicName, gTitle, gText, gPNumber, gTime);
					
					return board;
					
			} finally {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}
			
			}
			
			
			
			
			public boolean insert(String gTitle, String gText)
			throws NamingException, SQLException {
				
				Connection conn = null;
				PreparedStatement pstmt = null;
								
				try {
					String sql = "INSERT INTO listgi(gTitle,gText) VALUES(?,?)";
					conn = ConnectionPool.get();
					pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, gTitle);
						pstmt.setString(2, gText);
						
						
					int result = pstmt.executeUpdate();
					
					return (result==1) ? true : false;			
					
				} finally {
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				}
			}
			
			
		}