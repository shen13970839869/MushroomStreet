package com.jju.dao;

import java.sql.SQLException;
import java.util.List;

import com.jju.bean.Middle;

public interface ShoppingDao {
	//添加购物车1
	public int addGoodToCart1(int gid,String uname,int number);
	//添加购物车2
	public int addGoodToCart(int gid,String uname,int num);
	//根据用户查购物车记录数
	public int selectCountByName(String uname);
	//根据用户查购物车商品id
	public List<String> selectGidByUname(String uname);
	//根据gid查购物车记录 
	public int selectByGid(int gid,String uname);
	//添加商品到订单数据库中
	public int addGoodToOrder(String uname,int gid,int number,String trueName,String address,String phone);
	//删除购物车根据用户  并删除good表中的number
	public int[] cleanCart(String uname,int gid,int number);
	//根据用户查订单记录
	public List<String> selectOrderByName(String uname);
	//根据用户查订单详情
	public List<Middle> selectAllOrder();
	//根据订单编号删除订单
	public int DeleteOrderByOid(int oid);
	//根据订单编号更新status
	public int UpdateStatusByOid(int oid);
	//分页
	public List<Middle> turnPages(int pageNumber, int pageSize) throws SQLException;
	//根据Gid删除商品
	public int DeleteGoodByGid(int gid) ;
}
