package com.csxy.gggl.Dao;

import java.sql.Connection;

public interface Dao<T> {
	
	/**
	 * �����¼�¼
	 * @param sql��Ҫִ�е�sql���
	 * @param args��ִ��ʱ����Ҫ�Ĳ���
	 * @param return���¼�¼��id
	 **/
	long insert(String sql,Object...args);
	
	
	/**
	 * �����¼�¼
	 * @param sql��Ҫִ�е�sql���
	 * @param args��ִ��ʱ����Ҫ�Ĳ���
	 * @param return�����ش�����ݼ����б�
	 **/
	T query(String sql,Object...args);

}
