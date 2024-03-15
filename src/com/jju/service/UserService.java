package com.jju.service;

import java.sql.SQLException;
import java.util.List;

import com.jju.bean.User;
import com.jju.dao.UserDao;
import com.jju.db.DBConnection;
import com.jju.db.UserDaoImpl;

public class UserService implements UserDao {

	private DBConnection dbconn = null;

	private UserDao dao = null;

	public UserService() throws Exception {
		this.dbconn = new DBConnection();
		this.dao = new UserDaoImpl(this.dbconn.getConnection());
	}

	@Override
	public User queryByName(String name) throws SQLException {
		
		return this.dao.queryByName(name);
	}

	@Override
	public int register(String name, String password, String email) {
		return this.dao.register(name, password, email);
	}

	@Override
	public List<User> selectAllDate() {
		// TODO Auto-generated method stub
		return this.dao.selectAllDate();
	}

	@Override
	public User deleteAllDate(int uid) {
		// TODO Auto-generated method stub
		return this.dao.deleteAllDate(uid);
	}

	@Override
	public int updateEmail(String email, String uname) {
		// TODO Auto-generated method stub
		return this.dao.updateEmail(email, uname);
	}

	@Override
	public int updatePwd(String pwd, String uname) {
		// TODO Auto-generated method stub
		return this.dao.updatePwd(pwd, uname);
	}

}
