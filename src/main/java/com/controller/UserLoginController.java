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

@WebServlet("/userLogin")
public class UserLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			HttpSession session = request.getSession();
			UserDao dao = new UserDao(ConnectionManager.getDBConn());
			User user = dao.login(email, password);
			if(user!=null) {
				session.setAttribute("userObj",user);
				response.sendRedirect("index.jsp");
			}else {
				session.setAttribute("errorMsg","invalid email & password" );
				response.sendRedirect("user_login.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
