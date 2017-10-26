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

import com.etc.cms.util.LikeMes;
import com.etc.cms.util.PageData;

import com.etc.entity.Like;
import com.etc.entity.Types;
import com.etc.entity.User;
import com.etc.service.LikeService;
import com.etc.service.ShowmainService;
import com.etc.service.UserService;
import com.google.gson.Gson;


/**
 * Servlet implementation class EmpServlet
 */
//@WebServlet("/LikeServlet")
public class LikeServlet_bk extends HttpServlet {
	private static final long serialVersionUID = 1L;

	LikeService ls = new LikeService();
	UserService us = new UserService();
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LikeServlet_bk() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
		HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		HttpSession  session =request.getSession();
		 /* Ĭ�Ϸ�ҳ��������*/
		 int page = 1;
		
		 int pagesize = 2;
		

		String op = request.getParameter("op");
		String username = (String) session.getAttribute("user1");
		
			if(op != null) {
				//�û���������ʾ�ض��û����ղظ���
				if (op.equals("unitlike")) {
					// ʹ��printWriter����
					PrintWriter out = response.getWriter();
			
					
					// ����service�Ĳ�ѯ���ͷ��������ղظ���
					int count = ls.getLikeCount(username);
				
					String mes="";
					mes = count+"";
					out.print(mes);
					out.close();
					//return;	
					
				}else if (op.equals("queryAllByPage")) {
					
					 	if (request.getParameter("page") != null ) {
							page = Integer.parseInt(request.getParameter("page"));							
						} 
					 
						if (request.getParameter("pagesize") != null) {
							pagesize = Integer.parseInt(request.getParameter("pagesize"));						
						}
						//�û��е�¼�������ܲ鿴�ղ���Ϣ
						if (username != null && username != "") {
							
							// ����service�ķ�ҳ��������һ��pageData����
							 PageData<LikeMes> likelist = ls.getlikebyUsername(page, pagesize, username);
						
					
							// Ajax��ʵ��
							// �������������json��ʽ �ⲿ��jar�� gson
							Gson gson = new Gson();
							String pd = gson.toJson(likelist);
					      
							// ʹ��printWriter����
							PrintWriter out1 = response.getWriter();
					
							out1.print(pd);
					
							out1.close();
							
						}
					}else if (op.equals("deleteone")) {
					
						String likeid = request.getParameter("likeid");
						
						int id = Integer.valueOf(likeid);
						if (ls.deleteone(id)) {
							
							
							
						} else {
							
						}
						
						 PageData<LikeMes> likelist = ls.getlikebyUsername(1, 2, username);
							
							Gson gson = new Gson();
							String pd = gson.toJson(likelist);
					      
							// ʹ��printWriter����
							PrintWriter out1 = response.getWriter();
					
							out1.print(pd);
					
							out1.close();
						
					}else if (op.equals("clear")) {
						
						//�û��е�¼�������ܲ鿴�ղ���Ϣ
						if (username != null && username != "") {
							ls.clear(username);
							
						}
						
						 PageData<LikeMes> likelist = ls.getlikebyUsername(1, 2, username);
							
							Gson gson = new Gson();
							String pd = gson.toJson(likelist);
					        
							// ʹ��printWriter����
							PrintWriter out1 = response.getWriter();
					
							out1.print(pd);
					out1.close();
					}				 
								
			}
	}

}
