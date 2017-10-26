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

import com.etc.entity.User;
import com.etc.service.UserService;
import com.google.gson.Gson;

/**
 * Servlet implementation class account_updateInfo_servlet
 */
@WebServlet("/account_updateInfo_servlet")
public class account_updateInfo_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserService us = new UserService();
	List<User> list = new ArrayList<User>();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String p_userName = (String) session.getAttribute("user1");
		String userName = "";

		if (request.getParameter("op") != null) {
			PrintWriter out = response.getWriter();
			String info = "";
			String op = request.getParameter("op");
			if (op.equals("personInfo")) {
				response.setContentType("application/json");
				if (p_userName != null && p_userName != "") {
					User user = us.getOneUser(p_userName).get(0);

					Gson gson = new Gson();
					info = gson.toJson(user);
				}
				/*
				 * out.print(info); out.close();
				 */

			}
			if (op.equals("updateInfo")) {

				String p_UserPhone = request.getParameter("p_UserPhone");
				String p_UserSex = request.getParameter("p_UserSex");
				
				String p_userQuestion = request.getParameter("p_userQuestion");
			
				String p_userAnswer = request.getParameter("p_userAnswer");
				
				boolean flag = us.updateInfoByName(p_userName, p_UserPhone, p_UserSex, p_userQuestion, p_userAnswer);
			
				if (flag == true) {
					info = "�ύ�ɹ�";
				} else {
					info = "�ύʧ�ܣ��������ύ";
				}

			}
			if (op.equals("checkOldPwd")) {

				String p_oldPwd = request.getParameter("p_oldPwd");
				
				boolean flag = us.checkOldPwd(p_userName, p_oldPwd);
				if (flag == false) {
					info = "ԭʼ�����������";
				}
				
			}
			if (op.equals("checkNewPwd")) {

				String p_newPwd = request.getParameter("p_newPwd");
				String p_checkPwd = request.getParameter("p_checkPwd");
				
				if (!p_newPwd.equals(p_checkPwd)) {
					info = "�����������벻һ��";
				}
				
			}
			if (op.equals("updatePwd")) {

				String p_UserPwd = request.getParameter("p_UserPwd");
				boolean flag = us.updatePwdByName(p_userName, p_UserPwd);
				if (flag) {
					info = "�����޸ĳɹ�";
				} else {
					info = "�����޸�ʧ��";
				}
				
			}
			if (op.equals("getQuestion")) {

				userName = request.getParameter("userName");
			
				if (userName != null && userName != "") {
					if (us.getOneUser(userName).size() > 0) {
						info = us.getOneUser(userName).get(0).getUSERQUESTION();

					} else {
						info = "�û��������ڣ���������ȷ���û���!";
					}

					
				}

			}
			if(op.equals("checkAnswer")) {
				
				userName=request.getParameter("userName");
				String userAnswer=request.getParameter("userAnswer");
				
				if (userName != null && userName != "") {
					
					if(us.getOneUser(userName).size()>0) {
						User user=us.getOneUser(userName).get(0);
						String UserAnswer=user.getUSERANSWER();
						String UserPwd=user.getUSERPWD();
						
						if(UserAnswer.equals(userAnswer)) {
							info="�ش���ȷ������ǰ������Ϊ"+UserPwd;
						}else {
							info="�ش����������ȷ����������ܱ���!";
						}
						
						
					}else {
						info="��������ȷ���û���!";
					}
					
				}

		}

		out.print(info);
		
		out.close();
	}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);

	}

}
