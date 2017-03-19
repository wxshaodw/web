package com.csxy.gggl.service;

import com.csxy.gggl.Dao.User_Dao;
import com.csxy.gggl.Dao.impl.User_Dao_impl;
import com.csxy.gggl.domain.User;

public class User_service {
	
	private User_Dao user_dao=new User_Dao_impl();
	
	public boolean register(User new_user){
		return user_dao.register(new_user);
	}
	
	public User login(String username ,String password){
		User user=user_dao.get_User(username);
		if(!password.equals(user.getU_password())){
			user=null;
		}
		return user;
		
	}
}
