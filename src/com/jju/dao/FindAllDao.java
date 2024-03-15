package com.jju.dao;

import java.sql.SQLException;
import java.util.List;

import com.jju.bean.Category;
import com.jju.bean.Good;
import com.jju.bean.GoodView;
import com.jju.bean.Type;

public interface FindAllDao {
	//��ѯ�������
	public List<Category> findAll();
	//��ѯ��������
	public List<Type> findAllType();
	//��ѯ������Ʒ
	public List<Good> findAllGoods();
	//��ѯ��Ʒ����gid����
	public Good findGoodByGid(String gid);
	//��ѯ16����Ʒ��¼
	public List<Good> findPartGoods();
	//������ѯ
	public int  selectCidByString(String str);
	//
	public List<GoodView> turnPages(int pageNumber, int pageSize) throws SQLException ;
	//��ѯ����е���Ʒ����
	public int queryNumberByCid(int cid);
	//�����Ʒ
	public int insertGood(String gname,int number,String gphoto,double price,int cid,int tid);
	//��ѯ��Ʒ����gid����
	public GoodView findGoodViewByGid(String gid);
	//��ѯ��Ʒ����gid����
	public List<GoodView> findAllGoodViewByGid();
}
