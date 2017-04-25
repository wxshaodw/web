package com.csxy.gggl.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.tomcat.util.codec.binary.StringUtils;

import com.csxy.gggl.domain.Department;
import com.csxy.gggl.domain.Employee;
import com.csxy.gggl.domain.Notive;
import com.csxy.gggl.domain.User;
import com.csxy.gggl.service.Employee_service;
import com.csxy.gggl.service.Notive_service;
import com.csxy.gggl.utils.conversion_utils;
import com.csxy.gggl.utils.run_state_Utils;
import com.csxy.gggl.web.Condition;
import com.csxy.gggl.web.Page;
import com.csxy.gggl.web.normal_Dept;
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
		Employee employee=(Employee)session.getAttribute("Employee");
		String state=(String)session.getAttribute("running_state");
		Condition condition=(Condition) session.getAttribute("condition");
		get_employeebydept(session);
		
		if(methodName.equals("release")){
			session.setAttribute("running_state", "normal");
			session.setAttribute("condition", new Condition());
			List<String> employee_selected=get_selected_employee(request.getParameter("employee_selected"));
            normal_Notive new_notive=new normal_Notive();
			create_Notive(new_notive,user,employee,employee_selected, request, response);
			notive_service.release(new_notive);
			flush(session, user, notive_service);
			response.sendRedirect("main.jsp");
		}
		
		if(methodName.equals("getPage")){
			session.setAttribute("function",methodName);
			flush(session, user, notive_service);
			response.sendRedirect("main.jsp");
		}
		
		if(methodName.equals("delect")){
			session.setAttribute("running_state", "normal");
			session.setAttribute("condition", new Condition());
			if(notive_service.delect_Notive(Integer.parseInt(request.getParameter("delect")))){
				flush(session, user, notive_service);
				response.sendRedirect("main.jsp");
			}
		}
		
		if(methodName.equals("query")){
			session.setAttribute("function",methodName);
			session.setAttribute("running_state", "query");
			condition=new Condition();
            if(!request.getParameter("type").equals("全部")){
                condition.setType(request.getParameter("type"));
            }
            if(!request.getParameter("state").equals("全部")){
            	condition.setState(request.getParameter("state"));
            }
            if(!request.getParameter("top").equals("全部")){
            	condition.setTop(request.getParameter("top"));
            }if(request.getParameter("title")==null){
                condition.setTitle("");
            }else{
            	String N_title=(String)request.getParameter("title");
            	condition.setTitle(N_title);
            }
            condition.setBegin_time(request.getParameter("begin_time"));
            condition.setEnd_time(request.getParameter("end_time"));
            session.setAttribute("condition", condition);
            if(user.getU_type().equals("管理员")){
    			Page<normal_Notive> page=notive_service.createPage(condition,1);
    			change_id_to_name(session, page);
    			session.setAttribute("Page",page);
            }else{
				Page<normal_Notive> page=notive_service.createPage(user.getU_owner(), 1, condition);
				change_id_to_name(session, page);
				session.setAttribute("Page",page);
            }
			response.sendRedirect("main.jsp");
		}
		
		if(methodName.equals("update")){
			session.setAttribute("running_state", "normal");
			session.setAttribute("condition", new Condition());
			normal_Notive change_notive=(normal_Notive)session.getAttribute("change_notive");
			List<String> employee_selected=get_selected_employee(request.getParameter("employee_selected"));
			create_Notive(change_notive,user,employee,employee_selected, request, response);
			if(notive_service.update(change_notive)){
				flush(session, user, notive_service);
				response.sendRedirect("main.jsp");
			};
			
		}
		
		if(methodName.equals("turn")){
			int page_no=Integer.parseInt(request.getParameter("page_no"));
			if(page_no==0)page_no=Integer.parseInt(request.getParameter("target"));
			if(state.equals("normal")){
				if(user.getU_type().equals("管理员")){
					Page<normal_Notive> page=notive_service.createPage(page_no);
					change_id_to_name(session, page);
				    session.setAttribute("Page",page);
				    }
				else{
					Page<normal_Notive> page=notive_service.createPage(user.getU_owner(),page_no);
					change_id_to_name(session, page);
					session.setAttribute("Page",page);
				}
			}
			else if(state.equals("audit")){
				Page<normal_Notive> page=notive_service.create_audit_Page(page_no);
				change_id_to_name(session, page);
			    session.setAttribute("Page",page);
			}
			else{
				if(user.getU_type().equals("管理员")){
					Page<normal_Notive> page=notive_service.createPage(condition,page_no);
					change_id_to_name(session, page);
					session.setAttribute("Page",page);
				}
				else{
					Page<normal_Notive> page=notive_service.createPage(user.getU_owner(), page_no, condition);
					change_id_to_name(session, page);
					session.setAttribute("Page",page);
				}
			}
			response.sendRedirect("main.jsp");
		}
		
		if(methodName.equals("Pending_audit")){
			session.setAttribute("function",methodName);
			session.setAttribute("running_state", "query");
			condition.setState("待审核");
			session.setAttribute("condition", condition);
			Page<normal_Notive> page=notive_service.createPage(condition,1);
			change_id_to_name(session, page);
			session.setAttribute("Page",page);
			response.sendRedirect("main.jsp");
		}
		
		if(methodName.equals("unaudit")){
			session.setAttribute("function",methodName);
			session.setAttribute("running_state", "query");
			condition.setState("不通过");
			session.setAttribute("condition", condition);
			Page<normal_Notive> page=notive_service.createPage(condition,1);
			change_id_to_name(session, page);
			session.setAttribute("Page",page);
			response.sendRedirect("main.jsp");
		}
		
		if(methodName.equals("audit")){
			session.setAttribute("function",methodName);
			session.setAttribute("running_state", "audit");
			Page<normal_Notive> page=notive_service.create_audit_Page(1);
			change_id_to_name(session, page);
			session.setAttribute("Page",page);
			response.sendRedirect("main.jsp");
		}
		
		if(methodName.equals("getMy_Notive")){
			session.setAttribute("function",methodName);
			session.setAttribute("running_state", "query");
			condition.setAuthor(user.getU_owner());
			session.setAttribute("condition", condition);
			Page<normal_Notive> page=notive_service.createPage(condition,1);
			change_id_to_name(session, page);
			session.setAttribute("Page",page);
			response.sendRedirect("main.jsp");
		}
		
		if(methodName.equals("getUnread")){
			session.setAttribute("function",methodName);
			Page<normal_Notive> page=notive_service.createPage(user.getU_owner(),"未读", 1);
			change_id_to_name(session, page);
			session.setAttribute("Page",page);
			response.sendRedirect("main.jsp");
		}
		
		if(methodName.equals("getread")){
			session.setAttribute("function",methodName);
			Page<normal_Notive> page=notive_service.createPage(user.getU_owner(),"已读", 1);
			change_id_to_name(session, page);
			session.setAttribute("Page",page);
			response.sendRedirect("main.jsp");
		}
		
		if(methodName.equals("Noitve_audit")){
			String a_state=request.getParameter("state");
		    Page<normal_Notive> p=(Page<normal_Notive>)session.getAttribute("Page");
		    int no=Integer.parseInt(request.getParameter("no"));
		    normal_Notive audit_notive=p.getList().get(no);
			notive_service.Noitve_audit(audit_notive, a_state);
		}
		
		if(methodName.equals("Noitve_read")){
			String read_state=request.getParameter("state");
			int N_id=Integer.parseInt(request.getParameter("id"));
			notive_service.Notive_read(N_id, user.getU_owner(), read_state);
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
	
	static void create_Notive(normal_Notive notive,User user,Employee employee,List<String> employee_selected,HttpServletRequest request, HttpServletResponse response){
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
		notive.setLink_employee(employee_selected);
	}
	
	public void flush(HttpSession session,User user,Notive_service notive_service){
		if(user.getU_type().equals("管理员")){
			session.setAttribute("running_state", "normal");
			session.setAttribute("condition", new Condition());
			Page<normal_Notive> page=notive_service.createPage(1);
			change_id_to_name(session, page);
			session.setAttribute("Page",page);
		}else{
			session.setAttribute("running_state", "normal");
			session.setAttribute("condition", new Condition());
			Page<normal_Notive> page=notive_service.createPage(user.getU_owner(),1);
			change_id_to_name(session, page);
			session.setAttribute("Page",page);
		}
	}
	
	public List<String> get_selected_employee(String selected_employee){
		List<String> result = Arrays.asList(selected_employee.split(","));
		if(result.get(0).equals(""))result=null;
		return result;
	}
	
	
	public void get_employeebydept(HttpSession session){
		Employee_service employee_service=new Employee_service();
		List<normal_Dept> dept_list=employee_service.get_Dept();
		session.setAttribute("dept_list", dept_list);
	}
	
	public List<String> get_employee_name(HttpSession session,List<String> id_list){
		List<Employee> employees=(List<Employee>)session.getAttribute("Employ_list");
		List<String> name_list=new ArrayList<String>();
		if(id_list!=null){
			for(int i=0;i<id_list.size();i++){
				for(int j=0;j<employees.size();j++){
					if(Integer.parseInt(id_list.get(i))==employees.get(j).getP_id()){
						name_list.add(employees.get(j).getP_name());
					}
				}
			}
		}
		else name_list=null;
		return name_list;
	}
	
	public void change_id_to_name(HttpSession session,Page page){
		List<normal_Notive> list=page.getList();
		for(int i=0;i<list.size();i++){
			list.get(i).setLink_employee_name(get_employee_name(session, list.get(i).getLink_employee()));
		}
	}
}
