package com.csxy.gggl.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.csxy.gggl.domain.User;
import com.csxy.gggl.service.User_service;

/**
 * Servlet implementation class login_servlet
 */
@WebServlet("/user_servlet")
public class user_servlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    
	User_service user_service=new User_service();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public user_servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String methodName=request.getParameter("methods");
		User user=new User();
		user.setU_name(request.getParameter("username"));	
		user.setU_password(request.getParameter("password"));
		
		if(methodName.equals("login")){
			HttpSession session=request.getSession();
			
			user=user_service.login(user.getU_name(),user.getU_password());
			if(user!=null){
				session.setAttribute("User", user);
				response.sendRedirect("main.jsp");
			}
			else{
				session.setAttribute("error", "用户名或密码有误请重新输入");
				response.sendRedirect("login.jsp");
			}
		}
		else{
			user_service.register(user);
			response.sendRedirect("login.jsp");
		}
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
