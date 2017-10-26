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

import com.etc.cms.util.PageData;
import com.etc.entity.Types;
import com.etc.service.ShowmainService;
import com.google.gson.Gson;

/**
 * Servlet implementation class EmpServlet
 */
@WebServlet("/TypesServlet")
public class TypesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ShowmainService ms = new ShowmainService();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TypesServlet() {
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

		int page = 1;

		int pageSize = 10;
		String op = request.getParameter("op");
		
			if(op != null) {
				if (op.equals("unittype")) {
					
					List<Types> typeslist = new ArrayList<Types>();
					// ����service�Ĳ�ѯ���ͷ�������
					typeslist = ms.getAllTypes();
					
					// Ajax��ʵ��
					// �������������json��ʽ �ⲿ��jar�� gson
					Gson gson = new Gson();
					String jsonString = gson.toJson(typeslist);
			
					// ʹ��printWriter����
					PrintWriter out = response.getWriter();
			
					out.print(jsonString);
			
					out.close();
				} else if (op.equals("unittypemes")) {
					String typename = request.getParameter("typename");
					List<Types> typemeslist = new ArrayList<Types>();
					// ����service�Ĳ�ѯ���ͷ�������
					typemeslist = ms.getAllTypemes(typename);
					
					// Ajax��ʵ��
					// �������������json��ʽ �ⲿ��jar�� gson
					Gson gson = new Gson();
					String jsonString = gson.toJson(typemeslist);
			
					// ʹ��printWriter����
					PrintWriter out = response.getWriter();
			
					out.print(jsonString);
			
					out.close();
				}
					
			}
	}

}
