package com.example.model;

public class CrewMember {
    private int id;
    private String fullName;
    private String role;
    private String email;
    private String contactNumber;
    private String gender;
    private String icNumber;
    private String photo;  // Path to the uploaded photo

    // Constructor with photo path
    public CrewMember(int id, String fullName,String icNumber,String email, String contactNumber,String gender, String role) {
        this.id = id;
        this.fullName = fullName;
        this.icNumber=icNumber;
        this.email=email;
        this.contactNumber=contactNumber;
        this.gender=gender;
        this.role=role;
        
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getContactNumber() {
        return contactNumber;
    }

    public void setContactNumber(String contactNumber) {
        this.contactNumber = contactNumber;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getIcNumber() {  // New getter for IC Number
        return icNumber;
    }

    public void setIcNumber(String icNumber) {  // New setter for IC Number
        this.icNumber = icNumber;
    }
    
    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }
}
