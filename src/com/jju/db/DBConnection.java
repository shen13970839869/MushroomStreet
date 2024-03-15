package com.jju.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

	private final String Driver = "com.mysql.cj.jdbc.Driver";

	private final String URL = "jdbc:mysql://localhost:3306/mogujie?characterEncoding=utf8&useSSL=true";

	private final String USER = "root";

	private final String PASSWORD = "123456";

	private Connection conn = null;

	public DBConnection() throws SQLException {
		try {
			Class.forName(Driver);
		} catch (ClassNotFoundException e) {
			System.out.println("找不到驱动程序类 ，加载驱动失败！");
			e.printStackTrace();
		}
		try{   
			this.conn = DriverManager.getConnection(URL, USER, PASSWORD);  
	     }catch(SQLException se){   
	          System.out.println("数据库连接失败！");   
	          se.printStackTrace() ;   
	     }
		System.out.println(this.conn);
	}

	public Connection getConnection() {
		return conn;
	} 
	//关闭数据库连接
	public void close() {
		if (this.conn != null) {
			try {
				this.conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
