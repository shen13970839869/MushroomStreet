package com.jju.dao;

import java.util.List;

public interface FavoriteDao {
	//����ղ�
	public int addFavorite(int gid,String uname);
	//��ѯ�ղ��Ƿ��ظ�
	public int queryrepeat(int gid,String uname);
	//��ѯGid����Uname
	public List<String> queryGidByUname(String uname);
}
