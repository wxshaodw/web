package com.csxy.gggl.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.csxy.gggl.domain.Department;
import com.csxy.gggl.domain.Employee;
import com.csxy.gggl.domain.User;
import com.csxy.gggl.service.Department_service;
import com.csxy.gggl.service.Employee_service;
import com.csxy.gggl.service.Notive_service;
import com.csxy.gggl.service.User_service;
import com.csxy.gggl.utils.file;
import com.sun.glass.ui.Application;

import net.sf.json.JSONArray;
/**
 * Servlet implementation class login_servlet
 */
@WebServlet("/user_servlet")
public class user_servlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    
	User_service user_service=new User_service();
	Notive_service notive_service=new Notive_service();
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
		String username=request.getParameter("username");	
		String password=request.getParameter("password");
		String type=request.getParameter("type");
		User user=new User();
		Date now=new Date();
		HttpSession session=request.getSession();
		List<Employee> emoloyee_list=employee_service.get_employeelist();
		List<Department> department_list=department_service.get_dept_list();
		if(methodName.equals("login")){
			SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
			update_state(now);
			user=user_service.login(username,password,type,df.format(now));
			if(user!=null){
				session.setAttribute("User", user);
				Employee employee=employee_service.get_employee(user.getU_name());
				session.setAttribute("Employee", employee);
				session.setAttribute("Department_list", department_list);
				session.setAttribute("Employ_list",emoloyee_list);
				session.setAttribute("employees_json", json(emoloyee_list));
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
	
	
	public JSONArray json(List<Employee> employees){
		JSONArray json=JSONArray.fromObject(employees);
		return json;
	}
	
	public void update_state(Date now){
		try {
			Date last_time=user_service.gettime();
			if(now.after(last_time)){
				notive_service.update_notive_state();
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
