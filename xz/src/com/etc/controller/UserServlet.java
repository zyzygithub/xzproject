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

	// 刷新显示全部
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
		// 这里就是HttpSession 是一个接口 request有一个方法可以得到对象
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		List<User> list = new ArrayList<User>();
		// Ajax的输出
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
			// 得到学校
			String chooseschool = request.getParameter("chooseschool");
			// 根据下拉框的学校来确定是哪个学校表
			if (chooseschool.equals("莆田学院")) {
				chooseschool = "X_PTU";
			}
			if (chooseschool.equals("莆田一中")) {
				chooseschool = "X_YZ";
			}
			// 判断是否为学校学生 才能注册 （真实姓名 学号 学校） 来判断是否为该校学生
			if (ss.isStudent(userrealname, xuehao, chooseschool)) {
				User user = new User(0, username, userpsw, userrealname,cd);
				if (us.addOneUser(user)) {

					
					// 用来判断是否跳出登录的模态框
					session.setAttribute("mainmsg", "注册成功");
					
					// 传用户名过去
					session.setAttribute("user1", username);
					// 去主界面
					response.sendRedirect("mainshow.jsp");
				}
			} else {
				
				
				// 主界面跳出 没有通过学校认证的信息
				response.sendRedirect("error.jsp");
				/*mes = "未通过校方认证,请重新注册";
				*/
				
				
			}
			break;
		case "isRightusername":

			username = request.getParameter("username_reg");
			if (username != null && username != "") {
				if (us.isUser(username)) {
					mes = "用户名已经存在";

				} else {
					mes = "用户名可以使用";
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
				//先判断用户状态  只有是正常的时候才进行密码用户名验证
				if (us.isPass(username, password)) {
					session.setAttribute("user1", username);
					//session.setAttribute("mainmsg", "登陆成功");
					msg="登陆成功";
				}else {
					//session.setAttribute("mainmsg", "用户信息不匹配");
					msg="请再确认账户信息";
				}
			}else {
				msg="该账户已被禁用";
			}
			
			//response.sendRedirect("mainshow.jsp");
			out.print(msg);
			break;
		case "writeOff":
			
			session.removeAttribute("user1");
			out.print("注销成功");
			break;
			//用户主界面的用户信息初始化
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
			//修改者：张媛
		case "isRightusercd":
			
		String	usercd = request.getParameter("usercd_reg");
			if (usercd != null && usercd != "") {
				if (us.isUsercd(usercd)) {
					mes = "身份证已被注册";//身份证重复了
					

				} else {
					mes = "身份证信息已证实";
				}
				out.print(mes);
				out.close();
				
			}
			break;

		}
	}

}
