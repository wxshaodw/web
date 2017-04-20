package com.csxy.gggl.web;

import java.util.List;

public class Page<T> {
	
	//当前第几页
	private int pageNo;
	
	//存放当前页的内容list
	private List<T> list;
	
	//每页显示多少条记录
	private static final int pageSize=14;
	
	//共有多少条记录
	private long totalItemNumber;
	
	//构造方法中需要对pageNo 进行初始化
	public Page(int pageNo){
		super();
		this.pageNo=pageNo;
	}
	
	//页号校验
	public int getPageNo(){
		if(pageNo<0)
			pageNo=1;
		if(pageNo>getTotalPageNumber()){
			pageNo=getTotalPageNumber();
		}
		
		return pageNo;
	}
	
	public static int getPageSize(){
		return pageSize;
	}
	
	
	public void setList(List<T> list){
		this.list=list;
	}
	
	public List<T> getList(){
		return list;
	}
	
	//获取总页数
	public int getTotalPageNumber(){
		
		int totalPageNumber=(int)totalItemNumber / pageSize;
		
		if(totalItemNumber % pageSize!=0){
			totalPageNumber++;
		}
		
		return totalPageNumber;
	}
	
	public void setTotalItemNumber(long totalItemNumbe){
		this.totalItemNumber=totalItemNumbe;
	}
	
	public boolean isHasNext(){
		if(getPageNo()<getTotalPageNumber()){
			return true;
		}
		return false;
	}
	
	public boolean isHasPrev(){
		if(getPageNo()>1){
			return true;
		}
		return false;
	}
	
	public int getPrevPage(){
		if(isHasPrev()){
			return getPageNo()-1;
		}
		return getPageNo();
	}
	
	public int getNextPage(){
		if(isHasNext()){
			return  getPageNo()+1;
		}
		return getPageNo();
	}
}
