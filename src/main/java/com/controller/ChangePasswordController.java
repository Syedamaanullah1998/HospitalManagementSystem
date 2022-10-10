package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.util.ConnectionManager;

@WebServlet("/changePassword")
public class ChangePasswordController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String redirect = "change_password.jsp";
		int uid = Integer.parseInt(request.getParameter("uid"));
		String oldPassword = request.getParameter("oldPassword");
		String newPassword = request.getParameter("newPassword");

		UserDao dao = new UserDao(ConnectionManager.getDBConn());
		HttpSession session = request.getSession();

		if (dao.checkOldPassword(uid, oldPassword)) {

			if ((dao.changePassword(uid, newPassword))) {
				session.setAttribute("succMsg", "Password Change Successfully");
			} else {
				session.setAttribute("errorMsg", "Something wrong on the server");
			}

		} else {
			session.setAttribute("errorMsg", "Old Password Incorrect");
		}
		response.sendRedirect(redirect);
	}

}
