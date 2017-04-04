package com.csxy.gggl.Dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.csxy.gggl.Dao.Dao;
import com.csxy.gggl.db.JDBCUtils;
import com.csxy.gggl.utils.ReflectionUtils;
import com.csxy.gggl.web.ConnectionContext;

public class BaseDao<T> implements Dao<T>{
	
	Class<T> clazz=null;
	
	QueryRunner runner=new QueryRunner();
	
	
	public BaseDao(){
		clazz=ReflectionUtils.getSuperGenericType(getClass());
	}

	@Override
	public int insert(String sql, Object... args) {
		int id=0;
		Connection connection=null;
		PreparedStatement prepareStatement=null;
		ResultSet resultSet=null;
		
		try{
			connection= ConnectionContext.getinstance().get();
			prepareStatement=connection.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			
			if(args!=null){
				for(int i=0;i<args.length;i++){
					prepareStatement.setObject(i+1, args[i]);
					System.out.println(args[i]);
				}
			}
			
			prepareStatement.executeUpdate();
			
			resultSet= prepareStatement.getGeneratedKeys();
			if(resultSet.next()){
				id= resultSet.getInt(1);
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
		
		Connection connection=ConnectionContext.getinstance().get();	
		try {
			return runner.query(connection, sql, new BeanHandler<T>(clazz), args);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean delect(String sql, Object... args) {
		boolean r=false;
		Connection connection=ConnectionContext.getinstance().get();
		PreparedStatement preparedStatement=null;
		 try {
			 preparedStatement=connection.prepareStatement(sql);
			 if(args!=null){
				 for(int i=0;i<args.length;i++){
					 preparedStatement.setObject(i+1, args[i]);
				 }
			 }

				r=preparedStatement.execute();
				r=true;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		// TODO Auto-generated method stub
		return r;
	}

	@Override
	public boolean update(String sql,Object...args) {
		boolean r=false;
		Connection connection=ConnectionContext.getinstance().get();
		PreparedStatement preparedStatement=null;
		
		try {
			preparedStatement=connection.prepareStatement(sql);
			if(args!=null){
				for(int i=0;i<args.length;i++){
					preparedStatement.setObject(i+1, args[i]);
				}
			}
			if(preparedStatement.executeUpdate()>0)r=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// TODO Auto-generated method stub
		return r;
	}

	@Override
	public List<T> queryforList(String sql,Object...args) {
		Connection connection=ConnectionContext.getinstance().get();
		// TODO Auto-generated method stub
		try {
			return runner.query(connection, sql, new BeanListHandler<>(clazz),args);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int Countfordate(String sql) {
		int sum=0;
		Connection connection=ConnectionContext.getinstance().get();
		PreparedStatement preparedStatement=null;
		ResultSet rs=null;
		try {
			preparedStatement=connection.prepareStatement(sql);
			rs=preparedStatement.executeQuery();
			rs.next();
			sum=rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
// TODO Auto-generated method stub
		return sum;
	}
	
}
