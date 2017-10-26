package com.etc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.etc.cms.util.GoodsDetails;
import com.etc.cms.util.GoodsSeller;
import com.etc.cms.util.PageData;
import com.etc.dao.GoodsDao;
import com.etc.dao.UserDao;
import com.etc.entity.Goods;
import com.etc.entity.User;
import com.etc.service.GoodsService;
import com.etc.service.UserService;
import com.google.gson.Gson;

/**
 * Servlet implementation class GoodsServlet
 */
@WebServlet("/GoodsServlet")
public class GoodsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserService us=new UserService();
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GoodsServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		GoodsService gs = new GoodsService();
		HttpSession session = request.getSession();
		String op = request.getParameter("op");
		String key = "";
		String typename = "";
		String gsonStr = "";
		int priceDown=0;
		int priceUp=99999;
		if(request.getParameter("priceDown")!=null) {
			priceDown=Integer.valueOf(String.valueOf(request.getParameter("priceDown")));
		}
		if(request.getParameter("priceUp")!=null) {
			priceUp=Integer.valueOf(String.valueOf(request.getParameter("priceUp")));
		}
		PageData<GoodsDetails> goodPd = null;
		int goodId = 0;
		if (request.getParameter("goodId") != null) {
			goodId = Integer.parseInt(request.getParameter("goodId"));
		}
		String userName = "";
		if (session.getAttribute("user1") != null) {
			userName = String.valueOf(session.getAttribute("user1"));
		}
		Gson gson = new Gson();
		PrintWriter out = response.getWriter();
		int page = 1;
		if (request.getParameter("page") != null) {
			
			page = Integer.parseInt(request.getParameter("page"));
		}
		switch (op) {
		// 获取商品详情
		case "getGD":
			List<GoodsDetails> list = gs.getGD(goodId);
			GoodsDetails gd = list.get(0);
			request.setAttribute("gd", gd);
			request.getRequestDispatcher("single.jsp").forward(request, response);
			break;
		//获取最新6条商品信息
		case "getHostGoods":
			typename=request.getParameter("type");
			List<Goods> glist = gs.getHostGoods(typename);
			gsonStr = gson.toJson(glist);
			out.print(gsonStr);
			out.close();
			break;
		//加入购物车部分
		case "addToSC":
			int goodCount = 1;
			if (request.getParameter("goodCount") != null) {
				goodCount = Integer.valueOf(request.getParameter("goodCount"));
			}
			
			int SCCount = gs.addToSC(goodId, goodCount, userName);
			gsonStr = gson.toJson(SCCount);
			out.print(gsonStr);
			out.close();
			break;
		//以商品大类型获取商品，跳转部分
		case "getGoodsByType":
			typename = request.getParameter("key"); // new																					// String(request.getParameter("key").getBytes("iso-8859-1"),"utf-8");
			goodPd = gs.getGoodsByType(page, typename,priceDown,priceUp);
			request.setAttribute("typeKey", typename);
			request.setAttribute("goodPd", goodPd);
			request.getRequestDispatcher("mainshowmes.jsp").forward(request, response);
			break;
		//以商品大类型获取商品，ajax部分
		case "getGoodsByTypePage":
			typename = request.getParameter("key");
			PageData<GoodsDetails> goodPdPage = gs.getGoodsByType(page, typename,priceDown,priceUp);
			gsonStr = gson.toJson(goodPdPage);
			
			out.print(gsonStr);
			out.close();
			break;
		//搜索商品，跳转部分
		case "searchGoods":
			key = request.getParameter("key");
			goodPd = gs.searchGoods(page, key,priceDown,priceUp);
			request.setAttribute("key", key);
			request.setAttribute("goodPd", goodPd);
			request.getRequestDispatcher("mainshowmes.jsp").forward(request, response);
			break;
		//搜索商品，分页部分
		case "searchGoodsPage":
			response.setContentType("application/json");
			key = request.getParameter("key");
			PageData<GoodsDetails> pd = gs.searchGoods(page, key,priceDown,priceUp);
			gsonStr = gson.toJson(pd);
			out.print(gsonStr);
			out.close();
			break;			
		case "getSellGood":
			String username=request.getParameter("taname");
			List<User> list2=UserDao.getUserByName(username);
			if(list2.size()==0) {
				session.setAttribute("mainmsg", "该用户不存在");
				response.sendRedirect("mainshow.jsp");
			}else {
				request.setAttribute("taname", request.getParameter("taname"));
				request.getRequestDispatcher("wo.jsp").forward(request, response);
				break;
			}
			
		case "getSellGoodByPage":
			response.setContentType("application/json");
			/* 默认分页参数设置 */

			/*
			 * if (request.getParameter("pagesize") != null) { pagesize =
			 * Integer.parseInt(request.getParameter("pagesize")); }
			 */
			Gson gson1 = new Gson();
			String taname = request.getParameter("taname");
			PageData<GoodsSeller> tagood = GoodsDao.getsalegood(page, 3, taname);
			for (GoodsSeller liSeller : tagood.getData()) {
			}
			String strpd = gson1.toJson(tagood);
			out.print(strpd);
			out.close();
			break;
		// 作者： 张媛
		case "getOutGoosByPage":
			response.setContentType("application/json");
			/* 默认分页参数设置 */

			if (request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			}

			/*
			 * if (request.getParameter("pagesize") != null) { pagesize =
			 * Integer.parseInt(request.getParameter("pagesize")); }
			 */
			Gson gson2 = new Gson();

			String taname1 = request.getParameter("taname"); 
			List<User> list3=UserDao.getOneUser(taname1);
			int id=0;
			for (User user : list3) {
				id=user.getUSERID();
			}
			PageData<GoodsSeller> taoutgood = GoodsDao.getoutgoos(page, 3, id);
			String pd1 = gson2.toJson(taoutgood);
			out.print(pd1);
			out.close();
			break;

		}
	}

}
