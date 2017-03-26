package com.csxy.gggl.Dao.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.csxy.gggl.Dao.Notive_Dao;
import com.csxy.gggl.domain.Notive;
import com.csxy.gggl.utils.run_state_Utils;
import com.csxy.gggl.web.Condition;

public class Notive_Dao_impl extends BaseDao<Notive> implements Notive_Dao{

	@Override
	public List<Notive> getNotive() {
		String sql="select * from Notive";
		return queryforList(sql);
		// TODO Auto-generated method stub 
	}

	@Override
	public List<Notive> getNotivebycondition(Condition condition) {
		String sql="select * from Notive";
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
		if(condition_mun!=0){
			sql=sql+condition_str;
		}
		// TODO Auto-generated method stub
		System.out.println(sql);
		return queryforList(sql);
	}

	@Override
	public boolean releaseNotive(Notive new_notive) {
		String sql="insert into notive(N_author, N_title,N_type,N_state,N_top,N_release_time,N_begin_time,N_end_time,N_context,N_run_state) values"+"(?,?,?,?,?,?,?,?,?,?)";
		int notive_id=insert(sql,new_notive.getN_author(),new_notive.getN_title(),new_notive.getN_type(),new_notive.getN_state(),new_notive.getN_top(),new_notive.getN_reseales_time(),new_notive.getN_begin_time(),new_notive.getN_end_time(),new_notive.getN_context(),new_notive.getN_run_state());
		new_notive.setN_id(notive_id);// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean updateNotive(Notive new_notive) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delectNotive(int id) {
		String sql="delete from notive where N_id=?";
		return delect(sql, id);
		// TODO Auto-generated method stub
	}


}
