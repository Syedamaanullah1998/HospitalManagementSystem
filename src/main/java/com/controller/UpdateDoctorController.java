package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDao;
import com.dataobjects.Doctor;
import com.util.ConnectionManager;

@WebServlet("/updateDoctor")
public class UpdateDoctorController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {

			String fullName = request.getParameter("fullname");
			String dob = request.getParameter("dob");
			String qualification = request.getParameter("qualification");
			String specialist = request.getParameter("specialist");
			String email = request.getParameter("email");
			String mobno = request.getParameter("mobno");
			String password = request.getParameter("password");
			int id = Integer.parseInt(request.getParameter("id"));
			Doctor doc = new Doctor(id,fullName, dob, qualification, specialist, email, mobno, password);
			DoctorDao dao = new DoctorDao(ConnectionManager.getDBConn());
			HttpSession session = request.getSession();
			if (dao.updateDoctor(doc)) {
				session.setAttribute("succMsg", "Doctor Updated Successfully..");
			}else {
				session.setAttribute("errMsg", "Something wrong on the server..");
			}
			response.sendRedirect("admin/view_doctor.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
