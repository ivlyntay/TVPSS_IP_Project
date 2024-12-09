// Program.java
package com.example.model;

public class Program {
    private int id;
    private String name;
    private String description;
    private int duration;
    private String category;
    private String difficulty;
    private String trainer;
    private boolean isActive;

    // Default constructor
    public Program() {}

    // Parameterized constructor
    public Program(int id, String name, String description, int duration, 
                  String category, String difficulty, String trainer, boolean isActive) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.duration = duration;
        this.category = category;
        this.difficulty = difficulty;
        this.trainer = trainer;
        this.isActive = isActive;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getDifficulty() {
        return difficulty;
    }

    public void setDifficulty(String difficulty) {
        this.difficulty = difficulty;
    }

    public String getTrainer() {
        return trainer;
    }

    public void setTrainer(String trainer) {
        this.trainer = trainer;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }
}