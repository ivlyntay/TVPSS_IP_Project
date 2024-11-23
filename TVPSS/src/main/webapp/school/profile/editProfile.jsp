<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<%--  <%@ include file="../../sidebar.jsp" %> --%>
		<aside class="sidebar">
            <div class="logo">
                <img src="../../img/logo.png" alt="TVPSS Logo" class="logo-image">
                TVPSS 7G
            </div>
            <ul class="menu">
                <li><a href="#"><i class="bi bi-speedometer2"></i> Dashboard</a></li>
                <li><a href="#"><i class="bi bi-journal-text"></i> Content Management</a></li>
                <li><a href="#"><i class="bi bi-bar-chart"></i> Program Status Management</a></li>
                <li><a href="../crew/crewList.jsp"><i class="bi bi-people"></i> Crew Management</a></li>
                <li  class="active"><a href="../profile/profile.jsp"><i class="bi bi-person"></i> Profile</a></li>
                <li><a href="../setting/setting.jsp"><i class="bi bi-gear"></i> Settings</a></li>
                <li class="separator"></li>
                <li class="logout"><a href="#"><i class="bi bi-box-arrow-right"></i> Logout</a></li>
            </ul>
        </aside>

		<!-- Main Content -->
		<main class="content">
			<header class="header">
				<div class="header-right">
					<div class="profile">
						<img src="../../img/profile.png" alt="Moni Roy" class="profile-image">
						<div class="profile-details">
							<span class="profile-name">Moni Roy</span><br>
							<span class="role">Admin</span>
						</div>
					</div>
				</div>
			</header>

			<h1>Edit Profile</h1>
			<div class="form-container">
				<!-- Profile Image Upload -->
				<div class="image-upload">
					<div class="image-circle">
						<img src="../../img/profile.png" alt="Moni Roy">
					</div>
					<label for="crew-photo" class="upload-label">Upload Profile Picture</label> <input type="file" id="crew-photo" name="crewPhoto"
						style="opacity: 0" accept="image/*">
					<!-- <label for="crew-photo" class="upload-label">Upload Profile Picture</label> 
					<input type="file" id="crew-photo" name="crewPhoto" accept="image/*"> -->
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
	</div>
</body>
</html>
