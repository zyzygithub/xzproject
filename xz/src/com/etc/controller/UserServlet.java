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

import com.etc.cms.util.UserMes;
import com.etc.entity.User;
import com.etc.service.StudentService;
import com.etc.service.UserService;
import com.google.gson.Gson;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserService us = new UserService();
	StudentService ss = new StudentService();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	// ˢ����ʾȫ��
	/*
	 * public List<User> getall() { List<User> list = new ArrayList<User>(); list =
	 * us.getAllUser(); return list; }
	 */

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
		// �������HttpSession ��һ���ӿ� request��һ���������Եõ�����
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		List<User> list = new ArrayList<User>();
		// Ajax�����
		PrintWriter out = response.getWriter();
		String up = "";
		String username = "";
		String mes = "";
		if (request.getParameter("up") != null) {

			up = request.getParameter("up");
		}
		
		switch (up) {
		case "userreg":
			username = request.getParameter("name");
			String userrealname = request.getParameter("account");
			String userpsw = request.getParameter("password");
			String xuehao = request.getParameter("xuehao");
			String cd = request.getParameter("cd");
			// �õ�ѧУ
			String chooseschool = request.getParameter("chooseschool");
			// �����������ѧУ��ȷ�����ĸ�ѧУ��
			if (chooseschool.equals("����ѧԺ")) {
				chooseschool = "X_PTU";
			}
			if (chooseschool.equals("����һ��")) {
				chooseschool = "X_YZ";
			}
			// �ж��Ƿ�ΪѧУѧ�� ����ע�� ����ʵ���� ѧ�� ѧУ�� ���ж��Ƿ�Ϊ��Уѧ��
			if (ss.isStudent(userrealname, xuehao, chooseschool)) {
				User user = new User(0, username, userpsw, userrealname,cd);
				if (us.addOneUser(user)) {

					
					// �����ж��Ƿ�������¼��ģ̬��
					session.setAttribute("mainmsg", "ע��ɹ�");
					
					// ���û�����ȥ
					session.setAttribute("user1", username);
					// ȥ������
					response.sendRedirect("mainshow.jsp");
				}
			} else {
				
				
				// ���������� û��ͨ��ѧУ��֤����Ϣ
				response.sendRedirect("error.jsp");
				/*mes = "δͨ��У����֤,������ע��";
				*/
				
				
			}
			break;
		case "isRightusername":

			username = request.getParameter("username_reg");
			if (username != null && username != "") {
				if (us.isUser(username)) {
					mes = "�û����Ѿ�����";

				} else {
					mes = "�û�������ʹ��";
				}
				out.print(mes);
				out.close();
				
			}
			break;
		case "login":
			username = request.getParameter("userName");
			String password = request.getParameter("userPassword");
			String msg="";
			if(us.UserIsOk(username)){
				//���ж��û�״̬  ֻ����������ʱ��Ž��������û�����֤
				if (us.isPass(username, password)) {
					session.setAttribute("user1", username);
					//session.setAttribute("mainmsg", "��½�ɹ�");
					msg="��½�ɹ�";
				}else {
					//session.setAttribute("mainmsg", "�û���Ϣ��ƥ��");
					msg="����ȷ���˻���Ϣ";
				}
			}else {
				msg="���˻��ѱ�����";
			}
			
			//response.sendRedirect("mainshow.jsp");
			out.print(msg);
			break;
		case "writeOff":
			
			session.removeAttribute("user1");
			out.print("ע���ɹ�");
			break;
			//�û���������û���Ϣ��ʼ��
		case "unitpeople":
			username = request.getParameter("taname");
			
			int[] one = us.getOnePeople(username);
			UserMes uMes=new UserMes(one[0],one[1],one[2]);
	
			List<UserMes> list2 =new ArrayList<>();
			list2.add(uMes);
			response.setContentType("application/json");
			Gson gson2 = new Gson();
			String pd1 = gson2.toJson(list2);
			out.print(pd1);
			
			out.close();
			break;
			//�޸��ߣ�����
		case "isRightusercd":
			
		String	usercd = request.getParameter("usercd_reg");
			if (usercd != null && usercd != "") {
				if (us.isUsercd(usercd)) {
					mes = "���֤�ѱ�ע��";//���֤�ظ���
					

				} else {
					mes = "���֤��Ϣ��֤ʵ";
				}
				out.print(mes);
				out.close();
				
			}
			break;

		}
	}

}
