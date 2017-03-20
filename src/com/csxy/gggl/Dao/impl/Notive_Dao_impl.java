package com.csxy.gggl.Dao.impl;

import java.util.List;

import com.csxy.gggl.Dao.Notive_Dao;
import com.csxy.gggl.domain.Notive;
import com.csxy.gggl.domain.User;

public class Notive_Dao_impl extends BaseDao<User> implements Notive_Dao{

	@Override
	public List<Notive> getNotive(String sql) {
		// TODO Auto-generated method stub
		return query(sql, null);
	}

	@Override
	public List<Notive> getNotivebycondition(String sql, Object... args) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean insertNotive(String sql, Object... args) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateNotive(String sql, Object... args) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delectNotive(String sql, Object... args) {
		// TODO Auto-generated method stub
		return false;
	}

}
