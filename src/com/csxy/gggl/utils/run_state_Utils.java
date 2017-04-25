package com.csxy.gggl.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.csxy.gggl.test.UserDao_test;

public class run_state_Utils {
	
	public static String return_state(String begin_time,String end_time){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
		String state=null;
	    try {
			Date begin_date = sdf.parse(begin_time);
			Date end_date=sdf.parse(end_time);
			Date now=new Date();
			if(now.before(begin_date)){
				state="待生效";
			}
			else if(now.before(end_date)){
				state="已生效";
			}
			else{
				state="已失效";
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    return state;
	    }
	
	public static void main(String[] args) {
		System.out.println(return_state("2017-04-23","2017-04-26"));// TODO Auto-generated method stub
	}
}
