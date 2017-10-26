package com.etc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.etc.entity.User;
import com.etc.service.UserService;
import com.google.gson.Gson;


/**
 * Servlet implementation class Account_Servlet_money
 */
@WebServlet("/Account_Servlet_money")
public class Account_Servlet_money extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserService us=new UserService();
	List<User> list = new ArrayList<>();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		//response.setContentType("application/json");		
		String info="";
		String op=request.getParameter("op");
		String p_userName="";
		String p_userCheckName="";
		if(op!="") {
			if(op.equals("isUser")) {
				if(request.getParameter("p_userName")!="") {
					p_userName=request.getParameter("p_userName");
					if(us.getUserByName(p_userName).size()==0){
						info="用户名不存在";
					}
					
				}
				
			}
			if(op.equals("checkName")) {
				if(request.getParameter("p_userName")!="" && request.getParameter("p_userCheckName")!="") {
					p_userName=request.getParameter("p_userName");
					p_userCheckName=request.getParameter("p_userCheckName");
					if(!p_userName.equals(p_userCheckName)) {
						info="两次用户名不一致";
					}
					
				}else {
					info="用户名不能为空";
				}
			}
			if(op.equals("addMoney")) {
				p_userCheckName=request.getParameter("p_userCheckName");
				if(request.getParameter("p_balance")!="") {
					double p_balance=Double.parseDouble(request.getParameter("p_balance"));
					if(p_balance>=0) {
						boolean flag=us.UpdateBalanceByName(p_userCheckName, p_balance);
						double balance=us.getUserByName(p_userCheckName).get(0).getUSERBALANCE();
						info=(flag==true)?"已为用户[ "+p_userCheckName+" ]充值成功,当前账户余额为￥"+balance:"充值失败，请重新充值";
					}
					else {
						info="充值金额不能小于0元";
					}
					
				}else{
					info="请输入充值金额";
				}
			}
			
		}
		
		PrintWriter out=response.getWriter();
		out.print(info);
		out.close();
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
