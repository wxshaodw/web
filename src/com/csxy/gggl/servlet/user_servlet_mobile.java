package com.csxy.gggl.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.csxy.gggl.domain.User;
import com.csxy.gggl.service.User_service;

import net.sf.json.JSONArray;

/**
 * Servlet implementation class user_servlet_mobile
 */
@WebServlet("/user_servlet_mobile")
public class user_servlet_mobile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	User_service user_service=new User_service();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public user_servlet_mobile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("username");	
		String password=request.getParameter("password");
		String type=request.getParameter("type");
		User user=new User();
		Date now=new Date();
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		//update_state(now);
		user=user_service.login(username,password,type,df.format(now));
		response.getWriter().append(json(user).toString());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	public JSONArray json(User user){
		JSONArray json=JSONArray.fromObject(user);
		return json;
	}
}
