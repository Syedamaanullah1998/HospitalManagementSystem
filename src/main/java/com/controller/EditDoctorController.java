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

@WebServlet("/editDoctor")
public class EditDoctorController extends HttpServlet {
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
			int docId = Integer.parseInt(request.getParameter("docid"));
			Doctor doc = new Doctor(docId,fullName, dob, qualification, specialist, email, mobno,"");
			DoctorDao dao = new DoctorDao(ConnectionManager.getDBConn());
			HttpSession session = request.getSession();
			if (dao.editDoctorProfile(doc)) {
				Doctor updatedDoc = dao.getDoctorById(docId);
				session.setAttribute("succMsg2", "Doctor Updated Successfully..");
				session.setAttribute("doctorObj", updatedDoc);
			}else {
				session.setAttribute("errMsg2", "Something wrong on the server..");
			}
			response.sendRedirect("doctor/edit_profile.jsp");
		} catch (Exception e) { 
			e.printStackTrace();
		}
	}

}
