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
	public abstract List<Notive> getNotivebycondition(String condition,int page);
	
	/**
	 * ����¹���
	 * **/
	public abstract int releaseNotive(Notive new_notive);
	
	/**
	 * �޸Ĺ���**/
	public abstract boolean updateNotive(Notive notive);
	
	/**
	 * ɾ������**/
	public abstract boolean delectNotive(int id);
	
	/**
	 * ��Ҳ��ѯ
	 * ��ѯ��ҳ��**/
	public abstract List<Notive> queryforpage(int page_no);
	
	/**
	 * ��ȡ��������**/
	public abstract int Count_Notive();
	
	/**
	 * ��ȡ��������**/
	public abstract int Count_Notive(String condition);
	
	/**
	 * ���ɲ�ѯsql���**/
	public abstract String create_query_sql(Condition condition);
}
