package com.csxy.gggl.Dao;

public interface Dao<T> {
	
	/**
	 * �����¼�¼
	 * @param sql��Ҫִ�е�sql���
	 * @param args��ִ��ʱ����Ҫ�Ĳ���
	 * @param return���¼�¼��id
	 **/
	long insert(String sql,Object...args);
}
