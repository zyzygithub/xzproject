package com.etc.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.etc.cms.util.PageData;
import com.etc.entity.GOODS_GOODSTYPE;
import com.etc.service.account_goods_goodstypeserives;
import com.google.gson.Gson;

/**
 * Servlet implementation class Accountwaitaudit
 */
@WebServlet("/Accountwaitaudit")
public class Accountwaitaudit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String flag =request.getParameter("flag");
		  HttpSession session=request.getSession();
		  String user=(String)session.getAttribute("user1");
		  
		  int page=1;
		  int pagesize=3;
		  String blurry="";
		  String order="asc";
		  String upanddown="´ýÉóºË";
		  
		 
		  
		  if(flag.equals("allup")) {
			  account_goods_goodstypeserives agg=new account_goods_goodstypeserives();
				PageData<GOODS_GOODSTYPE> pd=agg.selectOracle(user,page, pagesize,blurry,order,upanddown);
				
				request.setAttribute("pd", pd);
				request.getRequestDispatcher("accountwaitaudit.jsp").forward(request, response);
				return;
				
		  }
		  
		  if(flag.equals("search")) {
			
					if(!request.getParameter("user").equals("")) {
						user=request.getParameter("user");
					}if(!request.getParameter("page").equals("")) {
						page=Integer.parseInt(request.getParameter("page"));
					}if(!request.getParameter("pagesize").equals("")) {
						pagesize=Integer.parseInt(request.getParameter("pagesize"));
					}if(!request.getParameter("blurry").equals("")) {
						blurry=request.getParameter("blurry");
					}if(!request.getParameter("order").equals("")) {
						order=request.getParameter("order");
					}if(!request.getParameter("upanddown").equals("")) {
						upanddown=request.getParameter("upanddown");
					}
					 account_goods_goodstypeserives agg=new account_goods_goodstypeserives();
						
					 PageData<GOODS_GOODSTYPE> pd=agg.selectOracle(user,page, pagesize,blurry,order,upanddown);
						
					 for (GOODS_GOODSTYPE admin : pd.getData()) {
							
						}
					 
					 Gson gson=new Gson();
						
						String jsonpd=gson.toJson(pd);
						
						PrintWriter pw=response.getWriter();
						pw.print(jsonpd);
						pw.close();
					
					
		  }if(flag.equals("dele")) {
			
					int id=Integer.parseInt(request.getParameter("goodid"));
			         //È¥É¾³ý
				
					 account_goods_goodstypeserives agg=new account_goods_goodstypeserives();
					 boolean b=agg.deleone(id);
					 Gson gson=new Gson();
						
						String jsonpd=gson.toJson(b);
					
						PrintWriter pw=response.getWriter();
						pw.print(jsonpd);
						pw.close();
					
		  }
	}

}
