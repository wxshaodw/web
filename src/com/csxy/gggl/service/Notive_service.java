package com.csxy.gggl.service;

import java.util.ArrayList;
import java.util.List;

import com.csxy.gggl.Dao.Department_Dao;
import com.csxy.gggl.Dao.Employee_Dao;
import com.csxy.gggl.Dao.Notive_Dao;
import com.csxy.gggl.Dao.impl.Department_Dao_impl;
import com.csxy.gggl.Dao.impl.Employee_Dao_impl;
import com.csxy.gggl.Dao.impl.Notive_Dao_impl;
import com.csxy.gggl.domain.Employee;
import com.csxy.gggl.domain.Notive;
import com.csxy.gggl.web.Condition;
import com.csxy.gggl.web.Page;
import com.csxy.gggl.web.normal_Notive;

public class Notive_service {
	private static final String DEFAULT_READ_STATE="Î´¶Á";
	private static Notive_Dao notive_Dao=new Notive_Dao_impl();
	private static Employee_Dao employee_Dao=new Employee_Dao_impl();
	private static Department_Dao department_Dao=new Department_Dao_impl();

	public boolean release(normal_Notive notive){
		int n_id=0;
		Notive new_notive=notive;
		n_id=notive_Dao.releaseNotive(new_notive);
		if(notive.getLink_employee()!=null){
			for(int i=0;i<notive.getLink_employee().size();i++){
				employee_Dao.link_employee_to_notive(n_id,Integer.parseInt(notive.getLink_employee().get(i)),DEFAULT_READ_STATE);
			}
		}
		if(notive.getLink_dept()!=null){
			for(int i=0;i<notive.getLink_dept().size();i++){
				department_Dao.link_dept_to_notive(n_id, Integer.parseInt(notive.getLink_dept().get(i)));
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
			List<String> selected_dept_list=department_Dao.get_link_dept(r.getN_id());
			if(selected_dept_list.size()!=0)r.setLink_dept(selected_dept_list);
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
	
	public Page<normal_Notive> createPage(int P_id,String read_state,int Page_no){
		int sum=notive_Dao.Count_Notive(P_id, read_state);
		List<Notive> list=notive_Dao.getNotivebyread_state(P_id, read_state, Page_no);
		Page<normal_Notive> page=new Page<normal_Notive>(Page_no);
		page.setList(create_normalNotive(list));
		page.setTotalItemNumber(sum);
		return page;
	}
	
	public Page<normal_Notive> createPage(int P_id,int Page_no){
		int sum=notive_Dao.Count_Notive(P_id);
		List<Notive> list=notive_Dao.getNotivebyUser_id(P_id, Page_no);
		Page<normal_Notive> page=new Page<normal_Notive>(Page_no);
		page.setList(create_normalNotive(list));
		page.setTotalItemNumber(sum);
		return page;
	}
	
	public Page<normal_Notive> createPage(int P_id,int Page_no,Condition condition){
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
	
	public boolean update(Notive notive){
		return notive_Dao.updateNotive(notive);
	}
}
