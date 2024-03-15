package com.jju.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.jju.bean.Category;
import com.jju.bean.Good;
import com.jju.bean.GoodView;
import com.jju.bean.Type;
import com.jju.dao.FindAllDao;

public class FindAllDaoImpl implements FindAllDao {
	private Connection conn = null;

	private PreparedStatement pstmt = null;
	
	private ResultSet rs = null;

	public FindAllDaoImpl(Connection conn) {
		this.conn = conn;
	}

	@Override
	public List<Category> findAll() {
		List<Category> list = new ArrayList<Category>();
		String sql = "select * from category";
		try {
			pstmt = this.conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Category category = new Category();
                category.setCname(rs.getString("cname"));
                category.setCid(rs.getInt("cid"));
                list.add(category);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Type> findAllType() {
		List<Type> list = new ArrayList<Type>();
		String sql = "select * from Type";
		try {
			pstmt = this.conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Type type = new Type();
				type.setTname(rs.getString("tname"));
				type.setTid(rs.getInt("tid"));
				type.setCid(rs.getInt("cid"));
				System.out.println(rs.getString("tname"));
                list.add(type);
			}
			System.out.println("FindAllDaoImpl-findAllType");
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Good> findAllGoods() {
		List<Good> list = new ArrayList<Good>();
		String sql = "select * from Good";
		try {
			pstmt = this.conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Good good = new Good();
				good.setGid(rs.getInt("gid"));
				good.setGname(rs.getString("gname"));
				good.setNumber(rs.getInt("number"));
				good.setGphoto(rs.getString("gphoto"));
				good.setPrice(rs.getDouble("price"));
				good.setTid(rs.getInt("tid"));
				good.setCid(rs.getInt("cid"));
				System.out.println(rs.getString("gname"));
                list.add(good);
			}
			System.out.println("FindAllDaoImpl-findAllGoods===Good");
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
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
				System.out.println(rs.getString("gname")+"---FindAllDaoImpl-findGoodByGid");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return good;
	}

	@Override
	public List<Good> findPartGoods() {
		List<Good> list = new ArrayList<Good>();
		String sql = "select * from a";
		try {
			pstmt = this.conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Good good = new Good();
				good.setGid(rs.getInt("gid"));
				good.setGname(rs.getString("gname"));
				good.setNumber(rs.getInt("number"));
				good.setGphoto(rs.getString("gphoto"));
				good.setPrice(rs.getDouble("price"));
				good.setTid(rs.getInt("tid"));
				good.setCid(rs.getInt("cid"));
				System.out.println("FindAllDaoImpl-findPartGoods"+rs.getString("gname"));
                list.add(good);
			}
			System.out.println("FindAllDaoImpl-findPartGoods===Good");
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
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
	}

	@Override
	public List<GoodView> turnPages(int pageNumber, int pageSize) throws SQLException {
		// TODO Auto-generated method stub
				 ArrayList<GoodView> list = new ArrayList<>();
				 GoodView goodView=new GoodView();
				  String sql = "select * from GoodView limit ?,?";
				  pstmt = conn.prepareStatement(sql);
				  pstmt.setInt(1,(pageNumber-1)*pageSize);
				  pstmt.setInt(2, pageSize);
		         rs = pstmt.executeQuery();
		         if ( rs !=null){
		             while (rs.next()){
		            	int gid=rs.getInt("gid");
		 				String gname=rs.getString("gname");
		 				int number=rs.getInt("number");
		 				String gphoto=rs.getString("gphoto");
		 				double price=rs.getDouble("price");
		 				String tname=rs.getString("tname");
		 				String cname=rs.getString("cname");
		 				//System.out.println(gname);
		 				goodView=new GoodView(gid,gname,number,price,gphoto,cname,tname);
		                 list.add(goodView);
		             }
		         }
				return list;
			
	}

	@Override
	public int queryNumberByCid(int cid) {
		String sql = "select count(*) as one from good where cid = ?";
		int count=0;
		try {
			pstmt = this.conn.prepareStatement(sql);
			pstmt.setInt(1, cid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
                count = rs.getInt("one");
			}
			System.out.println("FindAllDaoImpl-queryNumberByCid===count-"+count);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public int insertGood(String gname, int number, String gphoto, double price, int cid, int tid) {
		String sql = "insert into good(gname,number,gphoto,price,cid,tid,favorite) values(?,?,?,?,?,?,0)";
		int row=0;
		try {
			pstmt = this.conn.prepareStatement(sql);
			pstmt.setString(1, gname);
			pstmt.setInt(2, number);
			pstmt.setString(3, gphoto);
			pstmt.setDouble(4, price);
			pstmt.setInt(5, cid);
			pstmt.setInt(6, tid);
			row = pstmt.executeUpdate();
			System.out.println("FindAllDaoImpl-queryNumberByCid===row-"+row);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return row;
	}
	@Override
	public GoodView findGoodViewByGid(String gid) {
		GoodView good = new GoodView();
		String sql = "select * from GoodView where gid=?";
		try {
			pstmt = this.conn.prepareStatement(sql);
			pstmt.setString(1, gid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				good.setGid(rs.getInt("gid"));
				good.setGname(rs.getString("gname"));
				good.setGoodNumber(rs.getInt("number"));
				good.setGphoto(rs.getString("gphoto"));
				good.setGoodPrice(rs.getDouble("price"));
				good.setCname(rs.getString("cname"));
				good.setTname(rs.getString("tname"));
				System.out.println(rs.getString("gname")+"---FindAllDaoImpl-findGoodByGid");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return good;
	}

	@Override
	public List<GoodView> findAllGoodViewByGid() {
		List<GoodView> list = new ArrayList<GoodView>();
		String sql = "select * from GoodView";
		try {
			pstmt = this.conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				GoodView goodView = new GoodView();
				goodView.setGid(rs.getInt("gid"));
				goodView.setGname(rs.getString("gname"));
				goodView.setGoodNumber(rs.getInt("number"));
				goodView.setGphoto(rs.getString("gphoto"));
				goodView.setGoodPrice(rs.getDouble("price"));
				goodView.setCname(rs.getString("cname"));
				goodView.setTname(rs.getString("tname"));
				System.out.println(rs.getString("gname")+"---FindAllDaoImpl-findAllGoodViewByGid");
				list.add(goodView);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
}
