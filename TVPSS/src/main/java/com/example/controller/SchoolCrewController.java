package com.example.controller;

import com.example.model.CrewMember;
import com.example.repository.CrewMemberDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/crew")
public class SchoolCrewController {

    @Autowired
    private CrewMemberDao crewMemberDao;

    @GetMapping
    public String listCrew(Model model) {
        List<CrewMember> crewList = crewMemberDao.getAllCrewMembers();  // Get crew members from the database
        model.addAttribute("crewList", crewList);
        return "school/crew/crewList"; // Return view name
    }

    @GetMapping("/view/{id}")
    public String viewCrew(@PathVariable int id, Model model) {
        CrewMember crew = crewMemberDao.getCrewMemberById(id);  // Fetch crew member by ID from the database
        if (crew != null) {
            model.addAttribute("crew", crew);
            return "school/crew/viewCrew";
        }
        return "redirect:/crew"; // Redirect to crew list if not found
    }

    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("crew", new CrewMember()); // Empty CrewMember for the form
        return "school/crew/addCrew";
    }

    @PostMapping("/add")
    public String addCrew(@ModelAttribute CrewMember crew, @RequestParam("photo") MultipartFile file, RedirectAttributes redirectAttributes) throws IOException {
        if (!isValidEmail(crew.getEmail()) || !isValidContact(crew.getContactNumber())) {
            redirectAttributes.addFlashAttribute("error", "Invalid email or contact number");
            return "redirect:/crew/add";
        }

        String photoName = savePhoto(file);
        crew.setPhoto(photoName); // Set photo name

        crewMemberDao.saveCrewMember(crew);  // Save the new crew member to the database
        redirectAttributes.addFlashAttribute("message", "Crew added successfully");
        return "redirect:/crew";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable int id, Model model) {
        CrewMember crew = crewMemberDao.getCrewMemberById(id);  // Fetch crew member by ID from the database
        if (crew != null) {
            model.addAttribute("crew", crew);
            return "school/crew/editCrew";
        }
        return "redirect:/crew"; // Redirect if crew not found
    }

    @PostMapping("/update")
    public String updateCrew(@ModelAttribute CrewMember crew, RedirectAttributes redirectAttributes) {
        crewMemberDao.updateCrewMember(crew);  // Update crew member in the database
        redirectAttributes.addFlashAttribute("message", "Crew updated successfully");
        return "redirect:/crew";
    }

    @GetMapping("/delete/{id}")
    public String deleteCrew(@PathVariable int id, RedirectAttributes redirectAttributes) {
        crewMemberDao.deleteCrewMember(id);  // Delete crew member from the database
        redirectAttributes.addFlashAttribute("message", "Crew deleted successfully");
        return "redirect:/crew";
    }

    private boolean isValidEmail(String email) {
        return email != null && email.matches("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$");
    }

    private boolean isValidContact(String contact) {
        return contact != null && contact.matches("^\\d{10,15}$");
    }

    private String savePhoto(MultipartFile file) throws IOException {
        if (file.isEmpty()) {
            return "default.jpg"; // Default photo if no file uploaded
        }

        // Save file logic here, for example, save in a folder under /uploaded_photos/
        String fileName = file.getOriginalFilename();
        String uploadDir = "C:/uploads"; // You can change the directory as needed

        // Save the file
        file.transferTo(new File(uploadDir + File.separator + fileName));

        return fileName;
    }
}
