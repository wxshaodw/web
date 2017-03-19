package com.csxy.gggl.Dao;

import java.util.List;

import com.csxy.gggl.domain.User;

public interface User_Dao {
	/**
	 * 根据用户名获取用户信息
	 * return 用户类
	 * **/
	abstract User get_User(String username);
	
	/**
	 * 从页面获取注册用户
	 * @param User从页面获取的用户信息Bean
	 * @return 
	 * **/
	abstract boolean register(User new_user);
}
