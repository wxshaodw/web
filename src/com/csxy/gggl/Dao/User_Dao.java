package com.csxy.gggl.Dao;

import java.util.List;

import com.csxy.gggl.domain.User;

public interface User_Dao {
	/**
	 * �����û�����ȡ�û���Ϣ
	 * return �û���
	 * **/
	abstract User get_User(String username);
	
	/**
	 * ��ҳ���ȡע���û�
	 * @param User��ҳ���ȡ���û���ϢBean
	 * @return 
	 * **/
	abstract boolean register(User new_user);
}
