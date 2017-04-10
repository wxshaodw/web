package com.csxy.gggl.service;

import java.util.List;

import com.csxy.gggl.Dao.Department_Dao;
import com.csxy.gggl.Dao.impl.Department_Dao_impl;
import com.csxy.gggl.domain.Department;

public class Department_service {
	Department_Dao department_Dao=new Department_Dao_impl();
	
	public List<Department> get_dept_list(){
		return department_Dao.get_dept_list();
	}
}
