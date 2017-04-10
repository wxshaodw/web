package com.csxy.gggl.service;

import java.util.List;

import com.csxy.gggl.Dao.Employee_Dao;
import com.csxy.gggl.Dao.impl.Employee_Dao_impl;
import com.csxy.gggl.domain.Employee;

public class Employee_service {
	Employee_Dao employee_Dao=new Employee_Dao_impl();
	
	public List<Employee> get_employeelist(){
		return employee_Dao.get_employee_list();
		
	}
	
	public Employee get_employee(int user) {
		return employee_Dao.getemployee(user);
	}
}
