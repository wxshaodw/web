package com.csxy.gggl.Dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.csxy.gggl.Dao.User_Dao;
import com.csxy.gggl.db.JDBCUtils;
import com.csxy.gggl.domain.User;

public class User_Dao_impl extends BaseDao<User> implements User_Dao{

	@Override
	public User get_User(String username) {
		String sql="select * from User where U_name=?";
		return query(sql, username);
	}

	@Override
	public boolean register(User new_user) {
		String sql="insert into User(U_name, U_password) values"+"(?,?)";
		int user_id=insert(sql,new_user.getU_name(),new_user.getU_password());
		new_user.setU_id(user_id);
		return true;
		// TODO Auto-generated method stub
		
	}

}
