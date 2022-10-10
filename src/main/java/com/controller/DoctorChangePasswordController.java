package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDao;
import com.util.ConnectionManager;

@WebServlet("/doctorChangePassword")
public class DoctorChangePasswordController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 doPost(request,response);
 }

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String redirect = "doctor/edit_profile.jsp";
		int docId = Integer.parseInt(request.getParameter("docid"));
		String oldPassword = request.getParameter("oldPassword");
		String newPassword = request.getParameter("newPassword");

		DoctorDao dao = new DoctorDao(ConnectionManager.getDBConn());
		HttpSession session = request.getSession();

		if (dao.checkOldPassword(docId, oldPassword)) {

			if ((dao.changePassword(docId, newPassword))) {
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
