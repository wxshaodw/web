package com.csxy.gggl.Dao;

import java.util.List;

import com.csxy.gggl.domain.Notive;
import com.csxy.gggl.web.Condition;

public interface Notive_Dao {
	
	/**
	 *��ȡ���й���
	 *@return ��ȡ����б�
    **/
	public abstract List<Notive> getNotive();
	
	/**
	 * ͨ��������ѯ
	 * @return ��ȡ����б�**/
	public abstract List<Notive> getNotivebycondition(Condition condition);
	
	/**
	 * ����¹���
	 * **/
	public abstract boolean releaseNotive(Notive new_notive);
	
	/**
	 * �޸Ĺ���**/
	public abstract boolean updateNotive(Notive new_notive);
	
	/**
	 * ɾ������**/
	public abstract boolean delectNotive(int id);
	
	

}
