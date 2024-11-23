package com.example.controller;

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
    private static int idCounter = 3; // Start ID counter after sample data

    @Override
    public void init() throws ServletException {
        userList = new ArrayList<>();
        userList.add(new User(1, "Christine Brooks", "751024040130", "SMK Bandar Kota Tinggi", "Kota Tinggi", "christine@gmail.com", "0123456789", "https://www.youtube.com/@TVPSSFIVEONE", "TVPSS FiveOne Studio", "default.jpg"));
        userList.add(new User(2, "Jane Smith", "890202654321", "SMK ND", "Johor Bahru", "janesmith@example.com", "0111234567", "https://www.youtube.com/@TVPSSFIVEONE", "TVPSS FiveOne Studio", "default.jpg"));

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
    	userList = (List<User>) getServletContext().getAttribute("userList");
        
    	request.setAttribute("userList", userList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("userList.jsp");
        dispatcher.forward(request, response);
    }

    protected void viewUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        List<User> userList =(List<User>) getServletContext().getAttribute("userList");
        User user = findUserById(id);
        if (user == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "User not found");
            return;
        }
        request.setAttribute("user", user);
        RequestDispatcher dispatcher = request.getRequestDispatcher("viewUser.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        List<User> userList =(List<User>) getServletContext().getAttribute("userList");
        User user = findUserById(id);
        if (user == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "User not found");
            return;
        }
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
        String photoName = savePhoto(filePart);  // Method to handle photo upload

        if (!isValidEmail(email) || !isValidContact(contactNumber)) {
            throw new ServletException("Invalid email or contact number.");
        }

        User newUser = new User(generateId(), fullName, icNumber, schoolName, district, email, contactNumber, ytbLink, ytbName, photoName);
        userList.add(newUser);

        getServletContext().setAttribute("userList", userList);

        response.sendRedirect("/TVPSS/admin/user/UserServlet?action=list");
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("userId"));
        User user = findUserById(id);

        if (user == null) {
            throw new ServletException("User not found with ID: " + id);
        }

        String fullName = request.getParameter("fullName");
        String icNumber = request.getParameter("icNumber");
        String schoolName = request.getParameter("schoolName");
        String district = request.getParameter("district");
        String email = request.getParameter("email");
        String contactNumber = request.getParameter("contactNumber");
        String password = request.getParameter("password");
        String ytbLink = request.getParameter("ytbLink");
        String ytbName = request.getParameter("ytbName");

        Part filePart = request.getPart("profilePhoto");
        String photoName = filePart.getSize() > 0 ? savePhoto(filePart) : user.getPhoto();

        if (!isValidEmail(email) || !isValidContact(contactNumber)) {
            throw new ServletException("Invalid email or contact number.");
        }

        user.setFullName(fullName);
        user.setIcNumber(icNumber);
        user.setSchoolName(schoolName);
        user.setDistrict(district);
        user.setEmail(email);
        user.setContactNumber(contactNumber);
        user.setPassword(password);
        user.setYoutubeLink(ytbLink);
        user.setYoutubeChannelName(ytbName);
        user.setPhoto(photoName);

        getServletContext().setAttribute("userList", userList);

        response.sendRedirect("/TVPSS/admin/user/UserServlet?action=list");
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        List<User> userList =(List<User>) getServletContext().getAttribute("userList");
        userList.removeIf(u -> u.getId() == id);
        getServletContext().setAttribute("userList", userList);
        response.sendRedirect("userList.jsp?action=list");
    }

    private void cancelAdd(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        response.sendRedirect("/TVPSS/admin/user/UserServlet?action=list");
    }

    private User findUserById(int id) {
        return userList.stream().filter(user -> user.getId() == id).findFirst().orElse(null);
    }

    private int generateId() {
        return idCounter++;
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