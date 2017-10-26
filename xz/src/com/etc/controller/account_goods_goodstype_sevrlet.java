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
 * Servlet implementation class account_goods_goodstype_sevrlet
 */
@WebServlet("/account_goods_goodstype_sevrlet")
public class account_goods_goodstype_sevrlet extends HttpServlet {
	
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
	  String upanddown="up";
	  
	 
	  
	  if(flag.equals("allup")) {
		  account_goods_goodstypeserives agg=new account_goods_goodstypeserives();
			PageData<GOODS_GOODSTYPE> pd=agg.selectOracle(user,page, pagesize,blurry,order,upanddown);
			
			request.setAttribute("pd", pd);
			request.getRequestDispatcher("accountpassaudit.jsp").forward(request, response);
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
				
				
	  }if(flag.equals("downgoods")) {
		  int goodid=Integer.parseInt(request.getParameter("goodid"));
		  account_goods_goodstypeserives agg=new account_goods_goodstypeserives();
		  agg.downgoods(goodid);
		  return;
	  }if(flag.equals("update")) {
		  int id=0;
		  String gdname="";
		  double price=0;
		  int count=0;
		  String downdate="";
		  String text="";

		  
		  if(!request.getParameter("id").equals("")) {
				id=Integer.parseInt(request.getParameter("id"));
			}if(!request.getParameter("name").equals("")) {
				gdname=request.getParameter("name");
			}if(!request.getParameter("price").equals("")) {
				price=Double.parseDouble(request.getParameter("price"));
			}if(!request.getParameter("count").equals("")) {
				count=Integer.parseInt(request.getParameter("count"));
			}if(!request.getParameter("text").equals("")) {
				text=request.getParameter("text");
			}
			
			 account_goods_goodstypeserives agg=new account_goods_goodstypeserives();
				
			boolean b=agg.upda(id,gdname,price,count,"",text);
			
			 Gson gson=new Gson();
				
				String jsonpd=gson.toJson(b);
				
				PrintWriter pw=response.getWriter();
				pw.print(jsonpd);
				pw.close();
	  }
	  
	  
	  
	}
}
	