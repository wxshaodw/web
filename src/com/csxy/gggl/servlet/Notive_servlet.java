package com.csxy.gggl.servlet;

import java.io.IOException;
import java.util.ArrayList;
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
import com.csxy.gggl.domain.Notive;
import com.csxy.gggl.domain.User;
import com.csxy.gggl.service.Notive_service;
import com.csxy.gggl.utils.conversion_utils;
import com.csxy.gggl.utils.run_state_Utils;
import com.csxy.gggl.web.Condition;
import com.csxy.gggl.web.Page;
import com.csxy.gggl.web.normal_Notive;;

/**
 * Servlet implementation class Notive_servlet
 */
@WebServlet("/Notive_servlet")
public class Notive_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String DEFAULT_STATE="待审核";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Notive_servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String methodName=request.getParameter("method");
		Notive_service notive_service=new Notive_service();
		
		HttpSession session=request.getSession();
		User user=(User)session.getAttribute("User");
		session.setAttribute("User_type", user.getU_type());
		Employee employee=(Employee)session.getAttribute("Employee");
		String state=(String)session.getAttribute("running_state");
		Condition condition=(Condition) session.getAttribute("condition");
		
		if(methodName.equals("release")){
			session.setAttribute("running_state", "normal");
			session.setAttribute("condition", new Condition());
			String[] employee_selected=request.getParameterValues("employee_selected");
			String[] department_selected=request.getParameterValues("department_selected");
            normal_Notive new_notive=new normal_Notive();
			create_Notive(new_notive,user,employee,employee_selected,department_selected, request, response);
			if(notive_service.release(new_notive)){
				flush(session, user, notive_service);
				response.sendRedirect("main.jsp");
			};
		}
		
		if(methodName.equals("getPage")){
			flush(session, user, notive_service);
			response.sendRedirect("main.jsp");
		}
		
		if(methodName.equals("delect")){
			session.setAttribute("running_state", "normal");
			session.setAttribute("condition", new Condition());
			if(notive_service.delect_Notive(Integer.parseInt(request.getParameter("delect")))){
				flush(session, user, notive_service);
				System.out.println("删除成功");
				response.sendRedirect("main.jsp");
			}
		}
		
		if(methodName.equals("query")){
			session.setAttribute("running_state", "query");
            if(!request.getParameter("type").equals("全部")){
                condition.setType(request.getParameter("type"));
            }
            if(!request.getParameter("state").equals("全部")){
            	condition.setState(request.getParameter("state"));
            }
            if(!request.getParameter("top").equals("全部")){
            	condition.setTop(request.getParameter("top"));
            }
            condition.setTitle(request.getParameter("title"));
            condition.setBegin_time(request.getParameter("begin_time"));
            condition.setEnd_time(request.getParameter("end_time"));
            session.setAttribute("condition", condition);
            if(user.getU_type().equals("管理员")){
    			Page<normal_Notive> page=notive_service.createPage(condition,1);
    			session.setAttribute("Page",page);
            }else{
				Page<normal_Notive> page=notive_service.createPage(user.getU_owner(), 1, condition);
				session.setAttribute("Page",page);
            }
			response.sendRedirect("main.jsp");
		}
		
		if(methodName.equals("update")){
			session.setAttribute("running_state", "normal");
			session.setAttribute("condition", new Condition());
			Notive change_notive=(Notive)session.getAttribute("change_notive");
			//create_Notive(change_notive, user, request, response);
			if(notive_service.update(change_notive)){
				flush(session, user, notive_service);
				response.sendRedirect("main.jsp");
			};
			
		}
		
		if(methodName.equals("turn")){
			int page_no=Integer.parseInt(request.getParameter("page_no"));
			if(page_no==0)page_no=Integer.parseInt(request.getParameter("target"));
			System.out.println(state);
			if(state.equals("normal")){
				if(user.getU_type().equals("管理员")){
					Page<normal_Notive> page=notive_service.createPage(page_no);
				    session.setAttribute("Page",page);
				    }
				else{
					Page<normal_Notive> page=notive_service.createPage(user.getU_owner(),page_no);
					session.setAttribute("Page",page);
				}
			}
			else if(state.equals("audit")){
				Page<normal_Notive> page=notive_service.create_audit_Page(page_no);
			    session.setAttribute("Page",page);
			}
			else{
				if(user.getU_type().equals("管理员")){
					System.out.println("查询翻页");
					Page<normal_Notive> page=notive_service.createPage(condition,page_no);
					session.setAttribute("Page",page);
				}
				else{
					Page<normal_Notive> page=notive_service.createPage(user.getU_owner(), page_no, condition);
					session.setAttribute("Page",page);
				}
			}
			response.sendRedirect("main.jsp");
		}
		
		if(methodName.equals("Pending_audit")){
			session.setAttribute("running_state", "query");
			condition.setState(DEFAULT_STATE);
			session.setAttribute("condition", condition);
			Page<normal_Notive> page=notive_service.createPage(condition,1);
			session.setAttribute("Page",page);
			response.sendRedirect("main.jsp");
		}
		
		if(methodName.equals("audit")){
			session.setAttribute("running_state", "audit");
			Page<normal_Notive> page=notive_service.create_audit_Page(1);
			session.setAttribute("Page",page);
			response.sendRedirect("main.jsp");
		}
		
		if(methodName.equals("getMy_Notive")){
			session.setAttribute("running_state", "query");
			condition.setAuthor(user.getU_owner());
			session.setAttribute("condition", condition);
			Page<normal_Notive> page=notive_service.createPage(condition,1);
			session.setAttribute("Page",page);
			response.sendRedirect("main.jsp");
		}
		
		if(methodName.equals("getUnread")){
			Page<normal_Notive> page=notive_service.createPage(user.getU_owner(),"未读", 1);
			session.setAttribute("Page",page);
			response.sendRedirect("main.jsp");
		}
		
		if(methodName.equals("getread")){
			Page<normal_Notive> page=notive_service.createPage(user.getU_owner(),"已读", 1);
			session.setAttribute("Page",page);
			response.sendRedirect("main.jsp");
		}
		
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	static void create_Notive(normal_Notive notive,User user,Employee employee,String[] employee_selected,String[] department_selected,HttpServletRequest request, HttpServletResponse response){
		notive.setN_author(user.getU_owner());
		notive.setN_title(request.getParameter("title"));
		notive.setN_type(request.getParameter("type"));
		notive.setN_state(DEFAULT_STATE);
		notive.setN_top(request.getParameter("top"));
		notive.setN_release_time(request.getParameter("release_time"));
		notive.setN_begin_time(request.getParameter("begin_time"));
		notive.setN_end_time(request.getParameter("end_time"));
		notive.setN_context(request.getParameter("content"));
		notive.setN_authorname(employee.getP_name());
		notive.setLink_dept( new ArrayList<String>());
		notive.setLink_employee(new ArrayList<String>());
		if(department_selected!=null){
			for(int i=0;i<department_selected.length;i++){
				notive.getLink_dept().add(department_selected[i]);
			}
		}
		if(employee_selected!=null){
			for(int i=0;i<employee_selected.length;i++)
			{
				notive.getLink_employee().add(employee_selected[i]);
			}
		}
	}
	
	public void flush(HttpSession session,User user,Notive_service notive_service){
		if(user.getU_type().equals("管理员")){
			session.setAttribute("running_state", "normal");
			session.setAttribute("condition", new Condition());
			Page<normal_Notive> page=notive_service.createPage(1);
			session.setAttribute("Page",page);
		}else{
			session.setAttribute("running_state", "normal");
			session.setAttribute("condition", new Condition());
			Page<normal_Notive> page=notive_service.createPage(user.getU_owner(),1);
			session.setAttribute("Page",page);
		}
		System.out.println("刷新主页");
	}
}
