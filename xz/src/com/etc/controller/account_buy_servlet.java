package com.etc.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.etc.cms.util.PageData;
import com.etc.entity.PERSONGOODS_IN;
import com.etc.service.account_buy_serives;
import com.google.gson.Gson;

/**
 * Servlet implementation class account_buy_servlet
 */
@WebServlet("/account_buy_servlet")
public class account_buy_servlet extends HttpServlet {
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
		
		String flag=request.getParameter("flag");
		String inorout=request.getParameter("inorout");
		//一些初始属性
		String user="";
		int page=1;
		int pagesize=5;
		String blurry="";
		String order="asc";
		String state="";
		

		
		
		//一开始先确定一些参数
		if(!flag.equals("evaluate") && !flag.equals("realsend") && !flag.equals("affirm")) {
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
		}if(!request.getParameter("state").equals("")) {
			state=request.getParameter("state");
		}
		}
		
		//一开始先确定一些参数
		
		PageData pd = null;
		if(flag.equals("search")) {

			
		
			account_buy_serives abs=new account_buy_serives();

			pd=abs.get_waitDelivery(user,page,pagesize,blurry,order,state,inorout);

			
		}if(flag.equals("evaluate")) {
			account_buy_serives abs=new account_buy_serives();

			String username=request.getParameter("username");
			String sendid=request.getParameter("sendid");
			//String date=request.getParameter("date");
			int score=Integer.parseInt(request.getParameter("score"));
			String text=request.getParameter("text");
			int orderid=Integer.parseInt(request.getParameter("orderid"));
			abs.addevaluate(username,0,"",score,text,orderid);
			return;
		}
		//送货事物
		if(flag.equals("realsend")) {
			account_buy_serives abs=new account_buy_serives();

			String me=request.getParameter("me");
			int orderid=Integer.parseInt(request.getParameter("orderid"));
			String gdname=request.getParameter("gdname");
			String he=request.getParameter("he");
			boolean b=abs.realsend(orderid,me,he,gdname);
			
			Gson gson=new Gson();
			
			String jsonpd=gson.toJson(b);
			PrintWriter pw=response.getWriter();
			pw.print(jsonpd);
			pw.close();
			
			return;
		}
		if(flag.equals("affirm")) {
			account_buy_serives abs=new account_buy_serives();

			String me=request.getParameter("me");
			int orderid=Integer.parseInt(request.getParameter("orderid"));
			String gdname=request.getParameter("gdname");
			String he=request.getParameter("he");
	      
			boolean b=abs.affirm(orderid,me,he,gdname);
			
			Gson gson=new Gson();
			
			String jsonpd=gson.toJson(b);
			
			PrintWriter pw=response.getWriter();
			pw.print(jsonpd);
			pw.close();
			
			return;
		}
		

		Gson gson=new Gson();
		
		String jsonpd=gson.toJson(pd);
		
		PrintWriter pw=response.getWriter();
		pw.print(jsonpd);
		pw.close();
		
	}

}
