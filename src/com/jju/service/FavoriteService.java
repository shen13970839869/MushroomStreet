package com.jju.service;

import java.util.List;

import com.jju.bean.Category;
import com.jju.bean.Good;
import com.jju.bean.Type;
import com.jju.dao.FavoriteDao;
import com.jju.dao.FindAllDao;
import com.jju.dao.ShoppingDao;
import com.jju.db.DBConnection;
import com.jju.db.FavoriteDaoImpl;
import com.jju.db.FindAllDaoImpl;
import com.jju.db.ShoppingDaoImpl;


public class FavoriteService implements FavoriteDao {
	private DBConnection dbconn = null;

	private FavoriteDao dao = null;

	public FavoriteService() throws Exception {
		this.dbconn = new DBConnection();
		this.dao = new FavoriteDaoImpl(this.dbconn.getConnection());
	}

	@Override
	public int addFavorite(int gid, String uname) {
		// TODO Auto-generated method stub
		return this.dao.addFavorite(gid, uname);
	}

	@Override
	public List<String> queryGidByUname(String uname) {
		// TODO Auto-generated method stub
		return this.dao.queryGidByUname(uname);
	}

	@Override
	public int queryrepeat(int gid, String uname) {
		// TODO Auto-generated method stub
		return this.dao.queryrepeat(gid, uname);
	}

	

}
