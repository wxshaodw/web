package com.csxy.gggl.utils;

public class conversion_utils {
	
	public static String strtobyte(String str){
		String result="";
		char[] strChar=str.toCharArray();
		for(int i=0;i<strChar.length;i++){
			result+=Integer.toBinaryString(strChar[i]);
		}
		return result;
	}
}
