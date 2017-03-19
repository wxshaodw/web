package com.csxy.gggl.test;

import java.sql.Connection;

import com.csxy.gggl.Dao.User_Dao;
import com.csxy.gggl.Dao.impl.User_Dao_impl;
import com.csxy.gggl.db.JDBCUtils;
import com.csxy.gggl.domain.User;

public class UserDao_test {
	
	static void test_register(){
		User a= new User();
		a.setU_name("123");
		a.setU_password("456");
		User_Dao t1=new User_Dao_impl();
		t1.register(a);
	}
	public static void main(String[] args) {
		UserDao_test.test_register();// TODO Auto-generated method stub
	}

}
