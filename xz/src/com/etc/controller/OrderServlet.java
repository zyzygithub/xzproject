package com.etc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.etc.entity.Order;
import com.etc.entity.OrderMes;
import com.etc.service.OrderMesService;
import com.etc.service.OrderService;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      OrderService os=new OrderService();
      OrderMesService oms=new OrderMesService();
 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderServlet() {
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
		String op=request.getParameter("op");
		PrintWriter out=response.getWriter();
		/**
		 * 
		 */
		if(op.equals("add")){
			int USERID=Integer.parseInt(request.getParameter("USERID"));
			int GOODSELER=Integer.parseInt(request.getParameter("GOODSELER"));
			String liuyan=request.getParameter("liuyan");
			//liuyan=new String(liuyan.getBytes("iso-8859-1"),"utf-8");
			int  GPID=Integer.parseInt(request.getParameter("GPID"));
			BigDecimal id=(BigDecimal)os.getGPid(GOODSELER);
			Order o=new Order(0,USERID,id.intValue(),GPID,null,liuyan,"´ý·¢»õ",null);
			boolean flag=os.addOrder(o);
			List<Order> list=new ArrayList<Order>();
			list=os.getAllOrderMax();
			
			for (Order order : list) {
					int orderid=order.getORDERID();
					int goodId=Integer.parseInt(request.getParameter("GOODID"));
					int count=Integer.parseInt(request.getParameter("count"));
					OrderMes mes=new OrderMes(0,goodId,count,orderid);
					boolean flag2=oms.addOrderMes(mes);
			}
			list=null;
				
			}
}
		
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
