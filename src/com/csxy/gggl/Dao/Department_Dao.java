package com.csxy.gggl.Dao;

import java.util.List;
import com.csxy.gggl.domain.Department;

public interface Department_Dao {
	
	/**
	 * 返回部门列表**/
	public List<Department> get_dept_list();
	
	/**
	 * 连接公告和部门**/
	public void link_dept_to_notive(int N_id,int D_id);
	
	/**
	 * 获取相关部门**/
	public List<String> get_link_dept(int N_id);
}
