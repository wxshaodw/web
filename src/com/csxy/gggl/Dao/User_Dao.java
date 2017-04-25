package com.csxy.gggl.Dao;

import java.util.List;

import com.csxy.gggl.domain.Employee;
import com.csxy.gggl.domain.User;
import com.csxy.gggl.domain.Department;

public interface User_Dao {
	/**
	 * 根据用户名获取用户信息
	 * return 用户类
	 * **/
	abstract User get_User(String username);
	
	/**
	 * 从页面获取注册用户
	 * @param user从页面获取的用户信息Bean
	 * @return 
	 * **/
	abstract boolean register(User new_user);
	
	/**
	 * 从页面获取的员工
	 * @param 从页面获取的员工信息bean
	 * @return 添加员工结果**/
	
	abstract boolean insert_Employee(Employee employee);
	
	abstract String get_last_login_time();
	
	abstract boolean update_time(String username,String time);
}
