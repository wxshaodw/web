package com.csxy.gggl.service;

import java.util.ArrayList;
import java.util.List;

import com.csxy.gggl.Dao.Department_Dao;
import com.csxy.gggl.Dao.Employee_Dao;
import com.csxy.gggl.Dao.Notive_Dao;
import com.csxy.gggl.Dao.impl.Department_Dao_impl;
import com.csxy.gggl.Dao.impl.Employee_Dao_impl;
import com.csxy.gggl.Dao.impl.Notive_Dao_impl;
import com.csxy.gggl.domain.Department;
import com.csxy.gggl.domain.Employee;
import com.csxy.gggl.domain.Notive;
import com.csxy.gggl.utils.run_state_Utils;
import com.csxy.gggl.web.Condition;
import com.csxy.gggl.web.Page;
import com.csxy.gggl.web.normal_Dept;
import com.csxy.gggl.web.normal_Notive;

public class Notive_service {
	private static final String DEFAULT_READ_STATE="未读";
	private static Notive_Dao notive_Dao=new Notive_Dao_impl();
	private static Employee_Dao employee_Dao=new Employee_Dao_impl();
	private static Department_Dao department_Dao=new Department_Dao_impl();

	public boolean release(normal_Notive notive){
		int n_id=0;
		normal_Notive new_notive=notive;
		n_id=notive_Dao.releaseNotive(new_notive);
		if(notive.getLink_employee()!=null){
			for(int i=0;i<notive.getLink_employee().size();i++){
				employee_Dao.link_employee_to_notive(n_id,notive.getLink_employee().get(i),DEFAULT_READ_STATE);
			}
		}
		return true;
	}
	
	public  List<normal_Notive> create_normalNotive(List<Notive> notives){
		List<normal_Notive> notive_list=new ArrayList<normal_Notive>();
		for(int i=0;i<notives.size();i++){
			normal_Notive r=new normal_Notive();
			r.setN_id(notives.get(i).getN_id());
			r.setN_author(notives.get(i).getN_author());
			r.setN_title(notives.get(i).getN_title());
			r.setN_type(notives.get(i).getN_type());
			r.setN_state(notives.get(i).getN_state());
			r.setN_top(notives.get(i).getN_top());
			r.setN_release_time(notives.get(i).getN_release_time());
			r.setN_begin_time(notives.get(i).getN_begin_time());
			r.setN_end_time(notives.get(i).getN_end_time());
			r.setN_context(notives.get(i).getN_context());
			List<String> selected_employee_list= employee_Dao.get_link_employee(r.getN_id());
			if(selected_employee_list.size()!=0)r.setLink_employee(selected_employee_list);
			Employee author=employee_Dao.getemployee(r.getN_author());
			r.setN_authorname(author.getP_name());
			notive_list.add(r);
		}
		return notive_list;
	}
	
	public Page<normal_Notive> createPage(int Page_no){
		int sum=notive_Dao.Count_Notive();
		List<Notive> list=notive_Dao.queryforpage(Page_no);
		Page<normal_Notive> page=new Page<normal_Notive>(Page_no);
		page.setList(create_normalNotive(list));
		page.setTotalItemNumber(sum);
		return page;
	}
	
	public Page<normal_Notive> createPage(Condition condition,int Page_no){
		int sum=notive_Dao.Count_Notive(notive_Dao.create_query_sql(condition));
		List<Notive> list=notive_Dao.getNotivebycondition(notive_Dao.create_query_sql(condition), Page_no);
		Page<normal_Notive> page=new Page<normal_Notive>(Page_no);
		page.setList(create_normalNotive(list));
		page.setTotalItemNumber(sum);
		return page;
	}
	
	public Page<normal_Notive> createPage(String P_id,String read_state,int Page_no){
		int sum=notive_Dao.Count_Notive(P_id, read_state);
		List<Notive> list=notive_Dao.getNotivebyread_state(P_id, read_state, Page_no);
		Page<normal_Notive> page=new Page<normal_Notive>(Page_no);
		page.setList(create_normalNotive(list));
		page.setTotalItemNumber(sum);
		return page;
	}
	
	public Page<normal_Notive> createPage(String P_id,int Page_no){
		int sum=notive_Dao.Count_Notivebyid(P_id);
		List<Notive> list=notive_Dao.getNotivebyUser_id(P_id, Page_no);
		Page<normal_Notive> page=new Page<normal_Notive>(Page_no);
		page.setList(create_normalNotive(list));
		page.setTotalItemNumber(sum);
		return page;
	}
	
	public Page<normal_Notive> createPage(String P_id,int Page_no,Condition condition){
		int sum=notive_Dao.Count_Notivebycondition(P_id, notive_Dao.create_query_sqlbyuser(condition));
		List<Notive> list=notive_Dao.getNotivebycondition(P_id, notive_Dao.create_query_sqlbyuser(condition), Page_no);
		Page<normal_Notive> page=new Page<normal_Notive>(Page_no);
		page.setList(create_normalNotive(list));
		page.setTotalItemNumber(sum);
		return page;
	}
	
	public Page<normal_Notive> create_audit_Page(int Page_no){
		int sum=notive_Dao.Count_audit_Notive();
		List<Notive> list=notive_Dao.get_audit_Notive(Page_no);
		Page<normal_Notive> page=new Page<normal_Notive>(Page_no);
		page.setList(create_normalNotive(list));
		page.setTotalItemNumber(sum);
		return page;
	}
	
	public boolean delect_Notive(int N_id){
		return notive_Dao.delectNotive(N_id);
	}
	
	public boolean update(normal_Notive notive){
		notive_Dao.Notive_link_delect(notive.getN_id());
		if(notive.getLink_employee()!=null){
			for(int i=0;i<notive.getLink_employee().size();i++){
				employee_Dao.link_employee_to_notive(notive.getN_id(),notive.getLink_employee().get(i),DEFAULT_READ_STATE);
			}
		}
		return notive_Dao.updateNotive(notive);
		}
	
	public boolean Noitve_audit(normal_Notive notive,String state){
		String N_state;
		if(state.equals("通过")){
			N_state=run_state_Utils.return_state(notive.getN_begin_time(), notive.getN_end_time());
		}
		else{
			N_state="不通过";
		}
		return notive_Dao.Notive_audit(notive.getN_id(), N_state);
	}
	
	public boolean Notive_read(int N_id,String P_id,String read_state){
		notive_Dao.Notive_read(N_id, P_id, read_state);
		return false;
		
	}
	
	public void update_notive_state(){
		List<Notive>notives=notive_Dao.getlisttoupdate_state();
		for(int i=0;i<notives.size();i++){
			String  state=run_state_Utils.return_state(notives.get(i).getN_begin_time(), notives.get(i).getN_end_time());
			notive_Dao.update_state(notives.get(i).getN_id(), state);
		}
		
	}
	
}
