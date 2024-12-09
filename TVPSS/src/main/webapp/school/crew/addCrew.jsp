<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Crew</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css?v=2">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <%@ include file="sidebar.jsp" %>
        <!-- Main Content -->
        <main class="content">
            <%@ include file="../header_school.jsp" %>

            <h1>Add New Crew</h1>
            <div class="form-container">
		    <!-- Profile Image Upload -->
		    <div class="image-upload">
			    <div class="image-circle" id="image-circle">
			    <i class="bi bi-camera-fill" id="camera-icon" style="font-size: 30px;"></i>
			        <img src="../../img/camera.png" id="profile-pic" style="display: none;">
			    </div>
			    <label for="crew-photo" class="upload-label">Upload Crew Photo</label>
			    <input type="file" id="crew-photo" name="crewPhoto" style="opacity: 0" accept="image/*">
			</div>

                <!-- Form Fields -->
                <form action="CrewServlet" method="post" enctype="multipart/form-data">
                    <div class="form-grid">
                        <!-- Row 1 -->
                        <div class="form-group">
                            <label for="fullName">Full Name (as per IC)</label>
                            <input type="text" id="fullName" name="fullName" placeholder="Enter full name" required>
                        </div>
                         <div class="form-group">
                            <label for="icNumber">IC Number</label>
                            <input type="text" id="icNumber" name="icNumber" placeholder="Enter IC Number" required>
                        </div>

                        <!-- Row 2 -->
                    <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" id="email" name="email" placeholder="Enter email" required>
                        </div>
                        <div class="form-group">
                            <label for="contactNumber">Contact Number</label>
                            <input type="text" id="contactNumber" name="contactNumber" placeholder="Enter contact number" required>
                        </div>

                        <!-- Row 3 -->
                       <div class="form-group">
                            <label for="gender">Gender</label>
                            <select id="gender" name="gender" required>
                                <option value="">Select gender</option>
                                <option value="male">Male</option>
                                <option value="female">Female</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="role">Role</label>
                            <select id="role" name="role" required>
                                <option value="">Select role</option>
                                <option value="reporter">Reporter</option>
                                <option value="assistant-director">Assistant Director</option>
                                <option value="camera-operator">Camera Operator</option>
                                <option value="script-writer">Script Writer</option>
                                <option value="video-editor">Video Editor</option>
                            </select>
                        </div>
                    </div>

                    <!-- Form Buttons (Moved inside form-container) -->
                    <div class="form-buttons">
                        <button type="submit" class="btn btn-primary" name="action" value="add">Add Now</button>
                        <button type="button" class="btn btn-secondary" onclick="window.location.href='crewList.jsp'">Cancel</button>
                    </div>
                </form>
            </div>
        </main>
       <script src="../../js/script.js"></script>
    </div>
</body>
</html>
