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
	 * ��ȡ��������**/
	public abstract int Count_Notive(String P_id,String read_state);
	
	/**
	 * ��ȡ��������**/
	public abstract int Count_Notivebyid(String P_id);
	
	/**
	 * ���ɲ�ѯsql���**/
	public abstract String create_query_sql(Condition condition);
	
	/**
	 * ���ɲ�ѯsql���**/
	public abstract String create_query_sqlbyuser(Condition condition);
	
	/**
	 * ����״̬��ѯ����
	 * @Param P_id:�û�id
	 * @Param read_state
	 * **/
	public abstract List<Notive> getNotivebyread_state(String P_id,String read_state,int page_no);
	
	/**
	 * ��ȡһ���û���ع���
	 * @param P_id:�û�id
	 * @param page_no:ҳ��**/
	public abstract List<Notive> getNotivebyUser_id(String P_id,int page_no);
	
	/**����Ա��ȡ����˹���
	 * @param page_no:ҳ��**/
	public abstract List<Notive> get_audit_Notive(int page_no);
	
	/**
	 * ��ȡ����˹�������**/
	public abstract int Count_audit_Notive();
	
	/**
	 * ͨ��������ѯ
	 * @return ��ȡ����б�**/
	public abstract List<Notive> getNotivebycondition(String P_id,String condition,int page_no);
	
	/**
	 * ��ȡ��������**/
	public abstract int Count_Notivebycondition(String P_id,String condition);
	
	/**
	 * ��˹���**/
	public abstract boolean Notive_audit(int N_id,String N_state);
	
	/**����Ѷ�**/
	public abstract boolean Notive_read(int N_id,String P_id,String readstate);
	
	/**
	 * ���ݹ�����ɾ����ϵ**/
	public abstract Boolean Notive_link_delect(int N_id);
	
	/**��ȡͨ����˵Ĺ����б�**/
	public abstract List<Notive> getlisttoupdate_state();
	
	/**
	 * �޸�״̬**/
	public abstract void update_state(int N_id,String state);
	
	public abstract List<Notive> query_all(String condition);
	
	public abstract List<Notive> query_all(String P_id ,String condition);
	
	public abstract Notive get_a_Noitve(int N_id);
}
