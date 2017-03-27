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

import com.csxy.gggl.domain.Notive;
import com.csxy.gggl.domain.User;
import com.csxy.gggl.service.Notive_service;
import com.csxy.gggl.utils.conversion_utils;
import com.csxy.gggl.utils.run_state_Utils;
import com.csxy.gggl.web.Condition;
import com.csxy.gggl.web.Page;;

/**
 * Servlet implementation class Notive_servlet
 */
@WebServlet("/Notive_servlet")
public class Notive_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
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
		
		System.out.println(methodName);
		
		if(methodName.equals("release")){
			Notive new_notive=new Notive();
			create_Notive(new_notive, user, request, response);
			if(notive_service.release(new_notive)){
				Notive_servlet.getPage(notive_service.getNotive(),notive_service, session);
				response.sendRedirect("main.jsp");
			};
		}
		
		if(methodName.equals("getPage")){
			Notive_servlet.getPage(notive_service.getNotive(),notive_service, session);
			response.sendRedirect("main.jsp");
		}
		
		if(methodName.equals("delect")){
			if(notive_service.delect_Notive(Integer.parseInt(request.getParameter("delect")))){
				getPage(notive_service.getNotive(),notive_service, session);
				System.out.println("删除成功");
				response.sendRedirect("main.jsp");
			}
		}
		
		if(methodName.equals("query")){
            Condition condition=new Condition();
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
            if(!request.getParameter("run_state").equals("全部")){
                condition.setRun_state(request.getParameter("run_state"));
            }
			getPage(notive_service.getNotivebycondition(condition), notive_service, session);
			response.sendRedirect("massage.jsp");
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
	
	static Notive create_Notive(Notive notive,User user,HttpServletRequest request, HttpServletResponse response){
		notive.setN_author(user.getU_id());
		notive.setN_title(request.getParameter("title"));
		notive.setN_type(request.getParameter("type"));
		notive.setN_state(request.getParameter("state"));
		notive.setN_top(request.getParameter("top"));
		notive.setN_release_time(request.getParameter("release_time"));
		notive.setN_begin_time(request.getParameter("begin_time"));
		notive.setN_end_time(request.getParameter("end_time"));
		notive.setN_run_state(run_state_Utils.return_state(notive.getN_begin_time(), notive.getN_end_time()));
		notive.setN_context(request.getParameter("content"));
		return notive;
	}
	static void getPage(List<Notive> list,Notive_service notive_service,HttpSession session){
		Page<Notive> page=notive_service.getPage(list);
		session.setAttribute("Page",page);
	}
}
