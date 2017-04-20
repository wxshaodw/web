package com.csxy.gggl.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.csxy.gggl.domain.Department;
import com.csxy.gggl.domain.Employee;
import com.csxy.gggl.domain.User;
import com.csxy.gggl.service.Department_service;
import com.csxy.gggl.service.Employee_service;
import com.csxy.gggl.service.User_service;

/**
 * Servlet implementation class login_servlet
 */
@WebServlet("/user_servlet")
public class user_servlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    
	User_service user_service=new User_service();
	Employee_service employee_service=new Employee_service();
	Department_service department_service=new Department_service();
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
		HttpSession session=request.getSession();
		if(methodName.equals("login")){
			user_servlet.create_user(user, request, response);		
			user=user_service.login(user.getU_name(),user.getU_password(),user.getU_type());
			if(user!=null){
				session.setAttribute("User", user);
				List<Employee> emoloyee_list=employee_service.get_employeelist();
				List<Department> department_list=department_service.get_dept_list();
				Employee employee=employee_service.get_employee(user.getU_owner());
				session.setAttribute("Employee", employee);
				session.setAttribute("Department_list", department_list);
				session.setAttribute("Employ_list",emoloyee_list);
				request.getRequestDispatcher("Notive_servlet?method=getPage").forward(request,response);
			}
			else{
				session.setAttribute("error", "用户名或密码有误请重新输入");
				response.sendRedirect("login.jsp");
			}
		}
		if(methodName.equals("sign_out")){
			session.removeAttribute("User");
			session.removeAttribute("Employee");
			session.removeAttribute("Department_list");
			session.removeAttribute("Employ_list");
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
	
	protected static void create_user(User user,HttpServletRequest request, HttpServletResponse response){
		user.setU_name(request.getParameter("username"));	
		user.setU_password(request.getParameter("password"));
		user.setU_type(request.getParameter("type"));
	}
	
}
