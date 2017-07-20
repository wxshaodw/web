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
	 * 获取公告数量**/
	public abstract int Count_Notive(String P_id,String read_state);
	
	/**
	 * 获取公告数量**/
	public abstract int Count_Notivebyid(String P_id);
	
	/**
	 * 生成查询sql语句**/
	public abstract String create_query_sql(Condition condition);
	
	/**
	 * 生成查询sql语句**/
	public abstract String create_query_sqlbyuser(Condition condition);
	
	/**
	 * 根据状态查询公告
	 * @Param P_id:用户id
	 * @Param read_state
	 * **/
	public abstract List<Notive> getNotivebyread_state(String P_id,String read_state,int page_no);
	
	/**
	 * 获取一般用户相关公告
	 * @param P_id:用户id
	 * @param page_no:页号**/
	public abstract List<Notive> getNotivebyUser_id(String P_id,int page_no);
	
	/**管理员获取已审核公告
	 * @param page_no:页号**/
	public abstract List<Notive> get_audit_Notive(int page_no);
	
	/**
	 * 获取已审核公告数量**/
	public abstract int Count_audit_Notive();
	
	/**
	 * 通过条件查询
	 * @return 获取结果列表**/
	public abstract List<Notive> getNotivebycondition(String P_id,String condition,int page_no);
	
	/**
	 * 获取公告数量**/
	public abstract int Count_Notivebycondition(String P_id,String condition);
	
	/**
	 * 审核公告**/
	public abstract boolean Notive_audit(int N_id,String N_state);
	
	/**标记已读**/
	public abstract boolean Notive_read(int N_id,String P_id,String readstate);
	
	/**
	 * 根据公告编号删除关系**/
	public abstract Boolean Notive_link_delect(int N_id);
	
	/**获取通过审核的公告列表**/
	public abstract List<Notive> getlisttoupdate_state();
	
	/**
	 * 修改状态**/
	public abstract void update_state(int N_id,String state);
	
	public abstract List<Notive> query_all(String condition);
	
	public abstract List<Notive> query_all(String P_id ,String condition);
	
	public abstract Notive get_a_Noitve(int N_id);
}
