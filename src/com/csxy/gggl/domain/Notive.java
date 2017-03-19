package com.csxy.gggl.domain;

public class Notive {
	String N_id;
	String N_title;
	String N_content;
	String N_author;
	String N_state;
	String N_reseales_time;
	String N_begin_time;
	String N_end_time;
	public String getN_id() {
		return N_id;
	}
	public void setN_id(String n_id) {
		N_id = n_id;
	}
	public String getN_title() {
		return N_title;
	}
	public void setN_title(String n_title) {
		N_title = n_title;
	}
	public String getN_content() {
		return N_content;
	}
	public void setN_content(String n_content) {
		N_content = n_content;
	}
	public String getN_author() {
		return N_author;
	}
	public void setN_author(String n_author) {
		N_author = n_author;
	}
	public String getN_state() {
		return N_state;
	}
	public void setN_state(String n_state) {
		N_state = n_state;
	}
	public String getN_reseales_time() {
		return N_reseales_time;
	}
	public void setN_reseales_time(String n_reseales_time) {
		N_reseales_time = n_reseales_time;
	}
	public String getN_begin_time() {
		return N_begin_time;
	}
	public void setN_begin_time(String n_begin_time) {
		N_begin_time = n_begin_time;
	}
	public String getN_end_time() {
		return N_end_time;
	}
	public void setN_end_time(String n_end_time) {
		N_end_time = n_end_time;
	}
	public static int change_id_type(String str){
		return Integer.parseInt(str);
	}
	public static String change_id_tyep(int i){
		return Integer.toString(i);
	}
}
