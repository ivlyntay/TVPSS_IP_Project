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
                <li class="active"><a href="../profile/profile.jsp"><i class="bi bi-person"></i> Profile</a></li>
                <li ><a href="../setting/setting.jsp"><i class="bi bi-gear"></i> Settings</a></li>
                <li class="separator"></li>
                <li class="logout"><a href="#"><i class="bi bi-box-arrow-right"></i> Logout</a></li>
            </ul>
        </aside>

		<!-- Main Content -->
		<main class="content">
			<header class="header">
				<div class="header-right">
					<div class="profile">
						<img src="../../img/profile.png" alt="Moni Roy"
							class="profile-image">
						<div class="profile-details">
							<span class="profile-name">Moni Roy</span><br> <span
								class="role">Admin</span>
						</div>
					</div>
				</div>
			</header>

			<h1>Profile</h1>
			<div class="form-container">
				<!-- Profile Image Upload -->
				<div class="image-upload">
					<div class="image-circle">
						<img src="../../img/profile.png" alt="Moni Roy" >
					</div>
					<!-- Label with file input styled -->		
					<label for="crew-photo" class="upload-label">Upload Profile Picture</label> <input type="file" id="crew-photo" name="crewPhoto"
						style="opacity: 0" accept="image/*">
				</div>

				<!-- Form Fields -->
				<form action="#" method="post">
					<div class="form-grid">
						<!-- Row 1 -->
						<div class="form-group">
							<label for="fullName">Admin Name (as per IC)</label>
							<%-- <input type="text" id="fullName" name="fullName" value="${user.fullName}" readonly> --%>
							<input type="text" id="fullName" name="fullName" value="Moni Roy" readonly>
						</div>
						<div class="form-group">
							<label for="icNumber">IC Number</label>
							<%-- <input type="text" id="icNumber" name="icNumber" value="${user.icNumber}" readonly> --%>
							<input type="text" id="icNumber" name="icNumber" value="751024041234" readonly>
						</div>
						
						<!-- Row 2 -->
						<div class="form-group">
							<label for="schoolName">School Name</label>
							<%-- <input type="text" id="schoolName" name="schoolName" value="${user.schoolName}" readonly> --%>
							<input type="text" id="schoolName" name="schoolName" value="SMK Bandar Kota Tinggi" readonly>
						</div>
						<div class="form-group">
							<label for="email">Email</label>
							<%-- <input type="email" id="email" name="email" value="${user.email}" readonly> --%>
							<input type="email" id="email" name="email" value="moni@gmail.com" readonly>
						</div>
						
						<!-- Row 3 -->
						<div class="form-group">
							<label for="contactNumber">Contact Number</label>
							<%-- <input type="text" id="contactNumber" name="contactNumber" value="${user.contactNumber}" readonly> --%>
							<input type="text" id="contactNumber" name="contactNumber" value="0123456789" readonly>
						</div>
						<div class="form-group">
							<label for="district">District</label>
							<%-- <input type="text" id="district" name="district" value="${user.district}" readonly> --%>
							<input type="text" id="district" name="district" value="Kota Tinggi" readonly>
						</div>
						
						<!-- Row 4 -->
						<div class="form-group">
    						<label for="ytbLink">Youtube Channel Link</label>
    						<%-- <input type="text" id="ytbLink" name="ytbLink" value="${user.youtubeLink}" readonly> --%>
    						<a href="https://youtube.com/@TVPSSBKT" target="_blank" id="ytbLink" name="ytbLink">youtube.com/@TVPSSBKT
						    </a>
						</div>
						
						<div class="form-group">
							<label for="ytbName">Youtube Channel Name</label>
							<%-- <input type="text" id="ytbName" name="ytbName" value="${user.youtubeChannelName}" readonly> --%>
							<input type="text" id="ytbName" name="ytbName" value="TVPSS BKT" readonly>
						</div>
					</div>
				
					<!-- Form Buttons (Moved inside form-container) -->
					<div class="form-buttons">
						<button type="button" class="btn btn-primary" onclick="window.location.href='editProfile.jsp'">Edit</button>

					</div>
				</form>
			</div>
		</main>
	</div>
</body>
</html>
