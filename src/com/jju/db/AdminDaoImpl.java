package com.jju.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.jju.bean.Admin;
import com.jju.bean.Category;
import com.jju.bean.Good;
import com.jju.bean.Type;
import com.jju.dao.AdminDao;
import com.jju.dao.FindAllDao;

public class AdminDaoImpl implements AdminDao {
	private Connection conn = null;

	private PreparedStatement pstmt = null;
	
	private ResultSet rs = null;

	public AdminDaoImpl(Connection conn) {
		this.conn = conn;
	}

	@Override
	public int adminLogin(Admin admin) {
		int row=0;
		String sql = "select count(*) as one from admin where uname=? and upassword=?";
		try {
			pstmt  = this.conn.prepareStatement(sql);
			pstmt.setString(1, admin.getUname());
			pstmt.setString(2, admin.getUpassword());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				row = rs.getInt("one");
			}
			 
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return row;
	}

	
	/*@Override
	public int selectCidByString(String str) {
		int cid=0;
		String sql = "select cid from type where tname  like  '%"+str+"%'";
		try {
			Statement st  = this.conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				cid = rs.getInt("cid");
			}
			 
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cid;
	}*/

	

}
