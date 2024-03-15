package com.jju.dao;

import java.sql.SQLException;

import com.jju.bean.Admin;


public interface AdminPwdDao {
	//修改管理员信息
	public Boolean modifyAllDate(Admin admin);
	//验证旧密码是否正确
	public Admin queryByName(String name) throws SQLException;
}
