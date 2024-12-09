// ProgramController.java
package com.example.controller;

import com.example.model.Program;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/programs")
public class ProgramController {
    private List<Program> programs = new ArrayList<>();

    @GetMapping
    public String listPrograms(Model model) {
        model.addAttribute("programs", programs);
        return "program";
    }

    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("program", new Program());
        return "program-form";
    }

    @PostMapping("/add")
    public String addProgram(@ModelAttribute Program program) {
        program.setId(programs.size() + 1);
        program.setActive(true);
        programs.add(program);
        return "redirect:/programs";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable int id, Model model) {
        Program program = findProgramById(id);
        model.addAttribute("program", program);
        return "program-form";
    }

    @PostMapping("/edit/{id}")
    public String updateProgram(@PathVariable int id, @ModelAttribute Program program) {
        Program existingProgram = findProgramById(id);
        if (existingProgram != null) {
            existingProgram.setName(program.getName());
            existingProgram.setDescription(program.getDescription());
            existingProgram.setDuration(program.getDuration());
            existingProgram.setCategory(program.getCategory());
            existingProgram.setDifficulty(program.getDifficulty());
            existingProgram.setTrainer(program.getTrainer());
        }
        return "redirect:/programs";
    }

    @GetMapping("/delete/{id}")
    public String deleteProgram(@PathVariable int id) {
        programs.removeIf(p -> p.getId() == id);
        return "redirect:/programs";
    }

    private Program findProgramById(int id) {
        return programs.stream()
                .filter(p -> p.getId() == id)
                .findFirst()
                .orElse(null);
    }
}