package com.etc.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.etc.cms.util.MessageDetails;
import com.etc.cms.util.PageData;
import com.etc.service.MessageService;
import com.google.gson.Gson;

/**
 * Servlet implementation class MessageServlet
 */
@WebServlet("/MessageServlet")
public class MessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessageServlet() {
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
		MessageService ms=new MessageService();
		String op=request.getParameter("op");
		Gson gson=new Gson();
		response.setContentType("application/json");
		PrintWriter out=response.getWriter();
		int goodId=0;
		switch(op) {
		case "getMsgByGoodId":
			goodId=Integer.parseInt(request.getParameter("goodId"));
			int page=Integer.parseInt(request.getParameter("page"));
			PageData<MessageDetails> pd=ms.getMsgByGoodId(goodId,page);
			String gsonStr=gson.toJson(pd);
			out.print(gsonStr);
			out.close();
			break;
		case "sendGoodMessage":
			goodId=Integer.parseInt(request.getParameter("goodId"));
			//String userName=request.getParameter("userName");
			String messageContent=request.getParameter("messageContent");
			HttpSession session =request.getSession();
			String userName=String.valueOf(session.getAttribute("user1"));
			
			ms.sendGoodMessage(goodId,userName,messageContent);
			
			String str=gson.toJson("·¢ËÍ³É¹¦");
			out.print(str);
			out.close();
			break;
		}
	}

}
