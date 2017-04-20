package com.csxy.gggl.web;

import java.util.List;

public class Page<T> {
	
	//��ǰ�ڼ�ҳ
	private int pageNo;
	
	//��ŵ�ǰҳ������list
	private List<T> list;
	
	//ÿҳ��ʾ��������¼
	private static final int pageSize=14;
	
	//���ж�������¼
	private long totalItemNumber;
	
	//���췽������Ҫ��pageNo ���г�ʼ��
	public Page(int pageNo){
		super();
		this.pageNo=pageNo;
	}
	
	//ҳ��У��
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
	
	//��ȡ��ҳ��
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
