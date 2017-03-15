package com.csxy.gggl.Dao;

public interface Dao<T> {
	
	/**
	 * 插入新记录
	 * @param sql：要执行的sql语句
	 * @param args：执行时所需要的参数
	 * @param return：新记录的id
	 **/
	long insert(String sql,Object...args);
}
