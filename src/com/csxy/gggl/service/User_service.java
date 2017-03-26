package com.csxy.gggl.service;

import com.csxy.gggl.Dao.User_Dao;
import com.csxy.gggl.Dao.impl.User_Dao_impl;
import com.csxy.gggl.domain.Employee;
import com.csxy.gggl.domain.User;

public class User_service {
	
	private User_Dao user_dao=new User_Dao_impl();
	
	public boolean register(User new_user,Employee new_employee){
		user_dao.register(new_user);
		new_employee.setU_id(new_user.getU_id());
		return user_dao.insert_Employee(new_employee);
	}
	
	public User login(String username ,String password){
		User user=user_dao.get_User(username);
		if(!password.equals(user.getU_password())){
			user=null;
		}
		return user;
		
	}
}
