package com.csxy.gggl.Dao;

import java.util.List;

import com.csxy.gggl.domain.Employee;

public interface Employee_Dao {
	
	/**
	 * 添加新员工
	 * @return新员工编号**/
	public int insert_employee(Employee employee);
	
	/**
	 * 建立公告与员工关系
	 * **/
	public boolean link_employee_to_notive(int N_id,String P_id,String read_state);
	
	/**返回员工列表**/
	public List<Employee> get_employee_list();
	
	/**根据用户号获取员工信息**/
	public Employee getemployee(String User);
	
	/**
	 * 返回与公告相关的员工数组**/
	public List<String> get_link_employee(int N_id);
	
	/**
	 * 根据部门号获取员工列表**/
	public List<Employee>get_employee_list(int D_id);
	
	/**
	 * 返回与公告相关的员工列表**/
	public List<Employee> get_select_employee(int N_id);
}
