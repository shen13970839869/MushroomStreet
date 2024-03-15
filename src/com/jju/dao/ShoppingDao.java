package com.jju.dao;

import java.sql.SQLException;
import java.util.List;

import com.jju.bean.Middle;

public interface ShoppingDao {
	//��ӹ��ﳵ1
	public int addGoodToCart1(int gid,String uname,int number);
	//��ӹ��ﳵ2
	public int addGoodToCart(int gid,String uname,int num);
	//�����û��鹺�ﳵ��¼��
	public int selectCountByName(String uname);
	//�����û��鹺�ﳵ��Ʒid
	public List<String> selectGidByUname(String uname);
	//����gid�鹺�ﳵ��¼ 
	public int selectByGid(int gid,String uname);
	//�����Ʒ���������ݿ���
	public int addGoodToOrder(String uname,int gid,int number,String trueName,String address,String phone);
	//ɾ�����ﳵ�����û�  ��ɾ��good���е�number
	public int[] cleanCart(String uname,int gid,int number);
	//�����û��鶩����¼
	public List<String> selectOrderByName(String uname);
	//�����û��鶩������
	public List<Middle> selectAllOrder();
	//���ݶ������ɾ������
	public int DeleteOrderByOid(int oid);
	//���ݶ�����Ÿ���status
	public int UpdateStatusByOid(int oid);
	//��ҳ
	public List<Middle> turnPages(int pageNumber, int pageSize) throws SQLException;
	//����Gidɾ����Ʒ
	public int DeleteGoodByGid(int gid) ;
}
