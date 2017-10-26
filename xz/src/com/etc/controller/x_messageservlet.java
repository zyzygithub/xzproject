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

import com.etc.cms.util.BaseDao;
import com.etc.cms.util.MyDataTableData;
import com.etc.cms.util.PageData;
import com.etc.entity.User;
import com.etc.entity.X_MESSAGEALL;
import com.etc.entity.X_MESSAGEALL;
import com.etc.service.X_messageall_service;
import com.google.gson.Gson;

/**   
 * Servlet implementation class x_messageservlet
 */
@WebServlet("/x_messageservlet")
public class x_messageservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       X_messageall_service xms = new X_messageall_service();
   
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doPost(request, response);
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		String op=request.getParameter("op");
	
        String pename = "";
        HttpSession session=request.getSession();
		  String username=(String)session.getAttribute("user1");
        int page = 1;
		int pageSize = 10;
		String USERNAME="";
		String GOODTITLE="";
		String content="";
		int GOODID;
		int FROMID;
		int TOID;
		String sendname="";
		BaseDao bd=new BaseDao();
		PageData<X_MESSAGEALL> pd=null;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		if (request.getParameter("pageSize") != null) {
			pageSize = Integer.parseInt(request
					.getParameter("pageSize"));
		}

		if (request.getParameter("pename") != null) {
			pename = request.getParameter("pename");
		}
		
		if (request.getParameter("GOODID") != null) {
			GOODID = Integer.parseInt(request.getParameter("GOODID"));
			}
		if (request.getParameter("FROMID") != null) {
				FROMID = Integer.parseInt(request.getParameter("FROMID"));
				}
		if (request.getParameter("TOID") != null) {
					TOID = Integer.parseInt(request.getParameter("TOID"));
					}
		if(request.getParameter("content")!=null){
			content =request.getParameter("content");
		}
		
		//模拟登录用户的id
		
		
		
		if(op.equals("addmes")){
			int toid=Integer.parseInt(request.getParameter("toid1"));
			int fromid=Integer.parseInt(request.getParameter("fromid2"));
			int goodid1=Integer.parseInt(request.getParameter("goodid"));
			String content1=request.getParameter("content");
			//content1=new String(content1.getBytes("iso-8859-1"),"utf-8");
	
			boolean flag=xms.addMessage(goodid1, fromid, toid, content1);
			
		}else if(op.equals("updatemes")){
			//接收传过来的值
			int messageid = Integer.parseInt(request.getParameter("messageid"));
			
			boolean flag= xms.update(messageid);
			
		}else if(op.equals("allmes")){
			
			if(request.getParameter("key1")!=null){
				
				USERNAME =request.getParameter("key1");
				//USERNAME=new String(USERNAME.getBytes("iso-8859-1"),"utf-8");
			}
			if(request.getParameter("key1")!=null){
			    GOODTITLE=request.getParameter("key1");
				//GOODTITLE =new String(GOODTITLE.getBytes("iso-8859-1"),"utf-8");
			}
			
	
		pd=xms.getAllMESSAGEByPage(page,pageSize,USERNAME,GOODTITLE,username);
		request.setAttribute("USERNAME", USERNAME);
		request.setAttribute("MESSAGECONTENT", GOODTITLE);
//		/如果这里加了这句话，意味着视图那一层不需要JSON.parse
		//这里已经将返回的数据变成了json对象
		for (X_MESSAGEALL xml : pd.getData()) {
			List<User> user=(List<User>)bd.select("select * from X_USER WHERE USERID=?",User.class,xml.getFROMID());
		    for (User user2 : user) {
				xml.setFROMID(user2.getUSERNAME());
			}
		}
		
		
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		//返回json对象
		Gson gson = new Gson();
		
		String jsonString = gson.toJson(pd);
		
		out.print(jsonString);
		out.close();
		}
		else if(op.equals("find")){
			String messagestate=request.getParameter("key1");
			//messagestate=new String(messagestate.getBytes("iso-8859-1"),"utf-8");
			
			pd =xms.getMessage(messagestate,page,pageSize,username);
			
			
			for (X_MESSAGEALL xml : pd.getData()) {
				List<User> user=(List<User>)bd.select("select * from X_USER WHERE USERID=?",User.class,xml.getFROMID());
			    for (User user2 : user) {
					xml.setFROMID(user2.getUSERNAME());
				}
			}
			
			
			response.setContentType("application/json");
			
			
			
			
			PrintWriter out = response.getWriter();
			//返回json对象
			Gson gson = new Gson();
			
			String jsonString = gson.toJson(pd);
			
			out.print(jsonString);
			out.close();
			
		}
		else if(op.equals("del")){
			
		}
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");

		String messagestate="";
		int page=1;
		int pageSize=5;
		//查询并返回所有数据 的格式要注意咯
		
		//返回json对象
		Gson gson = new Gson();
		
		
	}

}
