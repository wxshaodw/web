package com.csxy.gggl.servlet;

import java.io.IOException;
import java.sql.Savepoint;
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

import com.csxy.gggl.Dao.impl.Department_Dao_impl;
import com.csxy.gggl.Dao.impl.Notive_Dao_impl;
import com.csxy.gggl.domain.Department;
import com.csxy.gggl.domain.Employee;
import com.csxy.gggl.domain.Notive;
import com.csxy.gggl.domain.User;
import com.csxy.gggl.service.Department_service;
import com.csxy.gggl.service.Employee_service;
import com.csxy.gggl.service.Notive_service;
import com.csxy.gggl.web.Condition;
import com.csxy.gggl.web.Page;
import com.csxy.gggl.web.normal_Notive;
import com.google.gson.Gson;

import net.sf.json.JSONArray;

/**
 * Servlet implementation class Notive_servlet_mobile
 */
@WebServlet("/Notive_servlet_mobile")
public class Notive_servlet_mobile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String DEFAULT_STATE="待审核";
	private static normal_Notive save_data=null;
	private static String Notive_content ="";
	static String change_content="";
	static boolean change=false;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Notive_servlet_mobile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Notive_service notive_service=new Notive_service();
		Department_service dept_service=new Department_service();
		Employee_service employee_service=new Employee_service();
		String method=request.getParameter("method");
		if(method.equals("getlist")){
			int page_no=Integer.parseInt(request.getParameter("page"));
			List<normal_Notive> list=notive_service.createPage(page_no).getList();
			response.getWriter().append(getNotive_listjson(list).toString());
		}if(method.equals("get_Unauditlist")){
			int page_no=Integer.parseInt(request.getParameter("page"));
			Condition condition=new Condition();
			condition.setState("待审核");
			List<normal_Notive>list=notive_service.createPage(condition,page_no).getList();
			response.getWriter().append(getNotive_listjson(list).toString());
		}if(method.equals("get_auditlist")){
			int page_no=Integer.parseInt(request.getParameter("page"));
			List<normal_Notive> list=notive_service.create_audit_Page(page_no).getList();
			response.getWriter().append(getNotive_listjson(list).toString());
		}if(method.equals("getaboutlist")){
			String username=request.getParameter("username");
			int page_no=Integer.parseInt(request.getParameter("page"));
			List<normal_Notive> list=notive_service.createPage(username,page_no).getList();
			response.getWriter().append(getNotive_listjson(list).toString());
		}if(method.equals("get_Unreadlist")){
			String username=request.getParameter("username");
			int page_no=Integer.parseInt(request.getParameter("page"));
			List<normal_Notive> list=notive_service.createPage(username,"未读", page_no).getList();
			response.getWriter().append(getNotive_listjson(list).toString());
		}if(method.equals("get_myNotive")){
			int page_no=Integer.parseInt(request.getParameter("page"));
			String username=request.getParameter("username");
			Condition condition=new Condition();
			condition.setAuthor(username);
			List<normal_Notive> list=notive_service.createPage(condition,page_no).getList();
			response.getWriter().append(getNotive_listjson(list).toString());
		}if(method.equals("query_admin")){
			Condition condition=new Condition();
            if(!request.getParameter("type").equals("全部")){
                condition.setType(request.getParameter("type"));
            }
            if(!request.getParameter("state").equals("全部")){
            	condition.setState(request.getParameter("state"));
            }if(request.getParameter("title")==null){
                condition.setTitle("");
            }else{
            	String N_title=(String)request.getParameter("title");
            	condition.setTitle(N_title);
            }
            condition.setRelease(request.getParameter("time"));
            List<normal_Notive> list=notive_service.getallNotivebycondition(condition);
            response.getWriter().append(getNotive_listjson(list).toString());
			
		}if(method.equals("query")){
			String username=request.getParameter("username");
			Condition condition=new Condition();
            if(!request.getParameter("type").equals("全部")){
                condition.setType(request.getParameter("type"));
            }
            if(!request.getParameter("state").equals("全部")){
            	condition.setState(request.getParameter("state"));
            }if(request.getParameter("title")==null){
                condition.setTitle("");
            }else{
            	String N_title=(String)request.getParameter("title");
            	condition.setTitle(N_title);
            }
            condition.setRelease(request.getParameter("time"));
            List<normal_Notive> list=notive_service.getallNotivebycondition(condition);
            response.getWriter().append(getNotive_listjson(list).toString());
		}
		if(method.equals("getdept")){
			List<Department> list=dept_service.get_dept_list();
			response.getWriter().append(get_deptJoson(list).toString());
		}if(method.equals("get_employee")){
			int dept_id=Integer.parseInt(request.getParameter("dept"));
			List<Employee> list=employee_service.get_employeelist(dept_id);
			response.getWriter().append(get_employeeJoson(list).toString());
		}if(method.equals("release_noitve")){
			normal_Notive new_notive=new normal_Notive();
			List<String> selected =get_selected_employee(request.getParameter("employee_selected"));
			create_Notive(new_notive,selected,Notive_content,request, response);
			save_data=new_notive;
			response.getWriter().append("success");
		}if(method.equals("change_noitve")){
			normal_Notive change_notive=new normal_Notive();
			String N_id=request.getParameter("N_id");
			List<String> selected =get_selected_employee(request.getParameter("employee_selected"));
			create_Notive(change_notive,selected,Notive_content,request, response);
			change_notive.setN_id(Integer.parseInt(N_id));
			save_data=change_notive;
			change=true;
			response.getWriter().append("success");
		}if(method.equals("delete")){
			String Notive_id=request.getParameter("N_id");
			if(notive_service.delect_Notive(Integer.parseInt(Notive_id))){
				response.getWriter().append("success");
			}else{
				response.getWriter().append("false");
			}
		}if(method.equals("get_moblie_content")){
			Notive_content=request.getParameter("content");
			if(Notive_content==null){
				Notive_content="";
				}
			save_data.setN_context(Notive_content);
			System.out.println("title:"+save_data.getN_title());
			System.out.println("content:"+Notive_content);
			if(change){
				notive_service.update(save_data);
				change=false;
				save_data=null;
			}else{
				notive_service.release(save_data);
				save_data=null;
			}
			response.sendRedirect("mobile_edit.jsp");
		}if(method.equals("get_selected_employee")){
			String Notive_id=request.getParameter("Notive_id");
			List<Employee> list=employee_service.get_selected_list(Integer.parseInt(Notive_id));
			response.getWriter().append(get_employeeJoson(list).toString());
		}if(method.equals("set_content")){
			String N_id=request.getParameter("N_id");
			System.out.println(N_id);
			change_content=notive_service.get_Notive(Integer.parseInt(N_id)).getN_context();
			HttpSession session=request.getSession();
			session.setAttribute("change_data", change_content);
			response.sendRedirect("mobile_edit_change.jsp");
		}if(method.equals("aduit")){
			Gson gson=new Gson();
			String a_state=request.getParameter("state");
			String N_id=request.getParameter("N_id");
			String release_time=request.getParameter("release_time");
			String begin_time=request.getParameter("begin_time");
			String end_time=request.getParameter("end_time");
		    normal_Notive audit_notive=new normal_Notive();
		    audit_notive.setN_id(Integer.parseInt(N_id));
		    audit_notive.setN_release_time(release_time);
		    audit_notive.setN_begin_time(begin_time);
		    audit_notive.setN_end_time(end_time);
		    if(notive_service.Noitve_audit(audit_notive, a_state)){
		    	response.getWriter().append("success");
			}else{
				response.getWriter().append("false");
			}
		}if(method.equals("read_notive")){
			String read_state=request.getParameter("state");
			int N_id=Integer.parseInt(request.getParameter("N_id"));
			String username=request.getParameter("username");
			notive_service.Notive_read(N_id, username, read_state);
			response.getWriter().append("success");
		}if(method.equals("get_employee_info")){
			String username=request.getParameter("username");
			List<Employee> list=new ArrayList<Employee>();
			list.add(employee_service.get_employee(username));
			response.getWriter().append(get_employeeJoson(list).toString());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	public JSONArray getNotive_listjson(List<normal_Notive> list){
		JSONArray json=JSONArray.fromObject(list);
		return json;
	}
	
	public JSONArray get_deptJoson(List<Department> list){
		JSONArray json=JSONArray.fromObject(list);
		return json;
	}
	
	public JSONArray get_employeeJoson(List<Employee> list){
		JSONArray json=JSONArray.fromObject(list);
		return json;
	}
	
	static void create_Notive(normal_Notive notive,List<String> list,String content,HttpServletRequest request, HttpServletResponse response){
		notive.setN_author(request.getParameter("user"));
		notive.setN_title(request.getParameter("title"));
		notive.setN_type(request.getParameter("type"));
		notive.setN_state(DEFAULT_STATE);
		notive.setN_top(request.getParameter("top"));
		notive.setN_release_time(request.getParameter("release_time"));
		notive.setN_begin_time(request.getParameter("begin_time"));
		notive.setN_end_time(request.getParameter("end_time"));
		notive.setN_context(content);
		notive.setLink_employee(list);
	}
	
	public List<String> get_selected_employee(String selected_employee){
		List<String> result = Arrays.asList(selected_employee.split(","));
		if(result.get(0).equals(""))result=null;
		return result;
	}
	
}
