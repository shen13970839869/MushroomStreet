package com.jju.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.jju.bean.User;
import com.jju.dao.UserDao;

public class UserDaoImpl implements UserDao {
	private Connection conn = null;

	private PreparedStatement pstmt = null;
	
	private ResultSet rs = null;

	public UserDaoImpl(Connection conn) {
		this.conn = conn;
	}

	@Override
	public User queryByName(String name) throws SQLException {
		User user1= new User();
		try {
			conn.setAutoCommit(false);
			
			String sql = "select * from user where uname=? ";
			pstmt = this.conn.prepareStatement(sql);
			pstmt.setString(1,name);
			rs = pstmt.executeQuery();
			
			conn.commit();
			
			while (rs.next()) {
				if(rs.getString("uname")!=null) {
					user1.setUid(rs.getInt("uid"));
					user1.setUname(rs.getString("uname"));
					user1.setUpassword(rs.getString("upassword"));
					user1.setEmail(rs.getString("email"));
				}
				
			}
			
		}catch(SQLException e){
			conn.rollback();
		}finally {
			if(conn!=null) {
				conn.setAutoCommit(true);
			}
		}
		return user1;
	}

	@Override
	public int register(String name, String password, String email) {
		int result=-1;
		String sql = "insert into user(uname,upassword,email) values(?,?,?)";
		try {
			pstmt = this.conn.prepareStatement(sql);
			pstmt.setString(1,name);
			pstmt.setString(2,password);
			pstmt.setString(3,email);
			result = pstmt.executeUpdate();
			System.out.println("UserDaoImpl-register--"+result);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<User> selectAllDate() {
		// TODO Auto-generated method stub
		 ArrayList<User> user = new ArrayList<>();
		 User user1=new User();
		 String sql = "select * from user";
		 try {
			pstmt = this.conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if ( rs !=null){
                while (rs.next()){
                	int uid=rs.getInt("uid");
                	String uname=rs.getString("uname");
                	String upassword=rs.getString("upassword");
                	String email=rs.getString("email");
                	user1=new User(uid,uname,upassword,email);
                	System.out.println(user1.getUid());
                	user.add(user1);
                }
            }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}

	@Override
	public User deleteAllDate(int uid) {
		// TODO Auto-generated method stub
		int result=-1;
		String sql = "delete from user where uid=?";
		try {
			pstmt = this.conn.prepareStatement(sql);
			pstmt.setInt(1, uid);
			 result=pstmt.executeUpdate();
			 System.out.println(result);
            System.out.println("É¾³ý³É¹¦");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		return null;
	}

	@Override
	public int updateEmail(String email,String uname) {
		int row = 0;
		String sql = "update user set email = ? where uname=?";
		try {
			pstmt = this.conn.prepareStatement(sql);
			pstmt.setString(1,email);
			pstmt.setString(2,uname);
			row = pstmt.executeUpdate();
			System.out.println("UserDaoImpl-updateEmail--"+row);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return row;
	}

	@Override
	public int updatePwd(String pwd, String uname) {
		int row = 0;
		String sql = "update user set upassword = ? where uname=?";
		try {
			pstmt = this.conn.prepareStatement(sql);
			pstmt.setString(1,pwd);
			pstmt.setString(2,uname);
			row = pstmt.executeUpdate();
			System.out.println("UserDaoImpl-updatePwd--"+row);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return row;
	}
	
}
