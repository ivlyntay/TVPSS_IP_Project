// ProgramServlet.java
package com.example.controller;

import com.example.model.Program;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/program/*")
public class ProgramServlet extends HttpServlet {
    private List<Program> programs = new ArrayList<>();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getPathInfo();
        
        if (action == null) {
            action = "/list";
        }

        switch (action) {
            case "/list":
                listPrograms(request, response);
                break;
            case "/add":
                showAddForm(request, response);
                break;
            case "/edit":
                showEditForm(request, response);
                break;
            default:
                listPrograms(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getPathInfo();

        if (action == null) {
            action = "/list";
        }

        switch (action) {
            case "/add":
                addProgram(request, response);
                break;
            case "/edit":
                updateProgram(request, response);
                break;
            case "/delete":
                deleteProgram(request, response);
                break;
            default:
                listPrograms(request, response);
                break;
        }
    }

    private void listPrograms(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("programs", programs);
        request.getRequestDispatcher("/WEB-INF/views/program.jsp").forward(request, response);
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/program-form.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Program program = findProgramById(id);
        request.setAttribute("program", program);
        request.getRequestDispatcher("/WEB-INF/views/program-form.jsp").forward(request, response);
    }

    private void addProgram(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        int duration = Integer.parseInt(request.getParameter("duration"));
        String category = request.getParameter("category");
        String difficulty = request.getParameter("difficulty");
        String trainer = request.getParameter("trainer");

        Program program = new Program();
        program.setId(programs.size() + 1);
        program.setName(name);
        program.setDescription(description);
        program.setDuration(duration);
        program.setCategory(category);
        program.setDifficulty(difficulty);
        program.setTrainer(trainer);
        program.setActive(true);

        programs.add(program);
        response.sendRedirect(request.getContextPath() + "/program/list");
    }

    private void updateProgram(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Program program = findProgramById(id);

        if (program != null) {
            program.setName(request.getParameter("name"));
            program.setDescription(request.getParameter("description"));
            program.setDuration(Integer.parseInt(request.getParameter("duration")));
            program.setCategory(request.getParameter("category"));
            program.setDifficulty(request.getParameter("difficulty"));
            program.setTrainer(request.getParameter("trainer"));
        }

        response.sendRedirect(request.getContextPath() + "/program/list");
    }

    private void deleteProgram(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Program program = findProgramById(id);

        if (program != null) {
            programs.remove(program);
        }

        response.sendRedirect(request.getContextPath() + "/program/list");
    }

    private Program findProgramById(int id) {
        return programs.stream()
                .filter(p -> p.getId() == id)
                .findFirst()
                .orElse(null);
    }
}