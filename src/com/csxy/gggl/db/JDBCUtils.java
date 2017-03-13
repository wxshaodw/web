package com.csxy.gggl.db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class JDBCUtils {
	private static DataSource dataSource=null;
	
	static{
		dataSource=new ComboPooledDataSource("javawebapp");
	}
	//获取数据库连接
	public static Connection getConnection(){
			try {
				return dataSource.getConnection();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return null;
			}
	}
	
	//关闭数据库
	public static void release(Connection connection){
		try{
			if(connection!=null){
				connection.close();
			}
		} catch(SQLException e){
			e.printStackTrace();
		}
		
	}
	
	//关闭数据库连接
	public static void release(ResultSet rs, Statement statement){
		try{
			if(rs!=null){
				rs.close();
			}
		} catch(SQLException e){
			e.printStackTrace();
		}
		
		try{
			if(statement!=null){
				statement.close();
			}
		} catch(SQLException e){
			e.printStackTrace();
		}
	}
}
