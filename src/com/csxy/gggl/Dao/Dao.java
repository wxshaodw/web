package com.csxy.gggl.Dao;

import java.sql.ResultSet;
import java.util.List;

import com.csxy.gggl.domain.User;

public interface Dao<T> {
	
	/**
	 * 插入新记录
	 * @param sql：要执行的sql语句
	 * @param args：执行时所需要的参数
	 * @param return：新记录的id
	 **/
	int insert(String sql,Object...args);
	
	
	/**
	 * 插入新记录
	 * @param sql：要执行的sql语句
	 * @param args：执行时所需要的参数
	 * @param return：返回存放数据集的列表
	 **/
	T query(String sql,Object...args);
	
	
	/**
	 * 删除记录
	 * @param sql：要执行的sql语句
	 * @param args:执行时所需的参数
	 * @param return：是否成功删除记录
	 **/
	boolean delect(String sql,Object...args);

	/**
	 * 更新记录
	 * @param sql：要执行的sql语句
	 * @param args：执行时所需的参数
	 * @param return：更新后的数据集**/
	T update();
}
