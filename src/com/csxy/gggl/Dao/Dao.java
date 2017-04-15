package com.csxy.gggl.Dao;

import java.util.List;

public interface Dao<T> {
	
	/**
	 * �����¼�¼
	 * @param sql��Ҫִ�е�sql���
	 * @param args��ִ��ʱ����Ҫ�Ĳ���
	 * @param return���¼�¼��id
	 **/
	int insert(String sql,Object...args);
	
	
	/**
	 * �����¼�¼
	 * @param sql��Ҫִ�е�sql���
	 * @param args��ִ��ʱ����Ҫ�Ĳ���
	 * @param return�����ش�����ݼ����б�
	 **/
	T query(String sql,Object...args);
	
	
	/**
	 * ɾ����¼
	 * @param sql��Ҫִ�е�sql���
	 * @param args:ִ��ʱ����Ĳ���
	 * @param return���Ƿ�ɹ�ɾ����¼
	 **/
	boolean delect(String sql,Object...args);

	/**
	 * ���¼�¼
	 * @param sql��Ҫִ�е�sql���
	 * @param args��ִ��ʱ����Ĳ���
	 * @param return�����º�����ݼ�**/
	boolean update(String sql,Object...args);
	
	/**
	 *���Ҽ�¼�������б� **/
	List<T> queryforList(String sql,Object...args);
	
	/**
	 * ��������������**/
	int Countfordate(String sql,Object...args);
}
