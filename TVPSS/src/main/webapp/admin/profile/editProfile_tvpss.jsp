<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.model.User"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Profile</title>

<link rel="stylesheet" href="../../css/profile.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<!-- Sidebar -->
		<%@ include file="sidebar_profile.jsp" %>

		<!-- Main Content -->
		<main class="content">
			<%@ include file="../header_tvpss.jsp" %>

			<h1>Edit Profile</h1>
			<div class="form-container">
				<!-- Profile Image Upload -->
				<div class="image-upload">
					<div class="image-circle" id="image-circle">
						<img src="../../img/profile.png" id="profile-pic" >
					</div>
					<label for="crew-photo" class="upload-label">Upload Profile Picture</label> 
					<input type="file" id="crew-photo" name="crewPhoto" style="opacity: 0" accept="image/*">	
				</div>

				<!-- Form Fields (Editable) -->
				<form action="updateProfile.jsp" method="post">
					<div class="form-grid">
						<!-- Row 1 -->
						<div class="form-group">
							<label for="fullName">First Name</label>
							<input type="text" id="fullName" name="fullName" value="Roy" required>
						</div>
						<div class="form-group">
							<label for="icNumber">IC Number</label>
							<input type="text" id="icNumber" name="icNumber" value="Mony" required>
						</div>
						
						<!-- Row 2 -->
						<div class="form-group">
							<label for="email">Email</label>
							<input type="email" id="email" name="email" value="mony@gmail.com" required>
						</div>
						<div class="form-group">
							<label for="contactNumber">Contact Number</label>
							<input type="text" id="contactNumber" name="contactNumber" value="011-10746752" required>
						</div>
						
					</div>

					<!-- Submit Button -->
					<div class="form-buttons">
						<button type="submit" class="btn btn-primary">Save Changes</button>
						<button type="button" class="btn btn-secondary"
							onclick="window.location.href='profile_tvpss.jsp'">Cancel</button>
					</div>
				</form>
			</div>
		</main>
		<script src="../../js/script.js"></script>
	</div>
</body>
</html>
