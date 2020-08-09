package com.bitjeju.lms;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bitjeju.login.model.MemberDto;

/**
 * Servlet implementation class LmsController
 */
@WebServlet("/lms.bit")
public class LmsController extends HttpServlet {
	HttpSession session;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		session = request.getSession(false);//���缼���� ������ ������. ������ null
	
		MemberDto bean = (MemberDto) session.getAttribute("login");
		String dept = bean.getDept(); // ���� ���� ���� �л�
		int loginlevel = bean.getLvl(); // ���ѷ���
		System.out.println(loginlevel);

		if (dept.equals("����")) {
			request.getRequestDispatcher("staff.jsp").forward(request, response);
			return;
		} else if (dept.equals("����")) {
			request.getRequestDispatcher("sales.jsp").forward(request, response);
			return;
		}else if (dept.equals("����")) {
			request.getRequestDispatcher("teacher.jsp").forward(request, response);
			return;
		}else if (dept.equals("������")) {
			request.getRequestDispatcher("stu.jsp").forward(request, response);
			return;
		}

		request.getRequestDispatcher("main.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}