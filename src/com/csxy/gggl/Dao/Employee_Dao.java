package com.csxy.gggl.Dao;

import java.util.List;

import com.csxy.gggl.domain.Employee;

public interface Employee_Dao {
	
	/**
	 * �����Ա��
	 * @return��Ա�����**/
	public int insert_employee(Employee employee);
	
	/**
	 * ����������Ա����ϵ
	 * **/
	public boolean link_employee_to_notive(int N_id,int P_id,String read_state);
	
	/**����Ա���б�**/
	public List<Employee> get_employee_list();
	
	/**�����û��Ż�ȡԱ����Ϣ**/
	public Employee getemployee(int User);
	
	/**
	 * �����빫����ص�Ա������**/
	public List<String> get_link_employee(int N_id);
}
