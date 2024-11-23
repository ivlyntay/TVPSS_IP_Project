package com.example.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.model.User;

@WebServlet("/UserController")
public class UserController extends HttpServlet {
    private Map<String, User> users = new HashMap<>();
    private static int idCounter = 0;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user != null) {
            // Pass the user data to the settings page
            request.setAttribute("user", user);
            forwardToPage(request, response, "school/setting/setting.jsp");
        } else {
            response.sendRedirect("/login.jsp");
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Get action and user inputs
            String action = request.getParameter("action");
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            // Session object
            HttpSession session = request.getSession();

            // Handle actions
            if ("register".equals(action)) {
                handleRegistration(request, response, session);
            } else if ("login".equals(action)) {
                handleLogin(request, response, email, password, session);
            } else {
                response.getWriter().println("Invalid action.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }

    private void handleRegistration(HttpServletRequest request, HttpServletResponse response, HttpSession session)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String fullName = request.getParameter("fullname");
        String icNumber = request.getParameter("icNumber");
        String schoolName = request.getParameter("schoolName");
        String district = request.getParameter("district");
        String contactNumber = request.getParameter("contactNumber");
      

        if (users.containsKey(email)) {
            // User already exists
            request.setAttribute("message", "Email already exists. Try another.");
            forwardToPage(request, response, "/register.jsp");
        } else {
            // Register user
            User newUser = new User(generateId(),fullName, icNumber, schoolName, district, email, contactNumber, password);
            users.put(email, newUser);

            // Store user data in session
            session.setAttribute("user", newUser);

            request.setAttribute("message", "Registration successful! You can now login.");
            forwardToPage(request, response, "/login.jsp");
        }
    }
    private int generateId() {
        return idCounter++;
    }


    private void handleLogin(HttpServletRequest request, HttpServletResponse response, String email, String password, HttpSession session)
            throws ServletException, IOException {
        if (users.containsKey(email) && users.get(email).getPassword().equals(password)) {
            // Login successful
            session.setAttribute("user", users.get(email));
            response.sendRedirect("school/profile/profile.jsp");
        } else {
            // Invalid login
            request.setAttribute("message", "Invalid username or password. Try again.");
            forwardToPage(request, response, "/login.jsp");
        }
    }

    private void forwardToPage(HttpServletRequest request, HttpServletResponse response, String page)
            throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher(page);
        rd.forward(request, response);
    }
}