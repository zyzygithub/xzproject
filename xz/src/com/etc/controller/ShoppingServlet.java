package com.etc.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.etc.entity.Message;
import com.etc.service.View_ShoppingCart_service;

/**
 * Servlet implementation class ShoppingServlet
 */
@WebServlet("/ShoppingServlet")
public class ShoppingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShoppingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session=request.getSession();
		String op=request.getParameter("op");
		PrintWriter out=response.getWriter();
		View_ShoppingCart_service vss=new View_ShoppingCart_service();
		if(op.equals("del")){
			int SCID=Integer.parseInt(request.getParameter("SCID"));
			vss.delShoppingCartByScid(SCID);
			
		}
		else if(op.equals("update")){
			int GOODID=Integer.parseInt(request.getParameter("GOODID"));
			int count=Integer.parseInt(request.getParameter("count"));
			vss.updateGoodsByGoodId(count,GOODID);
		
		}
		else if(op.equals("Balance")){
			int USERID=Integer.parseInt(request.getParameter("USERID"));
			int summoney=Integer.parseInt(request.getParameter("summoney"));
			vss.updateUserBalanceByUserid(summoney,USERID);
		}else if(op.equals("addmes")){
			int USERID=Integer.parseInt(request.getParameter("USERID"));
			int GOODSELER=Integer.parseInt(request.getParameter("GOODSELER"));
			int GOODID=Integer.parseInt(request.getParameter("GOODID"));
			Message mes=new Message(0,GOODID,USERID,null,null,GOODSELER,"[订单信息:]我已经购买了你的商品，请尽快发货");
			vss.addMes(mes);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request,response);
	}

}
