package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AppointmentDao;
import com.util.ConnectionManager;

@WebServlet("/updateStatus")
public class updateStatusController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			int did = Integer.parseInt(request.getParameter("did"));
			String comm = request.getParameter("comm");
			AppointmentDao dao = new AppointmentDao(ConnectionManager.getDBConn());
			HttpSession session = request.getSession();
			
			if(dao.updateCommentStatus(id, did, comm)) {
				session.setAttribute("succMsg", "Comment Updated");
			}else {
				session.setAttribute("errorMsg", "Something wronmg on server");
				
			}
			response.sendRedirect("doctor/patient.jsp");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
