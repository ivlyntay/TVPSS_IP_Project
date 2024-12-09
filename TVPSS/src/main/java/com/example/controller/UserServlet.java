package com.example.controller;

import com.example.model.CrewMember;
import com.example.model.User;

import java.io.*;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

@WebServlet("/UserServlet")
@MultipartConfig
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // In-memory user list
    private List<User> userList;
    private static int idCounter = 0; 

    @Override
    public void init() throws ServletException {
        userList = new ArrayList<>();

        // Store the userList in session for persistence
        getServletContext().setAttribute("userList", userList);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "list"; // Default action

        switch (action) {
            case "list":
                listUsers(request, response);
                break;
            case "view":
                viewUser(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deleteUser(request, response);
                break;
            default:
                listUsers(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "list"; // Default action

        switch (action) {
            case "add":
                addUser(request, response);
                break;
            case "update":
                updateUser(request, response);
                break;
            case "cancel":
                cancelAdd(request, response);
                break;
            default:
                listUsers(request, response);
        }
    }

    private void listUsers(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List <User> userList = (List<User>) getServletContext().getAttribute("userList");

        // If userList is not initialized, initialize it
        if (userList == null) {
            userList = new ArrayList<>();
        }

        request.setAttribute("userList", userList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("userList.jsp");
        dispatcher.forward(request, response);
    }

    private void viewUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        
        User user = findUserById(id);
        request.setAttribute("user", user);
        RequestDispatcher dispatcher = request.getRequestDispatcher("viewUser.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        List <User> userList = (List<User>) getServletContext().getAttribute("userList");
        
     // Find the user  by ID
        User user = userList.stream().filter(c -> c.getId() == id).findFirst().orElse(null);
        
        request.setAttribute("user", user);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("editUser.jsp");
        dispatcher.forward(request, response);
    }

    private void addUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fullName = request.getParameter("fullName");
        String icNumber = request.getParameter("icNumber");
        String schoolName = request.getParameter("schoolName");
        String district = request.getParameter("district");
        String email = request.getParameter("email");
        String contactNumber = request.getParameter("contactNumber");
        String ytbLink = request.getParameter("ytbLink");
        String ytbName = request.getParameter("ytbName");

        // Get the uploaded file
        Part filePart = request.getPart("profilePhoto");
        String photo = savePhoto(filePart); // Method to handle photo upload

        if (!isValidEmail(email) || !isValidContact(contactNumber)) {
            throw new ServletException("Invalid email or contact number.");
        }

        // Create the User object
        User newUser = new User(++idCounter, fullName, icNumber, schoolName, district, email, contactNumber, ytbLink, ytbName, photo);  
        userList.add(newUser);

        // Update the userList in the servlet context
        getServletContext().setAttribute("userList", userList);

        // Redirect to the user list page
        response.sendRedirect("/TVPSS/admin/user/UserServlet?action=list");
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("userId"));
        String fullName = request.getParameter("fullName");
        String icNumber = request.getParameter("icNumber");
        String schoolName = request.getParameter("schoolName");
        String district = request.getParameter("district");
        String email = request.getParameter("email");
        String contactNumber = request.getParameter("contactNumber");
        String password = request.getParameter("password");
        String ytbLink = request.getParameter("ytbLink");
        String ytbName = request.getParameter("ytbName");

//        Part filePart = request.getPart("profilePhoto");
//        String photoName = filePart.getSize() > 0 ? savePhoto(filePart) : user.getPhoto();
        
        List <User> userList = (List<User>) getServletContext().getAttribute("userList");
        
        for (User user : userList) {
            if (user.getId() == id) {

	        user.setFullName(fullName);
	        user.setIcNumber(icNumber);
	        user.setSchoolName(schoolName);
	        user.setDistrict(district);
	        user.setEmail(email);
	        user.setContactNumber(contactNumber);
	        user.setPassword(password);
	        user.setYoutubeLink(ytbLink);
	        user.setYoutubeChannelName(ytbName);
//	        user.setPhoto(photoName);
	        break;
            }
        }
        getServletContext().setAttribute("userList", userList);

        response.sendRedirect("userList.jsp");
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        List <User> userList = (List<User>) getServletContext().getAttribute("userList");
        
        userList.removeIf(u -> u.getId() == id);
        
        getServletContext().setAttribute("userList", userList);
        response.sendRedirect("userList.jsp?action=list");
    }

    private void cancelAdd(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect("/TVPSS/admin/user/UserServlet?action=list");
    }

    private User findUserById(int id) {
    	List <User> userList = (List<User>) getServletContext().getAttribute("userList");
    	if (userList != null) {
            for (User user : userList) {
                if (user.getId() == id) {
                    System.out.println("Found User: " + user.getFullName());
                    return user;
                }
            }
        }
        System.out.println("User with ID " + id + " not found.");
        return null;
    }

    private boolean isValidEmail(String email) {
        return email != null && email.matches("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$");
    }

    private boolean isValidContact(String contact) {
        return contact != null && contact.matches("^\\d{10,15}$");
    }

    private String savePhoto(Part filePart) throws IOException {
        if (filePart == null || filePart.getSize() == 0) {
            return "default.jpg"; // Default photo if no file uploaded
        }

        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String uploadDir = getServletContext().getRealPath("../../uploaded_photos");

        // Ensure the upload directory exists
        File uploadDirFile = new File(uploadDir);
        if (!uploadDirFile.exists()) {
            uploadDirFile.mkdir();
        }

        // Save the file
        try (InputStream fileContent = filePart.getInputStream();
             FileOutputStream outputStream = new FileOutputStream(new File(uploadDir + File.separator + fileName))) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = fileContent.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
        }

        return fileName;
    }
}
