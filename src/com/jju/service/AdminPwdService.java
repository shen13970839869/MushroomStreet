package com.jju.service;

import java.sql.SQLException;

import com.jju.bean.Admin;
import com.jju.dao.AdminPwdDao;
import com.jju.db.AdminPwdDaolmpl;
import com.jju.db.DBConnection;

public class AdminPwdService implements AdminPwdDao{
	private DBConnection dbconn = null;
	private AdminPwdDao dao = null;
	
	public AdminPwdService() throws Exception {
		this.dbconn = new DBConnection();
		this.dao = new AdminPwdDaolmpl(this.dbconn.getConnection());
	}
	@Override
	public Boolean modifyAllDate(Admin admin) {
		// TODO Auto-generated method stub
		return this.dao.modifyAllDate(admin);
	}
	@Override
	public Admin queryByName(String name) throws SQLException {
		// TODO Auto-generated method stub
		return this.dao.queryByName(name);
	}

}
