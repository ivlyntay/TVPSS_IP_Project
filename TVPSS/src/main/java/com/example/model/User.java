package com.example.model;

public class User {
	private String fullName;
    private String icNumber;
    private String schoolName;
    private String district;
    private String email;
    private String contactNumber;
    private String password;
    private String ytbLink;
    private String ytbName;
	

    public User(String fullName, String icNumber, String schoolName, String district, String email, String contactNumber, String password) {
        this.fullName = fullName;
        this.icNumber = icNumber;
        this.schoolName = schoolName;
        this.district = district;
        this.email = email;
        this.contactNumber = contactNumber;
        this.password = password;
    }

	/*
	 * public User(String fullName, String icNumber, String schoolName, String
	 * email, String contactNumber, String district, String ytbLink, String ytbName)
	 * { this.fullName = fullName; this.icNumber = icNumber; this.schoolName =
	 * schoolName; this.email = email; this.contactNumber = contactNumber;
	 * this.district = district; this.ytbLink = ytbLink; this.ytbName = ytbName;
	 */

	
	 public String getFullName() { return fullName; }
	    public void setFullName(String fullName) { this.fullName = fullName; }

	    public String getIcNumber() { return icNumber; }
	    public void setIcNumber(String icNumber) { this.icNumber = icNumber; }

	    public String getSchoolName() { return schoolName; }
	    public void setSchoolName(String schoolName) { this.schoolName = schoolName; }

	    public String getEmail() { return email; }
	    public void setEmail(String email) { this.email = email; }

	    public String getContactNumber() { return contactNumber; }
	    public void setContactNumber(String contactNumber) { this.contactNumber = contactNumber; }

	    public String getDistrict() { return district; }
	    public void setDistrict(String district) { this.district = district; }

	    public String getYoutubeLink() { return ytbLink; }
	    public void setYoutubeLink(String ytbLink) { this.ytbLink = ytbLink; }

	    public String getYoutubeChannelName() { return ytbName; }
	    public void setYoutubeChannelName(String ytbName) { this.ytbName = ytbName; }

	    public String getPassword() {return password;}
	    public void setPassword(String password) {this.password = password;

	}
}