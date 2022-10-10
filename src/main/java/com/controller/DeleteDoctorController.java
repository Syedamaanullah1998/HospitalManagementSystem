package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDao;
import com.dataobjects.Doctor;
import com.util.ConnectionManager;

/**
 * Servlet implementation class DeleteDoctorController
 */
public class DeleteDoctorController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			try {
				int id = Integer.parseInt(request.getParameter("id"));

				DoctorDao dao = new DoctorDao(ConnectionManager.getDBConn());
				HttpSession session = request.getSession();
				if (dao.deleteDoctor(id)) {
					session.setAttribute("succMsg", "Doctor Deleted Successfully..");
				}else {
					session.setAttribute("errMsg", "Something wrong on the server..");
				}
				response.sendRedirect("admin/view_doctor.jsp");
			}catch(Exception e) {
				e.printStackTrace();
			}

	}
	

}
