package com.jju.dao;

import java.sql.SQLException;
import java.util.List;

import com.jju.bean.Category;
import com.jju.bean.Good;
import com.jju.bean.GoodView;
import com.jju.bean.Type;

public interface FindAllDao {
	//查询所有类别
	public List<Category> findAll();
	//查询所有类型
	public List<Type> findAllType();
	//查询所有商品
	public List<Good> findAllGoods();
	//查询商品根据gid来查
	public Good findGoodByGid(String gid);
	//查询16条商品记录
	public List<Good> findPartGoods();
	//搜索查询
	public int  selectCidByString(String str);
	//
	public List<GoodView> turnPages(int pageNumber, int pageSize) throws SQLException ;
	//查询类别中的商品数量
	public int queryNumberByCid(int cid);
	//添加商品
	public int insertGood(String gname,int number,String gphoto,double price,int cid,int tid);
	//查询商品根据gid来查
	public GoodView findGoodViewByGid(String gid);
	//查询商品根据gid来查
	public List<GoodView> findAllGoodViewByGid();
}
