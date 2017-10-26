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

import com.etc.entity.GoodPosition;
import com.etc.entity.User;
import com.etc.service.GoodPositionService;
import com.etc.service.UserService;
import com.google.gson.Gson;

/**
 * Servlet implementation class GoodPositionServlet
 */
@WebServlet("/GoodPositionServlet")
public class GoodPositionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      GoodPositionService gs=new GoodPositionService();
      UserService us=new UserService();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoodPositionServlet() {
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
		int userid=0;
		String username=(String)session.getAttribute("user1");
		List<User> userlist=us.getOneUser(username);
		for (User user : userlist) {
			 userid=user.getUSERID();
		}
		if(op.equals("select")){
			List<GoodPosition> list =gs.getAllGoodPositionById(userid);
			response.setContentType("application/json");
			Gson g = new Gson();
			String jsonString = g.toJson(list);
			//如果这里加了这句话，意味着视图那一层不需要JSON.parse
			//这里已经将返回的数据变成了json对象
		
			out.print(jsonString);
			out.close();
		}
		if(op.equals("add")){
			String user_name=request.getParameter("user_name");
			//user_name=new String(user_name.getBytes("iso-8859-1"),"utf-8");
			String user_phone=request.getParameter("user_phone");
			String user_intro=request.getParameter("address");
			//user_intro=new String(user_intro.getBytes("iso-8859-1"),"utf-8");
			GoodPosition gp=new GoodPosition(0,userid,user_intro,user_phone,user_name);
			boolean flag=gs.addGoodPositionById(gp);
			List<GoodPosition> list =gs.getAllGoodPositionById(userid);
			response.setContentType("application/json");
			Gson g = new Gson();
			String jsonString = g.toJson(list);
			//如果这里加了这句话，意味着视图那一层不需要JSON.parse
			//这里已经将返回的数据变成了json对象
			
			out.print(jsonString);
			out.close();
		}
		if(op.equals("del")){
			int gpid=Integer.parseInt(request.getParameter("gpid"));
			boolean flag=gs.delGoodPositionById(gpid);
			List<GoodPosition> list =gs.getAllGoodPositionById(userid);
			response.setContentType("application/json");
			Gson g = new Gson();
			String jsonString = g.toJson(list);
			//如果这里加了这句话，意味着视图那一层不需要JSON.parse
			//这里已经将返回的数据变成了json对象
			
			out.print(jsonString);
			out.close();
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
