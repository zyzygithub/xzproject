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
import com.etc.entity.USER_COMMENT;
import com.etc.entity.User;
import com.etc.service.UserService;
import com.etc.service.account_comment_service;
import com.google.gson.Gson;

/**
 * Servlet implementation class account_comment_servlet
 */
@WebServlet("/account_comment_servlet")
public class account_comment_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	account_comment_service cs=new account_comment_service();
	UserService us = new UserService();
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		HttpSession session=request.getSession();
		/* Ĭ�Ϸ�ҳ�������� */
		int page = 1;
		int pagesize = 5;
		String p_searchval="";
		String searchScoreval="";
		String op = request.getParameter("op");
		
		if (op != null) {
			// ʹ��printWriter����
			PrintWriter out = response.getWriter();
			// �������������json��ʽ �ⲿ��jar�� gson
			Gson gson = new Gson();
			if(op.equals("queryAllByPage")) {
				if (request.getParameter("page") != null) {
					page = Integer.parseInt(request.getParameter("page"));
				}

				if (request.getParameter("pagesize") != null) {
					pagesize = Integer.parseInt(request.getParameter("pagesize"));
				}
				if (request.getParameter("p_searchval") != null) {
					p_searchval = request.getParameter("p_searchval");
				}
				String p_userName=(String)session.getAttribute("user1");
				
				// �û��е�¼�������ܲ鿴������Ϣ
				if (p_userName != null && p_userName != "") {
					String identity=request.getParameter("identity");
					//�����û�����ѯ�û����
					List<User> list=us.getOneUser(p_userName);				
					int p_userId=list.get(0).getUSERID();
					if(identity.equals("ToMe")) {
						// ����service�ķ�ҳ��������һ��pageData����
						PageData<USER_COMMENT> commentToMe = cs.getCommentBySeler(page, pagesize, p_userId,p_searchval);
					
						String pd = gson.toJson(commentToMe);
						out.print(pd);
					}else if(identity.equals("FromMe")) {
						PageData<USER_COMMENT> commentFromMe = cs.getCommentByBuyer(page, pagesize, p_userId,p_searchval);
						
						String pd = gson.toJson(commentFromMe);
						out.print(pd);
					}
					
					
					
				}
			}else if(op.equals("queryTaComment")) {
				
				if (request.getParameter("page") != null) {
					page = Integer.parseInt(request.getParameter("page"));
				}

				if (request.getParameter("pagesize") != null) {
					pagesize = Integer.parseInt(request.getParameter("pagesize"));
				}
				if (request.getParameter("p_searchval") != null) {
					p_searchval = request.getParameter("p_searchval");
				}
				String taname=request.getParameter("taname");
				
				// �û��е�¼�������ܲ鿴�ղ���Ϣ
				if (taname != null && taname != "") {
					String identity=request.getParameter("identity");
					//�����û�����ѯ�û����
					List<User> list=us.getOneUser(taname);				
					int p_userId=list.get(0).getUSERID();
					
					// ����service�ķ�ҳ��������һ��pageData����
					PageData<USER_COMMENT> commentToMe = cs.getCommentBySeler(page, pagesize, p_userId,p_searchval);
					
					String pd = gson.toJson(commentToMe);
					out.print(pd);
					
					
				}
				
				
				
			}
			
			
		
			out.close();
		}
		
		
		
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
