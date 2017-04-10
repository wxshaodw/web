package com.csxy.gggl.Dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.csxy.gggl.Dao.Department_Dao;
import com.csxy.gggl.domain.Department;
import com.csxy.gggl.web.ConnectionContext;

public class Department_Dao_impl extends BaseDao<Department> implements Department_Dao{

	@Override
	public List<Department> get_dept_list() {
		String sql="select * from Department";// TODO Auto-generated method stub
		return queryforList(sql);
	}

	@Override
	public void link_dept_to_notive(int N_id,int D_id) {
		String sql="insert into notive_dept values(?,?)";
		insert(sql, N_id,D_id);
		// TODO Auto-generated method stub
		
	}

	@SuppressWarnings("null")
	@Override
	public List<String> get_link_dept(int N_id) {
		String sql="select D_id from notive_dept where N_id=?";
		List<String> list = new ArrayList<String>();
		Connection connection=ConnectionContext.getinstance().get();
		PreparedStatement preparedStatement=null;
		try {
			preparedStatement=connection.prepareStatement(sql);
			preparedStatement.setObject(1, N_id);
			ResultSet rs=preparedStatement.executeQuery();
			int j=0;
			String r="";
			while(rs.next()){
				r=rs.getString("D_id");
				list.add(r);
				j++;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}// TODO Auto-generated method stub
		return list;// TODO Auto-generated method stub
	}

}
