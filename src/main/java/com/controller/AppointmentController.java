package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AppointmentDao;
import com.dataobjects.Appointment;
import com.util.ConnectionManager;

@WebServlet("/appointment")
public class AppointmentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userId = Integer.parseInt(request.getParameter("userid"));
		String fullname = request.getParameter("fullname");
		String gender = request.getParameter("gender");
		String age = request.getParameter("age");
		String appoint_date = request.getParameter("appoint_date");
		String email = request.getParameter("email");
		String phno = request.getParameter("phno");
		String diseases = request.getParameter("diseases");
		int doctor_id = Integer.parseInt(request.getParameter("doct"));
		String address = request.getParameter("address");
		
		Appointment app = new Appointment(userId,fullname,gender,age,appoint_date,email,phno,diseases,doctor_id,address,"pending");
		AppointmentDao dao = new AppointmentDao(ConnectionManager.getDBConn());
		HttpSession session = request.getSession();
		if(dao.addAppointment(app)) {
			session.setAttribute("succMsg", "Appointment done Successfully");
			
		}else {
			session.setAttribute("errorMsg", "Somethign went wrong on the server");
		}
		response.sendRedirect("user_appointment.jsp");
	}

}
