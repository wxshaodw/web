package com.csxy.gggl.web;

import java.util.List;

import com.csxy.gggl.domain.Department;
import com.csxy.gggl.domain.Employee;

public class normal_Dept extends Department{
	private List<Employee> employee_list;

	public List<Employee> getEmployee_list() {
		return employee_list;
	}

	public void setEmployee_list(List<Employee> employee_list) {
		this.employee_list = employee_list;
	}
	
}
