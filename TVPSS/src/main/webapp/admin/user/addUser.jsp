<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New User</title>
    <link rel="stylesheet" href="../../css/styles.css?v=2">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <%@ include file="sidebar_user.jsp" %>
        <!-- Main Content -->
        <main class="content">
            <%@ include file="../header_tvpss.jsp" %>

            <h1>Add New User</h1>
            <div class="form-container">
		    <!-- Profile Image Upload -->
		    <div class="image-upload">
			    <div class="image-circle" id="image-circle">
			    <i class="bi bi-camera-fill" id="camera-icon" style="font-size: 30px;"></i>
			        <img src="../../img/camera.png" id="profile-pic" style="display: none;">
			    </div>
			    <label for="crew-photo" class="upload-label">Upload User Photo</label>
			    <input type="file" id="crew-photo" name="crewPhoto" style="opacity: 0" accept="image/*">
			</div>

                <!-- Form Fields -->
                <form action="UserServlet" method="post" enctype="multipart/form-data">
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
                            <label for="schoolName">School Name</label>
                            <input type="text" id="schoolName" name="schoolName" placeholder="Enter school name" required>
                        </div>
                        <div class="form-group">
                            <label for="district">Disrict</label>
                            <select id="district" name="district" required>
                                <option value="">Select District</option>
			                    <option value="ledang">Ledang</option>
								<option value="segamat">Segamat</option>
								<option value="muar">Muar</option>
								<option value="batupahat">Batu Pahat</option>
								<option value="kluang">Kluang</option>
								<option value="mersing">Mersing</option>
								<option value="pontian">Pontian</option>
								<option value="kulaijaya">Kulai Jaya</option>
								<option value="kotatinggi">Kota Tinggi</option>
								<option value="johorbahru">Johor Bahru</option>
                            </select>
                        </div>
                        <!-- Row 3 -->
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" id="email" name="email" placeholder="Enter email" required>
                        </div> 
                        <div class="form-group">
                            <label for="contactNumber">Contact Number</label>
                            <input type="text" id="contactNumber" name="contactNumber" placeholder="Enter contact number" required>
                        </div>
                        <!-- Row 4 -->
                        <div class="form-group">
                            <label for=ytbLink>Youtube Channel Link</label>
                            <input type="text" id="ytbLink" name="ytbLink" placeholder="Enter Youtube Channel Link" required>
                        </div> 
                        <div class="form-group">
                            <label for="ytbName">Youtube Channel Name</label>
                            <input type="text" id="ytbName" name="ytbName" placeholder="Enter Youtube Channel Name" required>
                        </div>
                        
                    </div>

                    <!-- Form Buttons (Moved inside form-container) -->
                    <div class="form-buttons">
                        <button type="submit" class="btn btn-primary" name="action" value="add">Add Now</button>
                        <button type="button" class="btn btn-secondary" onclick="window.location.href='userList.jsp'">Cancel</button>
                    </div>
                </form>
            </div>
        </main>
       <script src="../../js/script.js"></script>
    </div>
</body>
</html>
