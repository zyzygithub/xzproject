package com.etc.controller;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.etc.service.userJudge;

/**
 * Servlet Filter implementation class personalFilter
 */
@WebFilter(urlPatterns={"/account.jsp"
		,"/account_comment.jsp"
		,"/account_message.jsp"
		,"/accountgoodsup.jsp"
		,"/accountnopassaudit.jsp"
		,"/accountpassaudit.jsp"
		,"/accountwaitpassaudit.jsp"
		,"/addBalance.jsp"
		,"/UpdateInfo.jsp"
		,"/mylike.jsp"
		,"/shoppingcart.jsp"
		,"/pay.jsp"
		,"/wo.jsp"
		})
public class personalFilter implements Filter {

    /**
     * Default constructor. 
     */
    public personalFilter() {
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
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here

		// pass the request along the filter chain
		
		HttpServletRequest request=(HttpServletRequest)req;
		HttpServletResponse response=(HttpServletResponse)resp;
		response.setCharacterEncoding("gbk");
		  HttpSession session=request.getSession();
		  String user=(String)session.getAttribute("user1");
		if(user==null) {
			response.getWriter().println("<script>alert('请先登录');location.href='mainshow.jsp'</script>");
			
		}else {
			
			userJudge uj=new userJudge();
			boolean u=uj.judge(user);
			if(u) {
		chain.doFilter(request, response);
			}
			else {
				response.getWriter().println("<script>alert('你已被禁用！');location.href='mainshow.jsp'</script>");
			}
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
