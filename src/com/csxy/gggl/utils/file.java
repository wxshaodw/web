package com.csxy.gggl.utils;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class file {
	private static final String PATH=" ./filesave/";
	
	public static boolean exist(String filename){
		boolean falg=true;
		File headPath = new File(PATH);
        if(!headPath.exists()){//判断文件夹是否创建，没有创建则创建新文件夹
        	headPath.mkdirs();
        	falg=false;
        }
        File file=new File(PATH+filename);
        if(file.exists()){
        	 try {
				file.createNewFile();
				falg=false;
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }
		return falg;
	}
	
	public static void create_file(String text,String filename) throws IOException{
		FileWriter fw=new FileWriter(PATH+filename);
		fw.write(text);
		fw.flush();
		fw.close();

	}
	public static String out_file(String name) throws IOException{
		FileReader fr=new FileReader(PATH+name);
		BufferedReader br=new BufferedReader(fr);
		String str="";
		while(br.ready())str=str+br.readLine();
		fr.close();
		br.close();
		return str;
	}
	public static void deleteFile(String sPath) {   
		File a= new File(sPath);  
		a.delete();  
	} 
}
