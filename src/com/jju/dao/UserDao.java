package com.jju.dao;

import java.sql.SQLException;
import java.util.List;

import com.jju.bean.User;

public interface UserDao {
	//��¼��ѯ��������ѯ
	public User queryByName(String name) throws SQLException;
	//ע���û�
	public int register(String name,String password,String email);
	////����Ա��ѯ���е��û�
	public List<User> selectAllDate() ;
	//����Աɾ��ĳһ���û�
	public User deleteAllDate(int uid);
	//�޸��û�����
	public int updateEmail(String email,String uname);
	//�޸��û�����
	public int updatePwd(String pwd,String uname);
}
