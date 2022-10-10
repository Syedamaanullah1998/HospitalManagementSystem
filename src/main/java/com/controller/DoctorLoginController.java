package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDao;
import com.dao.UserDao;
import com.dataobjects.Doctor;
import com.dataobjects.User;
import com.util.ConnectionManager;

@WebServlet("/doctorLogin")
public class DoctorLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			HttpSession session = request.getSession();
			DoctorDao dao = new DoctorDao(ConnectionManager.getDBConn());
			Doctor doctor = dao.login(email, password);
			if (doctor != null) {
				session.setAttribute("doctorObj", doctor);
				response.sendRedirect("doctor/index.jsp");
			} else {
				session.setAttribute("errorMsg", "invalid email & password");
				response.sendRedirect("doctor_login.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
