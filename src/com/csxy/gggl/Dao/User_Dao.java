package com.csxy.gggl.Dao;

import java.util.List;

import com.csxy.gggl.domain.Employee;
import com.csxy.gggl.domain.User;
import com.csxy.gggl.domain.Department;

public interface User_Dao {
	/**
	 * �����û�����ȡ�û���Ϣ
	 * return �û���
	 * **/
	abstract User get_User(String username);
	
	/**
	 * ��ҳ���ȡע���û�
	 * @param user��ҳ���ȡ���û���ϢBean
	 * @return 
	 * **/
	abstract boolean register(User new_user);
	
	/**
	 * ��ҳ���ȡ��Ա��
	 * @param ��ҳ���ȡ��Ա����Ϣbean
	 * @return ���Ա�����**/
	
	abstract boolean insert_Employee(Employee employee);
	
	abstract String get_last_login_time();
	
	abstract boolean update_time(String username,String time);
}
