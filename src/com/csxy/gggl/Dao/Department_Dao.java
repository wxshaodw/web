package com.csxy.gggl.Dao;

import java.util.List;
import com.csxy.gggl.domain.Department;

public interface Department_Dao {
	
	/**
	 * ���ز����б�**/
	public List<Department> get_dept_list();
	
	/**
	 * ���ӹ���Ͳ���**/
	public void link_dept_to_notive(int N_id,int D_id);
	
	/**
	 * ��ȡ��ز���**/
	public List<String> get_link_dept(int N_id);
}
