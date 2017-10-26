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

import com.etc.entity.View_ShoppingCart;
import com.etc.service.View_ShoppingCart_service;
import com.google.gson.Gson;

/**
 * Servlet implementation class View_ShoppingCart_servlet
 */
@WebServlet("/ViewShoppingCartServlet")
public class View_ShoppingCart_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    View_ShoppingCart_service vss=new View_ShoppingCart_service();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public View_ShoppingCart_servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

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
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		HttpSession session=request.getSession();
		String str=(String)session.getAttribute("str");
		String scid[]=str.split(",");
		List<View_ShoppingCart> list=new ArrayList();
		for(int i=0;i<scid.length;i++) {
			String s=scid[i].toString();
			int id=Integer.parseInt(s);
			
			List<View_ShoppingCart> list1=vss.getView_ShoppingCartByScId(id);
			list.addAll(list1);
		}
		PrintWriter out=response.getWriter();
		
		Gson g = new Gson();
		String jsonString = g.toJson(list);
//		/如果这里加了这句话，意味着视图那一层不需要JSON.parse
		//这里已经将返回的数据变成了json对象
		
		out.print(jsonString);
		out.close();
	}

}
