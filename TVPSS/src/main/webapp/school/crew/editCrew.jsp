<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Crew</title>
    <link rel="stylesheet" href="../../css/styles.css?v=2">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <%@ include file="sidebar.jsp" %>
        <!-- Main Content -->
        <main class="content">
             <%@ include file="../header_school.jsp" %>

            <h1>Edit Crew</h1>
            <div class="form-container">
                <!-- Profile Image Upload -->
                <div class="image-upload">
                    <img src="../../img/crew_1.jpg" alt="Crew Profile" class="crew-image">
                    <label for="crew-photo" class="upload-label">Upload Crew Photo</label>
                    <input type="file" id="crew-photo" name="crewPhoto" style="opacity: 0" accept="img/*">
                </div>

                <!-- Form Fields -->
                <form action="CrewServlet" method="post">
                    <input type="hidden" name="crewId" value="${crew.id}">
                    
                    <div class="form-grid">
                        <!-- Row 1 -->
                        <div class="form-group">
                            <label for="fullName">Full Name (as per IC)</label>
                            <input type="text" id="fullName" name="fullName" 
                                   value="${crew.fullName}" 
                                   placeholder="Enter full name">
                        </div>
                        <div class="form-group">
                            <label for="icNumber">IC Number</label>
                            <input type="text" id="icNumber" name="icNumber" 
                                   value="${crew.icNumber}" 
                                   placeholder="Enter IC Number">
                        </div>

                        <!-- Row 2 -->
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" id="email" name="email" 
                                   value="${crew.email}" 
                                   placeholder="Enter email">
                        </div>
                        <div class="form-group">
                            <label for="contactNumber">Contact Number</label>
                            <input type="text" id="contactNumber" name="contactNumber" 
                                   value="${crew.contactNumber}" 
                                   placeholder="Enter contact number">
                        </div>

                        <!-- Row 3 -->
                        <div class="form-group">
						    <label for="gender">Gender</label>
						    <select id="gender" name="gender">
						        <option value="">Select Gender</option>
						        <option value="male" ${crew.gender == 'male' ? 'selected' : ''}>Male</option>
						        <option value="female" ${crew.gender == 'female' ? 'selected' : ''}>Female</option>
						    </select>
						</div>
						<div class="form-group">
						    <label for="role">Role</label>
						    <select id="role" name="role">
						        <option value="">Select Role</option>
						        <option value="reporter" ${crew.role == 'reporter' ? 'selected' : ''}>Reporter</option>
						        <option value="assistant-director" ${crew.role == 'assistant-director' ? 'selected' : ''}>Assistant Director</option>
						        <option value="camera-operator" ${crew.role == 'camera-operator' ? 'selected' : ''}>Camera Operator</option>
						        <option value="script-writer" ${crew.role == 'script-writer' ? 'selected' : ''}>Script Writer</option>
						        <option value="video-editor" ${crew.role == 'video-editor' ? 'selected' : ''}>Video Editor</option>
						    </select>
						</div>

                    <!-- Form Buttons -->
                    <div class="form-buttons">
                        <button type="submit" class="btn btn-primary">Save Changes</button>
                        <button type="button" class="btn btn-secondary" onclick="window.location.href='crewList.jsp'">Cancel</button>
                    </div>
                    </div>
                </form>
            </div>
        </main>
    </div>
</body>
</html>
