package com.csxy.gggl.Dao.impl;

import java.util.List;

import com.csxy.gggl.Dao.User_Dao;
import com.csxy.gggl.domain.Department;
import com.csxy.gggl.domain.Employee;
import com.csxy.gggl.domain.User;

public class User_Dao_impl extends BaseDao<User> implements User_Dao{

	@Override
	public User get_User(String username) {
		String sql="select * from User where U_name=?";
		return query(sql, username);
	}

	@Override
	public boolean register(User new_user) {
		String sql="insert into User(U_name, U_password) values (?,?)";
		int user_id=insert(sql,new_user.getU_name(),new_user.getU_password());
		new_user.setU_id(user_id);
		return true;
		// TODO Auto-generated method stub		
	}

	@Override
	public boolean insert_Employee(Employee employee) {
		String sql="insert into employee(P_name,P_mobile,P_address,U_id,P_department) values (?,?)";
		//int P_id=insert(sql, employee.getP_name(),employee.getP_mobile(),employee.getP_address(),employee.getU_id(),employee.getP_department());
		//employee.setP_id(P_id);
		// TODO Auto-generated method stub
		return true;
	}

	

}
