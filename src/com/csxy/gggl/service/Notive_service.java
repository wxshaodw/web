package com.csxy.gggl.service;

import java.util.List;

import com.csxy.gggl.Dao.Notive_Dao;
import com.csxy.gggl.Dao.impl.Notive_Dao_impl;
import com.csxy.gggl.domain.Notive;
import com.csxy.gggl.web.Condition;
import com.csxy.gggl.web.Page;

public class Notive_service {
	private static Notive_Dao notive_Dao=new Notive_Dao_impl();

	public boolean release(Notive new_notive){
		return notive_Dao.releaseNotive(new_notive);
	}
	
	public List<Notive> getNotive(){
		return notive_Dao.getNotive();
	}
	
	public Page<Notive> getPage(List<Notive> list){
		Page<Notive> page=new Page<Notive>(1);
		page.setList(list);
		page.setTotalItemNumber(list.size());
		return page;
	}
	
	public boolean delect_Notive(int N_id){
		return notive_Dao.delectNotive(N_id);
	}
	
	public List<Notive> getNotivebycondition(Condition condition){
		return notive_Dao.getNotivebycondition(condition);
	}
}
