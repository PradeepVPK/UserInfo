package com.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;


@WebServlet("/ControllerServlet")
public class ControllerServlet
 extends HttpServlet {
	
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out=response.getWriter();
		response.setContentType("text/html");


		
		UserDao userDao=new UserDao();
		String action=request.getParameter("action");
		
		
		if(action.equals("register")) {
			String uname=request.getParameter("username");
			String password=request.getParameter("password");
			String gender=request.getParameter("gender");
			String dob=request.getParameter("dob");
			String email=request.getParameter("email");
			
			int i;
			try {
				i = userDao.register(uname, password, gender, dob, email);
				if(i>0) {
					response.sendRedirect("login.jsp");
				}
				else {
					response.sendRedirect("error.jsp");
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			

		}
		
		if(action.equals("login")) {
			
			String uname=request.getParameter("username");
			String password=request.getParameter("password");
			
		
			
			
			try {
				
				if(userDao.login(uname, password)) {
					HttpSession session=request.getSession();
					session.setAttribute("username", uname);
					response.sendRedirect("home.jsp");
				}
				else {
					response.sendRedirect("error.jsp");
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			

		}
		

		
	}

}
