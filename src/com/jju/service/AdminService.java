package com.jju.service;

import java.util.List;

import com.jju.bean.Admin;
import com.jju.bean.Category;
import com.jju.bean.Good;
import com.jju.bean.Type;
import com.jju.dao.AdminDao;
import com.jju.dao.FindAllDao;
import com.jju.db.AdminDaoImpl;
import com.jju.db.DBConnection;
import com.jju.db.FindAllDaoImpl;


public class AdminService implements AdminDao {
	private DBConnection dbconn = null;

	private AdminDao dao = null;

	public AdminService() throws Exception {
		this.dbconn = new DBConnection();
		this.dao = new AdminDaoImpl(this.dbconn.getConnection());
	}

	@Override
	public int adminLogin(Admin admin) {
		// TODO Auto-generated method stub
		return this.dao.adminLogin(admin);
	}

	
}
