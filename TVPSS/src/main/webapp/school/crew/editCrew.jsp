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
             <%@ include file="../header_admin.jsp" %>

            <h1>Edit Crew</h1>
            <div class="form-container">
                <!-- Profile Image Upload -->
                <div class="image-upload">
                    <img src="<%= request.getAttribute("crewImage") != null ? request.getAttribute("crewImage") : "../img/default.jpg" %>" 
                         alt="Crew Profile" class="crew-image">
                    <label for="crew-photo" class="upload-label">Upload Crew Photo</label>
                    <input type="file" id="crew-photo" name="crewPhoto" style="opacity: 0" accept="img/*">
                </div>

                <!-- Form Fields -->
                <form action="EditCrewServlet" method="post">
                    <input type="hidden" name="crewId" value="<%= request.getAttribute("crewId") %>">
                    
                    <div class="form-grid">
                        <!-- Row 1 -->
                        <div class="form-group">
                            <label for="fullName">Full Name (as per IC)</label>
                            <input type="text" id="fullName" name="fullName" 
                                   value="<%= request.getAttribute("fullName") %>" 
                                   placeholder="Enter full name">
                        </div>
                        <div class="form-group">
                            <label for="icNumber">IC Number</label>
                            <input type="text" id="icNumber" name="icNumber" 
                                   value="<%= request.getAttribute("icNumber") %>" 
                                   placeholder="Enter IC Number">
                        </div>

                        <!-- Row 2 -->
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" id="email" name="email" 
                                   value="<%= request.getAttribute("email") %>" 
                                   placeholder="Enter email">
                        </div>
                        <div class="form-group">
                            <label for="contactNumber">Contact Number</label>
                            <input type="text" id="contactNumber" name="contactNumber" 
                                   value="<%= request.getAttribute("contactNumber") %>" 
                                   placeholder="Enter contact number">
                        </div>

                        <!-- Row 3 -->
                        <div class="form-group">
                            <label for="gender">Gender</label>
                            <select id="gender" name="gender">
                                <option value="">Select gender</option>
                                <option value="male" <%= "male".equals(request.getAttribute("gender")) ? "selected" : "" %>>Male</option>
                                <option value="female" <%= "female".equals(request.getAttribute("gender")) ? "selected" : "" %>>Female</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="role">Role</label>
                            <select id="role" name="role">
                                <option value="">Select role</option>
                                <option value="reporter" <%= "reporter".equals(request.getAttribute("role")) ? "selected" : "" %>>Reporter</option>
                                <option value="assistant-director" <%= "assistant-director".equals(request.getAttribute("role")) ? "selected" : "" %>>Assistant Director</option>
                                <option value="camera-operator" <%= "camera-operator".equals(request.getAttribute("role")) ? "selected" : "" %>>Camera Operator</option>
                                <option value="script-writer" <%= "script-writer".equals(request.getAttribute("role")) ? "selected" : "" %>>Script Writer</option>
                                <option value="video-editor" <%= "video-editor".equals(request.getAttribute("role")) ? "selected" : "" %>>Video Editor</option>
                            </select>
                        </div>
                    </div>

                    <!-- Form Buttons -->
                    <div class="form-buttons">
                        <button type="submit" class="btn btn-primary">Save Changes</button>
                        <button type="button" class="btn btn-secondary" onclick="window.location.href='crewList.jsp'">Cancel</button>
                    </div>
                </form>
            </div>
        </main>
    </div>
</body>
</html>
