package com.jju.service;

import java.sql.SQLException;
import java.util.List;

import com.jju.bean.Category;
import com.jju.bean.Good;
import com.jju.bean.GoodView;
import com.jju.bean.Type;
import com.jju.dao.FindAllDao;
import com.jju.db.DBConnection;
import com.jju.db.FindAllDaoImpl;


public class FindAllService implements FindAllDao {
	private DBConnection dbconn = null;

	private FindAllDao dao = null;

	public FindAllService() throws Exception {
		this.dbconn = new DBConnection();
		this.dao = new FindAllDaoImpl(this.dbconn.getConnection());
	}

	@Override
	public List<Category> findAll() {
		// TODO Auto-generated method stub
		return this.dao.findAll();
	}

	@Override
	public List<Type> findAllType() {
		// TODO Auto-generated method stub
		return this.dao.findAllType();
	}

	@Override
	public List<Good> findAllGoods() {
		// TODO Auto-generated method stub
		return this.dao.findAllGoods();
	}

	@Override
	public Good findGoodByGid(String gid) {
		// TODO Auto-generated method stub
		return this.dao.findGoodByGid(gid);
	}

	@Override
	public List<Good> findPartGoods() {
		// TODO Auto-generated method stub
		return this.dao.findPartGoods();
	}

	@Override
	public int selectCidByString(String str) {
		// TODO Auto-generated method stub
		return this.dao.selectCidByString(str);
	}

	@Override
	public List<GoodView> turnPages(int pageNumber, int pageSize) throws SQLException {
		// TODO Auto-generated method stub
		return this.dao.turnPages(pageNumber, pageSize);
	}

	@Override
	public int queryNumberByCid(int cid) {
		// TODO Auto-generated method stub
		return this.dao.queryNumberByCid(cid);
	}

	@Override
	public int insertGood(String gname, int number, String gphoto, double price, int cid, int tid) {
		// TODO Auto-generated method stub
		return this.dao.insertGood(gname, number, gphoto, price, cid, tid);
	}

	@Override
	public GoodView findGoodViewByGid(String gid) {
		// TODO Auto-generated method stub
		return this.dao.findGoodViewByGid(gid);
	}

	@Override
	public List<GoodView> findAllGoodViewByGid() {
		// TODO Auto-generated method stub
		return this.dao.findAllGoodViewByGid();
	}

	
}
