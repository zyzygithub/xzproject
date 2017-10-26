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
import javax.servlet.http.HttpSession;

import com.etc.entity.ShoppingCart;
import com.etc.entity.User;
import com.etc.entity.View_ShoppingCart;
import com.etc.service.GoodsService;
import com.etc.service.ShoppingService;
import com.etc.service.UserService;
import com.etc.service.View_ShoppingCart_service;

/**
 * Servlet implementation class CartServlet2
 */
@WebServlet("/CartServlet2")
public class CartServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserService us=new UserService();
	View_ShoppingCart_service vss=new View_ShoppingCart_service();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String user1 = session.getAttribute("user1").toString();
		String op = request.getParameter("op");
		PrintWriter out=response.getWriter();
		
		ShoppingService ss = new ShoppingService();
		List<ShoppingCart> list1 = new ArrayList();
		//����һ�����ϣ�������Щ��ͼ��û�е�����
		List<ShoppingCart> list = new ArrayList();
		list1 = ss.getcart(user1);
		for (ShoppingCart shoppingCart : list1) {
			int selerid=shoppingCart.getGOODSELER();
			String name=(String)ss.getSelerName(selerid);
			shoppingCart.setSELERNAME(name);
			list.add(shoppingCart);
		}

		/**
		 * �û���Ϊ����ʾ���û��Ĺ��ﳵ
		 */
		if (op.equals("ck")) {
			request.setAttribute("bin", "bin");
			request.setAttribute("list", list);
			request.getRequestDispatcher("shoppingcart.jsp").forward(request, response);

		}
		/**
		 * �û���Ϊ�շ��ص�¼����
		 */
		if (op.equals("nock")) {

			response.sendRedirect("pay2.jsp");
		}
		/**
		 * ��ӹ��ﳵ
		 *//*
		if (op.equals("addTOSC")) {

			String goodid = request.getParameter("goodId");
			String count = request.getParameter("goodCount");
			String username = request.getParameter("username");
		}*/
		/*
		 * ɾ����ǰ�û���ѡ��Ļ���
		 */
		if (op.equals("del")) {
			String goodid = request.getParameter("id");
			int goodsid = Integer.valueOf(goodid);
			
			ss.del(goodsid, user1);
			request.getRequestDispatcher("shoppingcart.jsp").forward(request, response);
		}
		/**
		 * �޸Ĺ��ﳵ
		 */
		if (op.equals("update")) {
			int scid=Integer.parseInt(request.getParameter("scid"));
			int goodscount=Integer.parseInt(request.getParameter("goodcount"));
		
			ss.updateShoppingCart(goodscount, scid);
			out.println("");
			out.close();
		}
		if(op.equals("delall")){
			int userid=Integer.parseInt(request.getParameter("userid"));
			
			ss.delAllShoppingCart(userid);
			request.getRequestDispatcher("shoppingcart.jsp").forward(request, response);
		}
		if(op.equals("jiesuan")) {
			String str=request.getParameter("str");
			session.setAttribute("str", str);
			response.sendRedirect("pay.jsp");
		}
		//��������
		if(op.equals("zhijie")){
			int count=Integer.parseInt(request.getParameter("count"));
			int goodid=Integer.parseInt(request.getParameter("goodid"));
			List<User> list2=us.getOneUser(user1);
			//�õ��û�id
			int id=0;
			for (User user : list2) {
				 id=user.getUSERID();
			}
			List<View_ShoppingCart> list3=vss.getSC(id, goodid);
			if(list3.size()==0){
				vss.addShoppingCart(goodid, count, id);
				BigDecimal scid=(BigDecimal)vss.getSCid(id);
				String str=scid.toString();
				session.setAttribute("str", str);
			}else{
				for (View_ShoppingCart view_ShoppingCart : list3) {
					int scid=view_ShoppingCart.getSCID();
					vss.updateScCount(count, scid);
					String str=scid+"";
					session.setAttribute("str", str);
				}
			}
			
			response.sendRedirect("pay.jsp");
			
		}

	}

}
