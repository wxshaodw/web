package com.csxy.gggl.Dao.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.csxy.gggl.Dao.Notive_Dao;
import com.csxy.gggl.domain.Notive;
import com.csxy.gggl.utils.conversion_utils;
import com.csxy.gggl.utils.run_state_Utils;
import com.csxy.gggl.web.Condition;
import com.csxy.gggl.web.Page;

public class Notive_Dao_impl extends BaseDao<Notive> implements Notive_Dao{

	@Override
	public List<Notive> getNotive() {
		String sql="select * from Notive";
		return queryforList(sql);
		// TODO Auto-generated method stub 
	}

	@Override
	public List<Notive> getNotivebycondition(String condition,int page_no) {
		String sql="select * from Notive";
		sql=sql+condition+"limit ?,?";
		// TODO Auto-generated method stub
		return queryforList(sql,(page_no-1)*Page.getPageSize(),Page.getPageSize());
	}

	@Override
	public int releaseNotive(Notive new_notive) {
		String sql="insert into notive(N_author, N_title,N_type,N_state,N_top,N_release_time,N_begin_time,N_end_time,N_context,N_run_state) values"+"(?,?,?,?,?,?,?,?,?,?)";
		int notive_id=insert(sql,new_notive.getN_author(),new_notive.getN_title(),new_notive.getN_type(),new_notive.getN_state(),new_notive.getN_top(),new_notive.getN_release_time(),new_notive.getN_begin_time(),new_notive.getN_end_time(),new_notive.getN_context(),new_notive.getN_run_state());
		new_notive.setN_id(notive_id);// TODO Auto-generated method stub
		return new_notive.getN_id();
	}

	@Override
	public boolean updateNotive(Notive notive) {
		String sql="update Notive set N_author=?,N_title=?,N_type=?,N_state=?,N_top=?,N_release_time=?,N_begin_time=?,N_end_time=?,N_context=?,N_run_state=? where N_id=?";// TODO Auto-generated method stub
		return update(sql, notive.getN_author(),notive.getN_title(),notive.getN_type(),notive.getN_state(),notive.getN_top(),notive.getN_release_time(),notive.getN_begin_time(),notive.getN_end_time(),notive.getN_context(),notive.getN_run_state(),notive.getN_id());
	}

	@Override
	public boolean delectNotive(int id) {
		String sql="delete from notive where N_id=?";
		return delect(sql, id);
		// TODO Auto-generated method stub
	}

	@Override
	public List<Notive> queryforpage(int page_no) {
		String sql="select * from notive limit ?,?";
		// TODO Auto-generated method stub
		return queryforList(sql,(page_no-1)*Page.getPageSize(),Page.getPageSize());
	}

	@Override
	public int Count_Notive() {
		String sql="select count(*)from notive ";
		// TODO Auto-generated method stub
		return Countfordate(sql);
	}

	@Override
	public int Count_Notive(String condition) {
		String sql="select count(*) from Notive";
		sql=sql+condition;
		// TODO Auto-generated method stub
		return Countfordate(sql);
	}

	@Override
	public String create_query_sql(Condition condition) {
		String condition_str=" where ";
		int condition_mun=0;
		if(!condition.getType().equals("")){
			if(condition_mun!=0)condition_str=condition_str+" and ";
			condition_str=condition_str+"N_type='"+condition.getType()+"'";
			condition_mun++;
		}
		if(!condition.getState().equals("")){
			if(condition_mun!=0)condition_str=condition_str+" and ";
			condition_str=condition_str+"N_state='"+condition.getState()+"'";
			condition_mun++;
		}
		if(!condition.getTop().equals("")){
			if(condition_mun!=0)condition_str=condition_str+" and ";
			condition_str=condition_str+"N_top='"+condition.getTop()+"'";
			condition_mun++;
		}
		if(!condition.getBegin_time().equals("")){
			if(condition_mun!=0)condition_str=condition_str+" and ";
			condition_str=condition_str+"N_begin_time >='"+condition.getBegin_time()+"'";
			condition_mun++;
			}
		if(!condition.getEnd_time().equals("")){
			if(condition_mun!=0)condition_str=condition_str+" and ";
			condition_str=condition_str+"N_end_time <='"+condition.getEnd_time()+"'";
			condition_mun++;
		}
		if(!condition.getRun_state().equals("")){
			if(condition_mun!=0)condition_str=condition_str+" and ";
			condition_str=condition_str+"N_run_state ='"+condition.getRun_state()+"'";
			condition_mun++;
		}
		if(condition_mun==0){
			condition_str="";
		}
		return condition_str;
	}


}
