package com.etc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.etc.cms.util.MyDataTableData;
import com.etc.entity.Account_Message;
import com.etc.service.Account_MessageService;
import com.google.gson.Gson;

/**
 * Servlet implementation class Account_MessageServlet
 */
@WebServlet("/Account_MessageServlet")
public class Account_MessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Account_MessageService ams = new Account_MessageService();
   
   

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
        String pename = "";

		

		if (request.getParameter("pename") != null) {
			pename = request.getParameter("pename");
		}

		//数据起始位置
	    String start = "0";
		if(request.getParameter("start")!=null)
		{
			start = request.getParameter("start");
		}
		
	    //数据长度
	    String length ="5";
	  //数据起始位置
	    if(request.getParameter("length")!=null)
		{
	    	length = request.getParameter("length");
		}
		
		
	  //查询并返回所有数据 的格式要注意咯
		List<Account_Message> list=ams.getAllMessage();
		
		MyDataTableData<Account_Message> mydata = new MyDataTableData<Account_Message>();
		mydata.setData(list);
		
		//返回json对象
		Gson gson = new Gson();
		String jsonString = new Gson().toJson(mydata);
	
		PrintWriter out = response.getWriter();
		out.print(jsonString);

		out.close();

	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		
		//查询并返回所有数据 的格式要注意咯
		List<Account_Message> list=ams.getAllMessage();
		
		MyDataTableData<Account_Message> mydata = new MyDataTableData<Account_Message>();
		mydata.setData(list);
		
		//返回json对象
		Gson gson = new Gson();
		String jsonString = new Gson().toJson(mydata);
	
		PrintWriter out = response.getWriter();
		out.print(jsonString);

		out.close();
	}

}
