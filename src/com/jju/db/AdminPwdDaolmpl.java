package com.jju.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.jju.bean.Admin;
import com.jju.dao.AdminPwdDao;

public class AdminPwdDaolmpl implements AdminPwdDao{
	private Connection conn = null;

	private PreparedStatement pstmt = null;
	
	private ResultSet rs = null;

	public  AdminPwdDaolmpl(Connection conn) {
		this.conn = conn;
	}
	@Override
	public Boolean modifyAllDate(Admin admin) {
		// TODO Auto-generated method stub
		int result=-1;
		  String sql = "update admin set upassword=?";
			try {
				pstmt  = this.conn.prepareStatement(sql);
				pstmt.setString(1, admin.getUpassword());
				result= pstmt.executeUpdate();
				System.out.println(result);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return true;
	}
	@Override
	public Admin queryByName(String name) throws SQLException {
		// TODO Auto-generated method stub
		Admin admin= new Admin();
		try {	
			String sql = "select * from admin where upassword=? ";
			pstmt = this.conn.prepareStatement(sql);
			pstmt.setString(1,name);
			rs = pstmt.executeQuery();	
			System.out.println(rs);
			if (rs!=null) {
				while (rs.next()) {			
					admin.setUname(rs.getString("uname"));
					admin.setUpassword(rs.getString("upassword"));	
					System.out.println(admin.getUname());		
			}
		}		
		}catch(SQLException e){
			e.printStackTrace();
		}
		return admin;
	}

}
