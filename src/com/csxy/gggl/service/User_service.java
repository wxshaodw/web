package com.csxy.gggl.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.csxy.gggl.Dao.User_Dao;
import com.csxy.gggl.Dao.impl.User_Dao_impl;
import com.csxy.gggl.domain.Employee;
import com.csxy.gggl.domain.User;

public class User_service {
	
	private User_Dao user_dao=new User_Dao_impl();
	
	public boolean register(User new_user,Employee new_employee){
		user_dao.register(new_user);
		//new_employee.setU_id(new_user.getU_id());
		return user_dao.insert_Employee(new_employee);
	}
	
	public User login(String username ,String password,String type,String time){
		User user=user_dao.get_User(username);
		if(user.getU_password()!=null&&user.getU_password().equals(password)&&user.getU_type().equals(type)){
			user_dao.update_time(username, time);
			return user;
		}
		return null;
	}
	
	public Date gettime() throws ParseException{
		Date date=null;
		SimpleDateFormat df=new SimpleDateFormat("yyyy-mm-dd");
		String str=user_dao.get_last_login_time();
		return df.parse(str);
	}
}
