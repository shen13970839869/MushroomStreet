package com.jju.dao;

import java.util.List;

public interface FavoriteDao {
	//添加收藏
	public int addFavorite(int gid,String uname);
	//查询收藏是否重复
	public int queryrepeat(int gid,String uname);
	//查询Gid根据Uname
	public List<String> queryGidByUname(String uname);
}
