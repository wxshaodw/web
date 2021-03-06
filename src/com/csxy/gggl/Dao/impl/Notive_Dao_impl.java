package com.csxy.gggl.Dao.impl;

import java.util.List;

import com.csxy.gggl.Dao.Notive_Dao;
import com.csxy.gggl.domain.Notive;
import com.csxy.gggl.web.Condition;
import com.csxy.gggl.web.Page;

public class Notive_Dao_impl extends BaseDao<Notive> implements Notive_Dao{

	@Override
	public List<Notive> getNotive() {
		String sql="select * from Notive ORDER BY N_top";
		return queryforList(sql);
		// TODO Auto-generated method stub 
	}

	@Override
	public List<Notive> getNotivebycondition(String condition,int page_no) {
		String sql="select * from Notive ";
		sql=sql+condition+" ORDER BY N_top  "+"limit ?,?";
		// TODO Auto-generated method stub
		return queryforList(sql,(page_no-1)*Page.getPageSize(),Page.getPageSize());
	}

	@Override
	public int releaseNotive(Notive new_notive) {
		String sql="insert into notive(N_author, N_title,N_type,N_state,N_top,N_release_time,N_begin_time,N_end_time,N_context) "
				+ "values"+"(?,?,?,?,?,?,?,?,?)";
		int notive_id=insert(sql,new_notive.getN_author(),new_notive.getN_title(),new_notive.getN_type(),new_notive.getN_state(),new_notive.getN_top(),new_notive.getN_release_time(),new_notive.getN_begin_time(),new_notive.getN_end_time(),new_notive.getN_context());
		new_notive.setN_id(notive_id);// TODO Auto-generated method stub
		return new_notive.getN_id();
	}

	@Override
	public boolean updateNotive(Notive notive) {
		String sql="update Notive set N_author=?,N_title=?,N_type=?,N_state=?,N_top=?,N_release_time=?,N_begin_time=?,N_end_time=?,N_context=? where N_id=?";// TODO Auto-generated method stub
		return update(sql, notive.getN_author(),notive.getN_title(),notive.getN_type(),notive.getN_state(),notive.getN_top(),notive.getN_release_time(),notive.getN_begin_time(),notive.getN_end_time(),notive.getN_context(),notive.getN_id());
	}

	@Override
	public boolean delectNotive(int id) {
		String sql="delete from notive where N_id=?";
		return delect(sql, id);
		// TODO Auto-generated method stub
	}

