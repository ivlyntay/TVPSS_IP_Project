<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Settings</title>
<link rel="stylesheet" href="../../css/sidebar_header.css">
<link rel="stylesheet" href="../../css/settings.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
	rel="stylesheet">
</head>
<body>
	<div class="container">
		<!-- Sidebar -->
		<aside class="sidebar">
			<div class="logo">
				<img src="../../img/logo.png" alt="TVPSS Logo" class="logo-image">
				TVPSS 7G
			</div>
			<ul class="menu">
        <li><a href="../dashboard/dashboard.jsp"><i class="bi bi-speedometer2"></i> Dashboard</a></li>
        <li><a href="../user/userList.jsp"><i class="bi bi-border-all"></i> User Management</a></li>
        <li><a href="../content/contentList.jsp"><i class="bi bi-journal-text"></i> Content Management</a></li>
        <li><a href="../program/programList.jsp"><i class="bi bi-bar-chart"></i> Program Status Management</a></li>
        <li><a href="../crew/crewList.jsp"><i class="bi bi-people"></i> Crew Management</a></li>
        <li><a href="../profile/profile_tvpss.jsp"><i class="bi bi-person"></i> Profile</a></li>
        <li class="active"><a href="../setting/setting_tvpss.jsp"><i class="bi bi-gear"></i> Settings</a></li>
        <li class="separator"></li>
        <li class="logout"><a href="../../login.jsp"><i class="bi bi-box-arrow-right"></i> Logout</a></li>
    </ul>
		</aside>

		<!-- Main Content -->
		<main class="content">
			<%@ include file="../header_tvpss.jsp" %>

			<h1>Settings</h1>
			<div class="form-container">
				<!-- Form Fields -->
				<form action="UpdatePasswordServlet" method="post">
					<div class="form2-grid">
						<!-- Current Password -->
						<div class="form-group">
							<label for="password">Current Password</label>
							<div class="password-container">
								<input type="password" id="password" name="currentPassword"
									value="${currentPassword}" required> <i
									class="bi bi-eye-slash" id="togglePassword1"
									onclick="togglePasswordVisibility('password', 'togglePassword1')"></i>
							</div>
						</div>

						<!-- New Password -->
						<div class="form-group">
							<label for="newPassword">New Password</label>
							<div class="password-container">
								<input type="password" id="newPassword" name="newPassword"
									required> <i class="bi bi-eye-slash"
									id="togglePassword2"
									onclick="togglePasswordVisibility('newPassword', 'togglePassword2')"></i>
							</div>
						</div>

						<!-- Confirm Password -->
						<div class="form-group">
							<label for="confirmPassword">Confirm Password</label>
							<div class="password-container">
								<input type="password" id="confirmPassword"
									name="confirmPassword" required> <i
									class="bi bi-eye-slash" id="togglePassword3"
									onclick="togglePasswordVisibility('confirmPassword', 'togglePassword3')"></i>
							</div>
						</div>
					</div>

					<div class="form-buttons">
						<button type="submit" class="btn btn-primary">Save
							Changes</button>
					</div>
				</form>
			</div>
		</main>
		  <script src="../../js/setting.js"></script>
	</div>
</body>
</html>
