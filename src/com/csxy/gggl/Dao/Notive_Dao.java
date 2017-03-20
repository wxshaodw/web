package com.csxy.gggl.Dao;

import java.util.List;

import com.csxy.gggl.domain.Notive;

public interface Notive_Dao<T> {
	
	/**
	 *获取所有公告
	 *@return 获取结果列表
    **/
	public abstract List<T> getNotive(String sql);
	
	/**
	 * 通过条件查询
	 * @return 获取结果列表**/
	public abstract T getNotivebycondition(String sql,Object...args);
	
	/**
	 * 添加新公告
	 * **/
	public abstract boolean insertNotive(String sql,Object...args);
	
	/**
	 * 修改公告**/
	public abstract boolean updateNotive(String sql,Object...args);
	
	/**
	 * 删除公告**/
	public abstract boolean delectNotive(String sql,Object...args);
	
	

}
