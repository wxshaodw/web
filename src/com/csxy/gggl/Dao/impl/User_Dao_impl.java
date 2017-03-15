package com.csxy.gggl.Dao.impl;

import java.sql.Connection;

import com.csxy.gggl.Dao.User_Dao;
import com.csxy.gggl.db.JDBCUtils;
import com.csxy.gggl.domain.User;

public class User_Dao_impl extends BaseDao implements User_Dao{

	@Override
	public User get_User(String username) {
		String sql="select * from User where U_name=?";
		
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean register(User new_user) {
		String sql="insert into User(U_name, U_password) values"+"(?,?)";
		long user_id=insert(sql,new_user.getUsername(),new_user.getPassword());
		new_user.setUser_id(user_id);
		return true;
		// TODO Auto-generated method stub
		
	}

}
