package com.example.controller;
import com.example.model.User;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.HashMap;
import java.util.Map;

@WebServlet("/UserController")
public class UserController extends HttpServlet {
	private Map<String, String> users = new HashMap<>();

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    try {
	        String action = request.getParameter("action");
	        String email = request.getParameter("email");
	        String password = request.getParameter("password");

	        if ("register".equals(action)) {
	            if (users.containsKey(email)) {
	                request.setAttribute("message", "Username already exists. Try another.");
	                RequestDispatcher rd = request.getRequestDispatcher("/register.jsp");
	                rd.forward(request, response);
	            } else {
	                users.put(email, password);
	                request.setAttribute("message", "Registration successful! You can now login.");
	                RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
	                rd.forward(request, response);
	            }
	        } else if ("login".equals(action)) {
	            if (users.containsKey(email) && users.get(email).equals(password)) {
	                request.setAttribute("email", email);
	                response.sendRedirect("school/crew/crewList.jsp");
	            } else {
	                request.setAttribute("message", "Invalid username or password. Try again.");
	                RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
	                rd.forward(request, response);
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        response.getWriter().println("Error: " + e.getMessage());
	    }
	}

}