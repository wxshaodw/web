package com.csxy.gggl.service;

import java.util.ArrayList;
import java.util.List;

import com.csxy.gggl.Dao.Department_Dao;
import com.csxy.gggl.Dao.Employee_Dao;
import com.csxy.gggl.Dao.impl.Department_Dao_impl;
import com.csxy.gggl.Dao.impl.Employee_Dao_impl;
import com.csxy.gggl.domain.Department;
import com.csxy.gggl.domain.Employee;
import com.csxy.gggl.web.normal_Dept;

public class Employee_service {
	Employee_Dao employee_Dao=new Employee_Dao_impl();
	Department_Dao department_Dao=new Department_Dao_impl();
	
	public List<Employee> get_employeelist(){
		return employee_Dao.get_employee_list();
		
	}
	
	public Employee get_employee(int user) {
		return employee_Dao.getemployee(user);
	}
	
	public List<normal_Dept> get_Dept(){
		List<normal_Dept> list=new ArrayList<normal_Dept>();
		List<Department> D_list=department_Dao.get_dept_list();
		for(int i=0;i<D_list.size();i++){
			normal_Dept dept=new normal_Dept();
			dept.setD_id(D_list.get(i).getD_id());
			dept.setD_name(D_list.get(i).getD_name());
			dept.setD_amount(D_list.get(i).getD_amount());
			dept.setEmployee_list(employee_Dao.get_employee_list(dept.getD_id()));
			list.add(dept);
		}
		return list;
		
	}
	
}
