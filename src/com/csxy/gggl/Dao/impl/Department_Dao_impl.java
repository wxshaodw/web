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

	

}
