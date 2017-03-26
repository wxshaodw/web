package com.csxy.gggl.Dao;

import java.util.List;

import com.csxy.gggl.domain.Notive;
import com.csxy.gggl.web.Condition;

public interface Notive_Dao {
	
	/**
	 *获取所有公告
	 *@return 获取结果列表
    **/
	public abstract List<Notive> getNotive();
	
	/**
	 * 通过条件查询
	 * @return 获取结果列表**/
	public abstract List<Notive> getNotivebycondition(Condition condition);
	
	/**
	 * 添加新公告
	 * **/
	public abstract boolean releaseNotive(Notive new_notive);
	
	/**
	 * 修改公告**/
	public abstract boolean updateNotive(Notive new_notive);
	
	/**
	 * 删除公告**/
	public abstract boolean delectNotive(int id);
	
	

}
