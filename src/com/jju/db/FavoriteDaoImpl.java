package com.jju.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.jju.bean.Category;
import com.jju.bean.Good;
import com.jju.bean.Type;
import com.jju.dao.FavoriteDao;
import com.jju.dao.FindAllDao;
import com.jju.dao.ShoppingDao;

public class FavoriteDaoImpl implements FavoriteDao {
	private Connection conn = null;

	private PreparedStatement pstmt = null;
	
	private ResultSet rs = null;

	public FavoriteDaoImpl(Connection conn) {
		this.conn = conn;
	}

	@Override
	public int addFavorite(int gid, String uname) {
		int result =-1;
		String sql = "insert into favorite(gid,uname) values(?,?)";
		try {
			pstmt = this.conn.prepareStatement(sql);
			pstmt.setInt(1, gid);
			pstmt.setString(2, uname);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<String> queryGidByUname(String uname) {
		List<String> str = new ArrayList<String>();
		String sql = "select gid from favorite where uname=?";
		try {
			pstmt = this.conn.prepareStatement(sql);
			pstmt.setString(1, uname);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				str.add(rs.getInt("gid")+"");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return str;
	}

	@Override
	public int queryrepeat(int gid, String uname) {
		int row=0;
		String sql = "select count(*) as row from favorite where uname=? and gid=?";
		try {
			pstmt = this.conn.prepareStatement(sql);
			pstmt.setString(1, uname);
			pstmt.setInt(2, gid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				row = rs.getInt("row");
				System.out.println("---------"+row);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return row;
	}

	
	/*@Override
	public Good findGoodByGid(String gid) {
		Good good = new Good();
		String sql = "select * from Good where gid=?";
		try {
			pstmt = this.conn.prepareStatement(sql);
			pstmt.setString(1, gid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				good.setGid(rs.getInt("gid"));
				good.setGname(rs.getString("gname"));
				good.setNumber(rs.getInt("number"));
				good.setGphoto(rs.getString("gphoto"));
				good.setPrice(rs.getDouble("price"));
				good.setCid(rs.getInt("cid"));
				good.setTid(rs.getInt("tid"));
				System.out.println(rs.getString("gname")+"---");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return good;
	}*/

	

}
