package com.csxy.gggl.web;

import java.util.List;

import com.csxy.gggl.domain.Notive;

public class normal_Notive extends Notive{
	String N_authorname;
	List<String> Link_employee;
	List<String> Link_dept;
	
	public normal_Notive(){}
	
	

	public String getN_authorname() {
		return N_authorname;
	}
	
	public void setN_authorname(String n_authorname) {
		N_authorname = n_authorname;
	}



	public List<String> getLink_employee() {
		return Link_employee;
	}



	public void setLink_employee(List<String> link_employee) {
		Link_employee = link_employee;
	}



	public List<String> getLink_dept() {
		return Link_dept;
	}



	public void setLink_dept(List<String> link_dept) {
		Link_dept = link_dept;
	}

	
}
