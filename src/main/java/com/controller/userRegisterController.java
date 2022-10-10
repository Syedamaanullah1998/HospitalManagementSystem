package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.dataobjects.User;
import com.util.ConnectionManager;

@WebServlet("/user_register")
public class userRegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String fullName = request.getParameter("fullname");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			User user = new User(fullName,email,password);
			
			UserDao dao = new UserDao(ConnectionManager.getDBConn());
			
			HttpSession session = request.getSession();		
			if(dao.userRegister(user)) {
				session.setAttribute("sucMsg", "Registered Successfully");
			}else {
				session.setAttribute("errorMsg", "Something wrong on the server");
			}
			response.sendRedirect("signup.jsp");
		
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
