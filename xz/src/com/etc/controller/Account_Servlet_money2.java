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
@WebServlet("/Account_Servlet_money2")
public class Account_Servlet_money2 extends HttpServlet {
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
		if(request.getParameter("p_userName")!="") {
			String p_userName=request.getParameter("p_userName");
			if(us.getUserByName(p_userName).size()!=0){
				if(request.getParameter("p_balance")!="") {
					double p_balance=Double.parseDouble(request.getParameter("p_balance"));
		
					boolean flag=us.UpdateBalanceByName(p_userName, p_balance);
					String name=us.getUserByName(p_userName).get(0).getUSERNAME();
					double balance=us.getUserByName(p_userName).get(0).getUSERBALANCE();
					info=(flag==true)?"已为用户[ "+name+" ]充值成功,当前账户余额为￥"+balance:"充值失败，请重新充值";
				}else{
					info="请输入充值金额";
				}
			}else{
				info="不存在该用户";
			}
			
		}else{
			info="请输入身份证号";
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
