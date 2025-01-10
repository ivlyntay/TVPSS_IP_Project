<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.model.User"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Profile</title>
<link rel="stylesheet" href="../../css/sidebar_header.css">
<link rel="stylesheet" href="../../css/profile.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<!-- Sidebar -->
		<%@ include file="sidebar_profile.jsp" %>

		<!-- Main Content -->
		<main class="content">
			<%@ include file="../header_school.jsp" %>

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
							<label for="fullName">Admin Name (as per IC)</label>
							<input type="text" id="fullName" name="fullName" value="${user.fullName}" required>
						</div>
						<div class="form-group">
							<label for="icNumber">IC Number</label>
							<input type="text" id="icNumber" name="icNumber" value="${user.icNumber}" required>
						</div>
						
						<!-- Row 2 -->
						<div class="form-group">
							<label for="schoolName">School Name</label>
							<input type="text" id="schoolName" name="schoolName" value="${user.schoolName}" required>
						</div>
						<div class="form-group">
							<label for="email">Email</label>
							<input type="email" id="email" name="email" value="${user.email}" required>
						</div>
						
						<!-- Row 3 -->
						<div class="form-group">
							<label for="contactNumber">Contact Number</label>
							<input type="text" id="contactNumber" name="contactNumber" value="${user.contactNumber}" required>
						</div>
						<div class="form-group">
							<label for="district">District</label>
							<select id="district" name="district" required>
							<option value="">Select District</option>
								<option value="ledang" ${user.district == 'ledang' ? 'selected' : ''}>Ledang</option>
								<option value="segamat" ${user.district == 'segamat' ? 'selected' : ''}>Segamat</option>
								<option value="muar" ${user.district == 'muar' ? 'selected' : ''}>Muar</option>
								<option value="batupahat" ${user.district == 'batupahat' ? 'selected' : ''}>Batu Pahat</option>
								<option value="kluang" ${user.district == 'kluang' ? 'selected' : ''}>Kluang</option>
								<option value="mersing" ${user.district == 'mersing' ? 'selected' : ''}>Mersing</option>
								<option value="pontian" ${user.district == 'pontian' ? 'selected' : ''}>Pontian</option>
								<option value="kulaijaya" ${user.district == 'kulaijaya' ? 'selected' : ''}>Kulai Jaya</option>
								<option value="kotatinggi" ${user.district == 'kotatinggi' ? 'selected' : ''}>Kota Tinggi</option>
								<option value="johorbahru" ${user.district == 'johorbahru' ? 'selected' : ''}>Johor Bahru</option>
							</select>
						</div>
						
						<!-- Row 4 -->
						<div class="form-group">
							<label for="ytbLink">Youtube Channel Link</label>
							<input type="text" id="ytbLink" name="ytbLink" value="${user.youtubeLink}">
						</div>
						<div class="form-group">
							<label for="ytbName">Youtube Channel Name</label>
							<input type="text" id="ytbName" name="ytbName" value="${user.youtubeChannelName}">
						</div>
					</div>

					<!-- Submit Button -->
					<div class="form-buttons">
						<button type="submit" class="btn btn-primary">Save Changes</button>
						<button type="button" class="btn btn-secondary"
							onclick="window.location.href='profile.jsp'">Cancel</button>
					</div>
				</form>
			</div>
		</main>
		<script src="../../js/script.js"></script>
	</div>
</body>
</html>
