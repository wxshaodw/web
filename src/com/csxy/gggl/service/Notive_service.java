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
	
	public List<Notive> getPagedate(int page_no){
		return notive_Dao.queryforpage(page_no);
	}
	
	public Page<Notive> createPage(List<Notive> list,int Page_no){
		int sum=0;
		Page<Notive> page=new Page<Notive>(Page_no);
		page.setList(list);
		page.setTotalItemNumber(sum);
		return page;
	}
	
	public boolean delect_Notive(int N_id){
		return notive_Dao.delectNotive(N_id);
	}
	
	public List<Notive> getNotivebycondition(Condition condition,int page_no){
		return notive_Dao.getNotivebycondition(condition,page_no);
	}
	
	public boolean update(Notive notive){
		return notive_Dao.updateNotive(notive);
	}
}
