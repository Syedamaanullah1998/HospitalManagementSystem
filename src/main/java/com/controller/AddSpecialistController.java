package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.SpecialistDao;
import com.util.ConnectionManager;

@WebServlet("/addSpecialist")
public class AddSpecialistController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String specName = request.getParameter("specName");
			SpecialistDao dao = new SpecialistDao(ConnectionManager.getDBConn());
			boolean f =dao.addSpecialist(specName);
			HttpSession session = request.getSession();
			
			
			if(f) {
				session.setAttribute("succMsg", "Specialist Added");
			}else {
				session.setAttribute("errMsg", "something wrong on server side");
			}
			response.sendRedirect("admin/index.jsp");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
