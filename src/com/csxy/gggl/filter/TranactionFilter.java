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
			//1.获取连接
			connection=JDBCUtils.getConnection();
			
			System.out.println("110");
			
			//2.开启事务(屏蔽自动提交实现事务回归)
			connection.setAutoCommit(false);
			
			//3.利用ThreadLocal 把连接和当前线程绑定
			ConnectionContext.getinstance().bind(connection);
			
			//4.把请求转发给目标Servlet
			chain.doFilter(request, response);
			
			//5.提交事务
			connection.commit();
		} catch(SQLException e){
			e.printStackTrace();
			
			//6.回滚事务
			try{
				connection.rollback();
			} catch(SQLException e1){
				e1.printStackTrace();
			}
			HttpServletRequest req=(HttpServletRequest)request;
			HttpServletResponse resp=(HttpServletResponse)response;
			resp.sendRedirect(req.getContextPath()+"/error-1.jsp");
		} finally {
			//7.解除绑定
			ConnectionContext.getinstance().remove();
			
			//8.关闭连接
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
