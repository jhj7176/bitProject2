package com.bit.attend.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class AttendDao {

	DataSource dataSource;
	PreparedStatement pstmt;
	ResultSet rs;
	Connection conn;
	
	public AttendDao() {
		// TODO Auto-generated constructor stub
		
		try {
			InitialContext init = new InitialContext();
			Context context = (Context) init.lookup("java:/comp/env");
			dataSource = (javax.sql.DataSource) context.lookup("jdbc/oracle");;
			
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public void updateAttend(int num, int att, int late, int absent) throws SQLException {
		String sql2 = "select att, late, absent from attend where num = ?"; //기존의 출석 정보를 가져옴.
		conn = dataSource.getConnection();
		pstmt = conn.prepareStatement(sql2);
		pstmt.setInt(1, num);
		rs = pstmt.executeQuery();
		int oatt = 0;
		int olate = 0;
		int oabsent = 0;
		while(rs.next()) {
			oatt = rs.getInt("att");
			olate = rs.getInt("late");
			oabsent = rs.getInt("absent");
		}//while
	
		String sql ="update attend set att=?, late=?, absent=? where num=?"; //새 출석정보 업데이트,
		
		conn = dataSource.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, oatt+att);	//servlet에서 호출할 때 att~absent값이 있냐없냐에 따라 0이나 1을 파라미터로 준다. 
		pstmt.setInt(2, olate+late);	//기존 출석 정보에서 +1이나 +0을 한다. 
		pstmt.setInt(3, oabsent+absent);
		pstmt.setInt(4, num);
		pstmt.executeQuery();
		
		if(pstmt!=null) pstmt.close();
		if(conn!=null) conn.close();
		
	}//update
	
	
	public ArrayList<AttendDto> selectAll() throws SQLException{
		ArrayList<AttendDto> list = new ArrayList<AttendDto>();
		
		String sql = "select * from attend";
		AttendDto bean = null;
		conn = dataSource.getConnection();
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			bean = new AttendDto();
			bean.setNum(rs.getInt("num"));
			bean.setName(rs.getString("name"));
			bean.setAtt(rs.getInt("att"));
			bean.setLate(rs.getInt("late"));
			bean.setAbsent(rs.getInt("absent"));
			list.add(bean);
		}//bean
		if(pstmt!=null) pstmt.close();
		if(conn!=null) conn.close();
		return list;
	}//selectAll
	
	
	
	
}
