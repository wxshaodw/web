package com.csxy.gggl.Dao;

import java.util.List;

import com.csxy.gggl.domain.Notive;

public interface Notive_Dao<T> {
	
	/**
	 *��ȡ���й���
	 *@return ��ȡ����б�
    **/
	public abstract List<T> getNotive(String sql);
	
	/**
	 * ͨ��������ѯ
	 * @return ��ȡ����б�**/
	public abstract T getNotivebycondition(String sql,Object...args);
	
	/**
	 * ����¹���
	 * **/
	public abstract boolean insertNotive(String sql,Object...args);
	
	/**
	 * �޸Ĺ���**/
	public abstract boolean updateNotive(String sql,Object...args);
	
	/**
	 * ɾ������**/
	public abstract boolean delectNotive(String sql,Object...args);
	
	

}
