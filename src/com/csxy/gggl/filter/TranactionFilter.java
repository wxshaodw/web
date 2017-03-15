package com.csxy.gggl.filter;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.csxy.gggl.db.JDBCUtils;
import com.csxy.gggl.web.ConnectionContext;

/**
 * Servlet Filter implementation class TranactionFilter
 */
@WebFilter("/TranactionFilter")
public class TranactionFilter implements Filter {

    /**
     * Default constructor. 
     */
    public TranactionFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		Connection connection =null;
		
		try{
			//1.��ȡ����
			connection=JDBCUtils.getConnection();
			
			System.out.println("110");
			
			//2.��������(�����Զ��ύʵ������ع�)
			connection.setAutoCommit(false);
			
			//3.����ThreadLocal �����Ӻ͵�ǰ�̰߳�
			ConnectionContext.getinstance().bind(connection);
			
			//4.������ת����Ŀ��Servlet
			chain.doFilter(request, response);
			
			//5.�ύ����
			connection.commit();
		} catch(SQLException e){
			e.printStackTrace();
			
			//6.�ع�����
			try{
				connection.rollback();
			} catch(SQLException e1){
				e1.printStackTrace();
			}
			HttpServletRequest req=(HttpServletRequest)request;
			HttpServletResponse resp=(HttpServletResponse)response;
			resp.sendRedirect(req.getContextPath()+"/error-1.jsp");
		} finally {
			//7.�����
			ConnectionContext.getinstance().remove();
			
			//8.�ر�����
			JDBCUtils.release(connection);
		}
	
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
