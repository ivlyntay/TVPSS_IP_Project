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
<script>
    // Toggle password visibility function
    function togglePasswordVisibility(inputId, iconId) {
        var input = document.getElementById(inputId);
        var icon = document.getElementById(iconId);
        if (input.type === "password") {
            input.type = "text";
            icon.classList.remove("bi-eye-slash");
            icon.classList.add("bi-eye");
        } else {
            input.type = "password";
            icon.classList.remove("bi-eye");
            icon.classList.add("bi-eye-slash");
        }
    }
</script>
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
                <li ><a href="../profile/profile.jsp"><i class="bi bi-person"></i> Profile</a></li>
                <li class="active"><a href="../setting/setting.jsp"><i class="bi bi-gear"></i> Settings</a></li>
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

			<h1>Settings</h1>
			<div class="form-container">
				<!-- Form Fields -->
				<form action="#" method="post">
					<div class="form2-grid">
						<!-- Row 1 -->
						<div class="form-group">
							<label for="password">Current Password</label>
							<div class="password-container">
								<input type="password" id="password" name="password" value="123456" readonly>
								<i class="bi bi-eye-slash" id="togglePassword1" onclick="togglePasswordVisibility('password', 'togglePassword1')"></i>
							</div>
						</div>
						
						<!-- Row 2 -->
						<div class="form-group">
							<label for="newPassword">New Password</label>
							<div class="password-container">
								<input type="password" id="newPassword" name="newPassword" value="" readonly>
								<i class="bi bi-eye-slash" id="togglePassword2" onclick="togglePasswordVisibility('newPassword', 'togglePassword2')"></i>
							</div>
						</div>
						
						<!-- Row 3 -->
						<div class="form-group">
							<label for="confirmPassword">Confirm Password</label>
							<div class="password-container">
								<input type="password" id="confirmPassword" name="confirmPassword" value="" readonly>
								<i class="bi bi-eye-slash" id="togglePassword3" onclick="togglePasswordVisibility('confirmPassword', 'togglePassword3')"></i>
							</div>
						</div>
					</div>
				
					<!-- Form Buttons (Moved inside form-container) -->
					<div class="form-buttons">
						<button type="submit" class="btn btn-primary" onclick="window.location.href='setting.jsp'">Save Changes</button>
					</div>
				</form>
			</div>
		</main>
	</div>
</body>
</html>
