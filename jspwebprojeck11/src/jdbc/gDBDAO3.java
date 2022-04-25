package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import com.mysql.cj.protocol.Resultset;

import jdbc.*;
import util.ConnectionPool;

public class gDBDAO3 { //DB에 넣는 메서드

	public boolean insert(String gNum, String gNicName, String gTitle, String gText, String gPNumber,String gTime) throws NamingException, SQLException{
				Connection conn = null;
				PreparedStatement pstmt = null;
				
				try {
					String sql = "INSERT INTO listgi(gNum,gNicName,gTitle,Text,gPNumber) VALUES(?,?,?,?,?)";
					conn = ConnectionPool.get();
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, gNum);
					pstmt.setString(2, gNicName);
					pstmt.setString(3, gTitle);
					pstmt.setString(4, gText);
					pstmt.setString(5, gPNumber);
					
					int count = pstmt.executeUpdate();
					return (count>0) ? true : false;
					
				}finally {
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				}
	}
	public ArrayList<gDBDTO> getList() throws NamingException, SQLException { //DB 에서 메서드로 뽑아냄 -> main.jsp 로 보냄
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql="SELECT * FROM listgi ORDER BY ts DESC";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			ArrayList<gDBDTO> feeds = new ArrayList<gDBDTO>();
			
			while (rs.next()) {
				feeds.add(new gDBDTO(rs.getString("gNum"),
						rs.getString("gNicName"),
						rs.getString("gTitle"),
						rs.getString("gText"),
						rs.getString("gPNumber"),
						rs.getString("gTime")
						));
						
			}
			return feeds;
		}finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
			if(rs != null) rs.close();
		}
		}
	}


	



