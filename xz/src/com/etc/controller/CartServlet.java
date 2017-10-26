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
import javax.servlet.http.HttpSession;

import com.etc.cms.util.PageData;
import com.etc.entity.Like;
import com.etc.entity.Types;
import com.etc.entity.User;
import com.etc.service.LikeService;
import com.etc.service.ShoppingService;
import com.etc.service.ShowmainService;
import com.etc.service.UserService;
import com.google.gson.Gson;

/**
 * Servlet implementation class EmpServlet
 */
@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	UserService us = new UserService();
	ShoppingService ss = new ShoppingService();
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CartServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
		HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession  session =request.getSession();

		String op = request.getParameter("op");
		
			if(op != null) {
				
				//用户主界面显示特定用户的购物车个数
				if (op.equals("unitcart")) {
					
					// 使用printWriter对象
					PrintWriter out = response.getWriter();
			
					String username = (String) session.getAttribute("user1");
					
					// 调用service的查询类型方法返回购物车个数
					int count1 = ss.getCartCount(username);
				
					String mes1="";
					mes1 = count1+"";
					out.print(mes1);
					out.close();
					return;	
					
				} 
				//
					
			}
	}

}