	@Override
	public List<Notive> queryforpage(int page_no) {
		String sql="select * from notive ORDER BY N_top  limit ?,?";
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
		if(!condition.getTitle().equals("")){
			if(condition_mun!=0)condition_str=condition_str+" and ";
			condition_str=condition_str+"N_title like '%"+condition.getTitle()+"%'";
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
		if(!condition.getAuthor().equals("")){
			if(condition_mun!=0)condition_str=condition_str+" and ";
			condition_str=condition_str+"N_author ='"+condition.getAuthor()+"'";
			condition_mun++;
		}if(!condition.getRelease().equals("")){
			if(condition_mun!=0)condition_str=condition_str+" and ";
			condition_str=condition_str+"N_releast_time ��"+condition.getRelease()+"'";
			condition_mun++;
		}
		if(condition_mun==0){
			condition_str="";
		}
		return condition_str;
	}

	@Override
	public List<Notive> getNotivebyread_state(String P_id, String read_state,int page_no) {
		String sql="select notive.N_id,N_author,N_title,N_type,N_state,N_top,N_release_time,N_begin_time,N_end_time,N_context from notive,notive_employee "
				+ "WHERE notive.N_id=notive_employee.N_id AND P_id=? AND read_state=? and(NOT N_state='�����') ORDER BY N_top  limit ?,?";
		// TODO Auto-generated method stub
		return queryforList(sql, P_id,read_state,(page_no-1)*Page.getPageSize(),Page.getPageSize());
	}

	@Override
	public int Count_Notive(String P_id, String read_state) {
		String sql="select count(*) from notive,notive_employee "
				+ "WHERE notive.N_id=notive_employee.N_id AND P_id=? AND read_state=? and(NOT N_state='�����' and NOT N_state='��ͨ��' and NOT N_state='δ����')";// TODO Auto-generated method stub
		return Countfordate(sql,P_id,read_state);
	}

	@Override
	public int Count_Notivebyid(String P_id) {
		String sql="select count(*) from notive,notive_employee"
				+ " WHERE notive.N_id=notive_employee.N_id AND P_id=? and(NOT N_state='�����' and NOT N_state='��ͨ��' and NOT N_state='δ����')";
		// TODO Auto-generated method stub
		return Countfordate(sql, P_id);
	}

	@Override
	public List<Notive> getNotivebyUser_id(String P_id, int page_no) {
		String sql="select notive.N_id,N_author,N_title,N_type,N_state,N_top,N_release_time,N_begin_time,N_end_time,N_context from notive,notive_employee "
				+ "WHERE notive.N_id=notive_employee.N_id AND P_id=? and(NOT N_state='�����' and NOT N_state='��ͨ��' and NOT N_state='δ����')  ORDER BY N_top  limit ?,?";// TODO Auto-generated method stub
		return queryforList(sql, P_id,(page_no-1)*Page.getPageSize(),Page.getPageSize());
	}

	@Override
	public List<Notive> get_audit_Notive(int page_no) {
		String sql="select * from notive where NOT N_state='�����' ORDER BY N_top  limit ?,?";
		// TODO Auto-generated method stub
		return queryforList(sql,(page_no-1)*Page.getPageSize(),Page.getPageSize());
	}

	@Override
	public int Count_audit_Notive() {
		String sql="select count(*) from notive where NOT N_state='�����' ";
		// TODO Auto-generated method stub
		return Countfordate(sql);
	}

	@Override
	public String create_query_sqlbyuser(Condition condition) {
		String condition_str=" ";
		if(!condition.getType().equals("")){
			condition_str=condition_str+" and ";
			condition_str=condition_str+"N_type='"+condition.getType()+"'";
		}
		if(!condition.getTitle().equals("")){
			condition_str=condition_str+" and ";
			condition_str=condition_str+"N_title like '%"+condition.getTitle()+"%'";
		}
		if(!condition.getState().equals("")){
			condition_str=condition_str+" and ";
			condition_str=condition_str+"N_state='"+condition.getState()+"'";
		}
		if(!condition.getTop().equals("")){
			condition_str=condition_str+" and ";
			condition_str=condition_str+"N_top='"+condition.getTop()+"'";
		}
		if(!condition.getBegin_time().equals("")){
			condition_str=condition_str+" and ";
			condition_str=condition_str+"N_begin_time >='"+condition.getBegin_time()+"'";
			}
		if(!condition.getEnd_time().equals("")){
			condition_str=condition_str+" and ";
			condition_str=condition_str+"N_end_time <='"+condition.getEnd_time()+"'";
		}if(!condition.getRelease().equals("")){
			condition_str=condition_str+" and ";
			condition_str=condition_str+"N_releast_time ��"+condition.getRelease()+"'";
		}
		if(!condition.getAuthor().equals("")){
			condition_str=condition_str+" and ";
			condition_str=condition_str+"N_author ='"+condition.getAuthor()+"'";
		}
		return condition_str;	}

	@Override
	public List<Notive> getNotivebycondition(String P_id, String condition, int page_no) {
		String sql="select notive.N_id,N_author,N_title,N_type,N_state,N_top,N_release_time,N_begin_time,N_end_time,N_context from notive,notive_employee "
				+ "WHERE notive.N_id=notive_employee.N_id AND P_id=? and(NOT N_state='�����')";
		sql=sql+condition+" ORDER BY N_top  limit ?,?";// TODO Auto-generated method stub
		return queryforList(sql, P_id,(page_no-1)*Page.getPageSize(),Page.getPageSize());
	}

	@Override
	public int Count_Notivebycondition(String P_id, String condition) {
		String sql="select count(*) from notive,notive_employee WHERE notive.N_id=notive_employee.N_id AND P_id=? and(NOT N_state= '�����' )";
		sql=sql+condition;// TODO Auto-generated method stub
		return Countfordate(sql,P_id);
	}

	@Override
	public boolean Notive_audit(int N_id, String N_state) {
		String sql="update Notive set N_state=? where N_id=?";// TODO Auto-generated method stub
		return update(sql,N_state,N_id);
	}

	@Override
	public boolean Notive_read(int N_id, String P_id, String read_state) {
		String sql="update notive_employee set read_state=? where N_id=? and P_id=?";// TODO Auto-generated method stub
		return update(sql,read_state,N_id,P_id);
	}

	@Override
	public Boolean Notive_link_delect(int N_id) {
		String sql="delete from notive_employee where N_id=?";// TODO Auto-generated method stub
		return delect(sql, N_id);
	}

	@Override
	public List<Notive> getlisttoupdate_state() {
		String sql="select * from notive where Not N_state='�����' AND NOT N_state='��ͨ��'";// TODO Auto-generated method stub
		return queryforList(sql);
	}

	@Override
	public void update_state(int N_id, String state) {
		String sql="update notive set N_state=? where N_id=?";
		update(sql, state,N_id);// TODO Auto-generated method stub
		
	}

	@Override
	public List<Notive> query_all(String condition) {
		String sql="select * from Notive ";
		sql=sql+condition+" ORDER BY N_top  ";
		return queryforList(sql);
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Notive> query_all(String P_id, String condition) {
		String sql="select notive.N_id,N_author,N_title,N_type,N_state,N_top,N_release_time,N_begin_time,N_end_time,N_context from notive,notive_employee "
				+ "WHERE notive.N_id=notive_employee.N_id AND P_id=? and(NOT N_state='�����')";
		sql=sql+condition+" ORDER BY N_top ";// TODO Auto-generated method stub
		return queryforList(sql, P_id);
	}

	@Override
	public Notive get_a_Noitve(int N_id) {
		String sql="select * from Notive where N_id=?";
		Notive notive=query(sql, N_id);
		return notive;
	}
}
