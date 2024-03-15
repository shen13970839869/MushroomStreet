package com.jju.dao;

import java.sql.SQLException;
import java.util.List;

import com.jju.bean.User;

public interface UserDao {
	//登录查询按姓名查询
	public User queryByName(String name) throws SQLException;
	//注册用户
	public int register(String name,String password,String email);
	////管理员查询所有的用户
	public List<User> selectAllDate() ;
	//管理员删除某一个用户
	public User deleteAllDate(int uid);
	//修改用户邮箱
	public int updateEmail(String email,String uname);
	//修改用户密码
	public int updatePwd(String pwd,String uname);
}
