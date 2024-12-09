package com.example.controller;
import com.example.model.CrewMember;
import java.io.IOException;
import java.io.InputStream;
import java.io.FileOutputStream;
import java.io.File;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/CrewServlet")
@MultipartConfig
public class CrewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // In-memory crew list
    private List<CrewMember> crewList;
    private static int idCounter = 0; // Start ID counter after sample data

    @Override
    public void init() throws ServletException {
        crewList = new ArrayList<>();

        // Store the crewList in session for persistence
        getServletContext().setAttribute("crewList", crewList);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "list"; // Default action

        switch (action) {
            case "list":
                listCrew(request, response);
                break;
            case "view":
                viewCrew(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deleteCrew(request, response);
                break;
            default:
                listCrew(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "list"; // Default action

        switch (action) {
            case "add":
                addCrew(request, response);
                break;
            case "update":
                updateCrew(request, response);
                break;
            case "cancel":
                cancelAdd(request, response);
                break;
            default:
                listCrew(request, response);
        }
    }

    private void listCrew(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    		List<CrewMember> crewList = (List<CrewMember>) getServletContext().getAttribute("crewList");
        
        // If crewList is not initialized, initialize it
        if (crewList == null) {
            crewList = new ArrayList<>();
        }

        // Add the list to the request attributes for use in JSP
        request.setAttribute("crewList", crewList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("crewList.jsp");
        dispatcher.forward(request, response);
    }

    protected void viewCrew(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idParam = request.getParameter("id");

        int id= Integer.parseInt(idParam);

        CrewMember crew = findCrewById(id);
        request.setAttribute("crew", crew);
        RequestDispatcher dispatcher = request.getRequestDispatcher("viewCrew.jsp");
        dispatcher.forward(request, response);
    }

    protected void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        List<CrewMember> crewList = (List<CrewMember>) getServletContext().getAttribute("crewList");

        // Find the crew member by ID
        CrewMember crew = crewList.stream().filter(c -> c.getId() == id).findFirst().orElse(null);

        // Set the crew member as an attribute for the edit form
        request.setAttribute("crew", crew);

        // Forward to the edit form page
        RequestDispatcher dispatcher = request.getRequestDispatcher("editCrew.jsp");
        dispatcher.forward(request, response);
    }


    private void addCrew(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fullName = request.getParameter("fullName");
        String icNumber = request.getParameter("icNumber");
        String email = request.getParameter("email");
        String contactNumber = request.getParameter("contactNumber");
        String gender = request.getParameter("gender");
        String role = request.getParameter("role");

        if (!isValidEmail(email) || !isValidContact(contactNumber)) {
            throw new ServletException("Invalid email or contact number.");
        }

        CrewMember newCrew = new CrewMember(++idCounter, fullName, icNumber, email, contactNumber, gender, role);
        crewList.add(newCrew);

        getServletContext().setAttribute("crewList", crewList);
        response.sendRedirect("/TVPSS/school/crew/CrewServlet?action=list");
    }


    private void updateCrew(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	int crewId = Integer.parseInt(request.getParameter("crewId"));
        String fullName = request.getParameter("fullName");
        String icNumber = request.getParameter("icNumber");
        String email = request.getParameter("email");
        String contactNumber = request.getParameter("contactNumber");
        String gender = request.getParameter("gender");
        String role = request.getParameter("role");
        List<CrewMember> crewList = (List<CrewMember>) getServletContext().getAttribute("crewList");

     // Find the crew member to update
        for (CrewMember crew : crewList) {
            if (crew.getId() == crewId) {
                // Update the crew member's details
                crew.setFullName(fullName);
                crew.setIcNumber(icNumber);
                crew.setEmail(email);
                crew.setContactNumber(contactNumber);
                crew.setGender(gender);
                crew.setRole(role);
                break;
            }
        }

        // Save the updated list back to the application context
        getServletContext().setAttribute("crewList", crewList);

        // Redirect to the crew list page
        response.sendRedirect("crewList.jsp");
    }

    protected void deleteCrew(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        List<CrewMember> crewList = (List<CrewMember>) getServletContext().getAttribute("crewList");

        // Remove the crew member from the list
        crewList.removeIf(c -> c.getId() == id);

        // Update the crew list in the ServletContext
        getServletContext().setAttribute("crewList", crewList);

        // Redirect to the list action to show the updated crew list
        response.sendRedirect("crewList.jsp?action=list");
    }


    private void cancelAdd(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
    	response.sendRedirect("/TVPSS/school/crew/CrewServlet?action=list");
    }

    private CrewMember findCrewById(int id) {
        List<CrewMember> crewList = (List<CrewMember>) getServletContext().getAttribute("crewList");
        if (crewList != null) {
            for (CrewMember crew : crewList) {
                if (crew.getId() == id) {
                    System.out.println("Found Crew: " + crew.getFullName());
                    return crew;
                }
            }
        }
        System.out.println("Crew with ID " + id + " not found.");
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
