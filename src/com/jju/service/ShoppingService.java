package com.jju.service;

import java.sql.SQLException;
import java.util.List;

import com.jju.bean.Category;
import com.jju.bean.Good;
import com.jju.bean.Middle;
import com.jju.bean.Type;
import com.jju.dao.FindAllDao;
import com.jju.dao.ShoppingDao;
import com.jju.db.DBConnection;
import com.jju.db.FindAllDaoImpl;
import com.jju.db.ShoppingDaoImpl;


public class ShoppingService implements ShoppingDao {
	private DBConnection dbconn = null;

	private ShoppingDao dao = null;

	public ShoppingService() throws Exception {
		this.dbconn = new DBConnection();
		this.dao = new ShoppingDaoImpl(this.dbconn.getConnection());
	}

	@Override
	public int addGoodToCart1(int gid, String uname,int number) {
		return this.dao.addGoodToCart1(gid, uname,number);
	}

	@Override
	public int selectCountByName(String uname) {
		// TODO Auto-generated method stub
		return this.dao.selectCountByName(uname);
	}

	@Override
	public List<String> selectGidByUname(String uname) {
		// TODO Auto-generated method stub
		return this.dao.selectGidByUname(uname);
	}

	@Override
	public int selectByGid(int gid, String uname) {
		// TODO Auto-generated method stub
		return this.dao.selectByGid(gid, uname);
	}

	@Override
	public int addGoodToCart(int gid, String uname,int num) {
		// TODO Auto-generated method stub
		return this.dao.addGoodToCart(gid, uname, num);
	}

	@Override
	public int addGoodToOrder(String uname, int gid, int number,String trueName,String address,String phone) {
		// TODO Auto-generated method stub
		return this.dao.addGoodToOrder(uname, gid, number,trueName,address,phone);
	}

	@Override
	public int[] cleanCart(String uname, int gid, int number) {
		// TODO Auto-generated method stub
		return this.dao.cleanCart(uname, gid, number);
	}

	@Override
	public List<String> selectOrderByName(String uname) {
		// TODO Auto-generated method stub
		return this.dao.selectOrderByName(uname);
	}

	@Override
	public List<Middle> selectAllOrder() {
		// TODO Auto-generated method stub
		return this.dao.selectAllOrder();
	}

	@Override
	public int DeleteOrderByOid(int oid) {
		// TODO Auto-generated method stub
		return this.dao.DeleteOrderByOid(oid);
	}

	@Override
	public int UpdateStatusByOid(int oid) {
		// TODO Auto-generated method stub
		return this.dao.UpdateStatusByOid(oid);
	}

	@Override
	public List<Middle> turnPages(int pageNumber, int pageSize) throws SQLException {
		// TODO Auto-generated method stub
		return this.dao.turnPages(pageNumber, pageSize);
	}

	@Override
	public int DeleteGoodByGid(int gid) {
		// TODO Auto-generated method stub
		return this.dao.DeleteGoodByGid(gid);
	}

}
