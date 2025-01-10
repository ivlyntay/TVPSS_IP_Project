<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Profile</title>
<link rel="stylesheet" href="../../css/sidebar_header.css">
<link rel="stylesheet" href="../../css/profile.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
	rel="stylesheet">
</head>
<body>
	<div class="container">
		<!-- Sidebar -->
		<%@ include file="sidebar_profile.jsp"%>

		<!-- Main Content -->
		<main class="content">
			<%@ include file="../header_school.jsp" %>
			<h1>Profile</h1>
            <div class="form-container">
                <!-- Profile Image Upload -->
                <div class="image-upload">
                    <div class="image-circle">
                        <img src="../../img/profile.png" alt="${user.fullName}">
                    </div>
                </div>

                <!-- Form Fields -->
                <form action="updateProfile.jsp" method="post">
                    <div class="form-grid">
                        <!-- Row 1 -->
                        <div class="form-group">
                            <label for="fullName">Admin Name (as per IC)</label>
                            <input type="text" id="fullName" name="fullName" value="${user.fullName}" readonly>
                        </div>
                        <div class="form-group">
                            <label for="icNumber">IC Number</label>
                            <input type="text" id="icNumber" name="icNumber" value="${user.icNumber}" readonly>
                        </div>
                        
                        <!-- Row 2 -->
                        <div class="form-group">
                            <label for="schoolName">School Name</label>
                            <input type="text" id="schoolName" name="schoolName" value="${user.schoolName}" readonly>
                        </div>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" id="email" name="email" value="${user.email}" readonly>
                        </div>
                        
                        <!-- Row 3 -->
                        <div class="form-group">
                            <label for="contactNumber">Contact Number</label>
                            <input type="text" id="contactNumber" name="contactNumber" value="${user.contactNumber}" readonly>
                        </div>
                        <div class="form-group">
                            <label for="district">District</label>
                            <input type="text" id="district" name="district" value="${user.district}" readonly>
                        </div>
                        
                        <!-- Row 4 -->
                        <div class="form-group">
                            <label for="ytbLink">YouTube Channel Link</label>
                            <a href="<%= user.getYoutubeLink() %>" target="_blank" id="ytbLink"><%= user.getYoutubeLink() %></a>
                        </div>
                        <div class="form-group">
                            <label for="ytbName">YouTube Channel Name</label>
                            <input type="text" id="ytbName" name="ytbName" value="<%= user.getYoutubeChannelName() %>" readonly>
                        </div>
                    </div>

					<!-- Form Buttons (Moved inside form-container) -->
					<div class="form-buttons">
						<button type="button" class="btn btn-primary"
							onclick="window.location.href='editProfile.jsp'">Edit</button>

					</div>
				</form>
			</div>
		</main>
	</div>
</body>
</html>
