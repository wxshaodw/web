package com.csxy.gggl.Dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.csxy.gggl.Dao.Dao;
import com.csxy.gggl.db.JDBCUtils;
import com.csxy.gggl.web.ConnectionContext;

public class BaseDao<T> implements Dao<T>{

	@Override
	public long insert(String sql, Object... args) {
		long id=0;
		Connection connection=null;
		PreparedStatement prepareStatement=null;
		ResultSet resultSet=null;
		
		try{
			connection= ConnectionContext.getinstance().get();
			prepareStatement=connection.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			
			if(args!=null){
				for(int i=0;i<args.length;i++){
					prepareStatement.setObject(i+1, args[i]);
				}
			}
			
			prepareStatement.executeUpdate();
			
			resultSet= prepareStatement.getGeneratedKeys();
			if(resultSet.next()){
				id= resultSet.getLong(1);
			}
		} catch(Exception e){
			e.printStackTrace();
		} finally{
			JDBCUtils.release(resultSet, prepareStatement);
		}
		
		return id;
	}

	@Override
	public T query(String sql, Object... args) {
		Connection connection=null;
		List<>
		try{
			
		}// TODO Auto-generated method stub
		return null;
	}
	
}
