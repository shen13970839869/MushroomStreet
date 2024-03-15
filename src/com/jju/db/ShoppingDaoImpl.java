package com.jju.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.jju.bean.Category;
import com.jju.bean.Good;
import com.jju.bean.Middle;
import com.jju.bean.Order;
import com.jju.bean.Type;
import com.jju.dao.FindAllDao;
import com.jju.dao.ShoppingDao;

public class ShoppingDaoImpl implements ShoppingDao {
	private Connection conn = null;

	private PreparedStatement pstmt = null;
	
	private ResultSet rs = null;

	public ShoppingDaoImpl(Connection conn) {
		this.conn = conn;
	}

	@Override
	public int addGoodToCart1(int gid, String uname,int number) {
		String sql = "insert into shoppingcart(uname,gid,number) values(?,?,?)";
		try {
			pstmt = this.conn.prepareStatement(sql);
			pstmt.setString(1, uname);
			pstmt.setInt(2, gid);
			pstmt.setInt(3, number);
			int result = pstmt.executeUpdate();
			return result;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int addGoodToCart(int gid, String uname,int num) {
		String sql = "update shoppingcart set number=number+? where gid=? and uname = ?";
		try {
			pstmt = this.conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, gid);
			pstmt.setString(3, uname);
			int result = pstmt.executeUpdate();
			System.out.println("ShoppingDaoImpl-addGoodToCart-result="+result);
			return result;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	
	@Override
	public int selectCountByName(String uname) {
		int number=-1;
		String sql = "select count(*) as number from shoppingcart where uname=?";
		try {
			pstmt = this.conn.prepareStatement(sql);
			pstmt.setString(1, uname);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				number = rs.getInt("number");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return number;
	}

	@Override
	public List<String> selectGidByUname(String uname) {
		List<String> str = new ArrayList<String>();
		String sql = "select gid,number from shoppingcart where uname=?";
		try {
			pstmt = this.conn.prepareStatement(sql);
			pstmt.setString(1, uname);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				System.out.println(rs.getInt("gid")+"+"+rs.getInt("number"));
				str.add(rs.getInt("gid")+"+"+rs.getInt("number"));
			}
		} catch (SQLException e) { 
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return str;
	}

	@Override
	public int selectByGid(int gid,String uname) {
		int result=-1;
		String sql="select count(*) as one from shoppingcart where gid=? and uname=?";
		try {
			pstmt = this.conn.prepareStatement(sql);
			pstmt.setInt(1, gid);
			pstmt.setString(2, uname);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				result = rs.getInt("one");
				System.out.println("ShoppingDaoImpl-selectByGid"+result);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int addGoodToOrder(String uname, int gid, int number,String trueName,String address,String phone) {
		int result=-1;
		String sql = "insert into `order`(uname,gid,number,date,trueName,address,phone,status) values(?,?,?,NOW(),?,?,?,'1') ";    //order为关键字  使用加''
		try {
			pstmt = this.conn.prepareStatement(sql);
			pstmt.setString(1, uname);
			pstmt.setInt(2, gid);
			pstmt.setInt(3, number);
			pstmt.setString(4, trueName);
			pstmt.setString(5, address);
			pstmt.setString(6, phone);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int[] cleanCart(String uname, int gid, int number) {
		int[] Counts=null;
		String sql1 = "delete from shoppingcart where uname='"+uname+"'";
		String sql2 = "update good set number = number-"+number+" where gid="+gid;
		try {
			Statement st = this.conn.createStatement();
			st.addBatch(sql1);
			st.addBatch(sql2);
			Counts = st.executeBatch();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return Counts;
	}

	@Override
	public List<String> selectOrderByName(String uname) {
		String sql = "select gid,number,date from `order` where uname = ?";
		List<String> str = new ArrayList<String>();
		try {
			pstmt = this.conn.prepareStatement(sql);
			pstmt.setString(1, uname);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				System.out.println(rs.getInt("gid")+"+"+rs.getInt("number")+"+"+rs.getDate("date"));
				str.add(rs.getInt("gid")+"+"+rs.getInt("number")+"+"+rs.getDate("date"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return str;
	}

	@Override
	public List<Middle> selectAllOrder() {
		String sql = "select * from b";
		List<Middle> str = new ArrayList<Middle>();
		try {
			pstmt = this.conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				System.out.println(rs.getInt("oid")+"+"+rs.getString("uname")+"+"+rs.getString("gname")+"+"+rs.getInt("price")+"+"+rs.getDate("date"));
				Middle m = new Middle();
				m.setOid(rs.getInt("oid"));
				m.setGname(rs.getString("gname"));
				m.setUname(rs.getString("uname"));
				m.setPrice(rs.getInt("price"));
				m.setDate(rs.getDate("date"));
				m.setStatus(rs.getString("status"));
				m.setAddress(rs.getString("address"));
				str.add(m);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return str;
	}

	@Override
	public int DeleteOrderByOid(int oid) {
		int row=0;
		String sql = "delete  FROM `order` where oid=?";
		try {
			pstmt = this.conn.prepareStatement(sql);
			pstmt.setInt(1, oid);
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return row;
	}

	@Override
	public int UpdateStatusByOid(int oid) {
		int row=0;
		String sql = "update `order` set status = '0' where oid=?";
		try {
			pstmt = this.conn.prepareStatement(sql);
			pstmt.setInt(1, oid);
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return row;
	}
	@Override
	public List<Middle> turnPages(int pageNumber, int pageSize) throws SQLException {
		// TODO Auto-generated method stub
		List<Middle> str = new ArrayList<Middle>();
		Middle m = new Middle();
		  String sql = "select * from b limit ?,?";
		  pstmt = conn.prepareStatement(sql);
		  pstmt.setInt(1,(pageNumber-1)*pageSize);
		  pstmt.setInt(2, pageSize);
         rs = pstmt.executeQuery();
         if ( rs !=null){
             while (rs.next()){
            	/* m.setOid(rs.getInt("oid"));
 				m.setGname(rs.getString("gname"));
 				m.setUname(rs.getString("uname"));
 				m.setPrice(rs.getInt("price"));
 				m.setDate(rs.getDate("date"));
 				m.setStatus(rs.getString("status"));*/
            	 int oid=rs.getInt("oid");
            	 String gname=rs.getString("gname");
            	 String uname=rs.getString("uname");
            	 int price=rs.getInt("price");
            	 Date date=rs.getDate("date");
            	 String status=rs.getString("status");
            	 String address=rs.getString("address");
            	 m=new Middle(oid,gname,uname,price,date,status,address);
 				str.add(m);
             }
         }
		return str;
	}
	public int DeleteGoodByGid(int gid) {
		int row=0;
		String sql = "delete  FROM `good` where gid=?";
		try {
			pstmt = this.conn.prepareStatement(sql);
			pstmt.setInt(1, gid);
			row = pstmt.executeUpdate();
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
