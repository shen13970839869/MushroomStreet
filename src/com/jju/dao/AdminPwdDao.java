package com.jju.dao;

import java.sql.SQLException;

import com.jju.bean.Admin;


public interface AdminPwdDao {
	//�޸Ĺ���Ա��Ϣ
	public Boolean modifyAllDate(Admin admin);
	//��֤�������Ƿ���ȷ
	public Admin queryByName(String name) throws SQLException;
}
