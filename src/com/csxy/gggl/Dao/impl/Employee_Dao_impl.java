package com.csxy.gggl.Dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.csxy.gggl.Dao.Employee_Dao;
import com.csxy.gggl.domain.Employee;
import com.csxy.gggl.web.ConnectionContext;

public class Employee_Dao_impl extends BaseDao<Employee> implements Employee_Dao {

	@Override
	public int insert_employee(Employee employee) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean link_employee_to_notive(int N_id,int P_id) {
		String sql="insert into notive_employee values(?,?)";
		System.out.println(P_id);
		insert(sql, N_id,P_id);// TODO Auto-generated method stub
		return true;
	}

	@Override
	public List<Employee> get_employee_list() {
		String sql="select * from employee";
		// TODO Auto-generated method stub
		return queryforList(sql);
	}

	@Override
	public Employee getemployee(int user) {
		String sql="select * from Employee where P_id= ?";// TODO Auto-generated method stub
		return query(sql, user);
	}

	@Override
	public List<String> get_link_employee(int N_id) {
		String sql="select P_id from notive_employee where N_id=?";
		List<String> list = new ArrayList<String>();
		Connection connection=ConnectionContext.getinstance().get();
		PreparedStatement preparedStatement=null;
		try {
			preparedStatement=connection.prepareStatement(sql);
			preparedStatement.setObject(1, N_id);
			ResultSet rs=preparedStatement.executeQuery();
			int i=0;
			String r="";
			while(rs.next()){
				r=rs.getString("P_id");
				list.add(r);
				i++;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}// TODO Auto-generated method stub
		return list;
	}

}
