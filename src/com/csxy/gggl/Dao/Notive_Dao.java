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
	public abstract List<Notive> getNotivebycondition(String condition,int page);
	
	/**
	 * 添加新公告
	 * **/
	public abstract int releaseNotive(Notive new_notive);
	
	/**
	 * 修改公告**/
	public abstract boolean updateNotive(Notive notive);
	
	/**
	 * 删除公告**/
	public abstract boolean delectNotive(int id);
	
	/**
	 * 按也查询
	 * 查询的页号**/
	public abstract List<Notive> queryforpage(int page_no);
	
	/**
	 * 获取公告数量**/
	public abstract int Count_Notive();
	
	/**
	 * 获取公告数量**/
	public abstract int Count_Notive(String condition);
	
	/**
	 * 生成查询sql语句**/
	public abstract String create_query_sql(Condition condition);
}
