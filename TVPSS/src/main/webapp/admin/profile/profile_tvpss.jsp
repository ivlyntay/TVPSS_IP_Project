<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Profile</title>

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
			  <%@ include file="../header_tvpss.jsp" %>
			<h1>Profile</h1>
            <div class="form-container">
                <!-- Profile Image Upload -->
                <div class="image-upload">
                    <div class="image-circle">
                        <img src="../../img/profile.png">
                    </div>
                </div>

                <!-- Form Fields -->
                <form action="updateProfile.jsp" method="post">
                    <div class="form-grid">
                        <!-- Row 1 -->
                        <div class="form-group">
                            <label for="fullName">First Name (as per IC)</label>
                            <input type="text" id="fullName" name="fullName" value="Roy" readonly>
                        </div>
                         <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" id="email" name="email" value="Moni" readonly>
                        </div>
                        
                        <!-- Row 2 -->
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" id="email" name="email" value="mony@gmail.com" readonly>
                        </div>
                       <div class="form-group">
                            <label for="contactNumber">Contact Number</label>
                            <input type="text" id="contactNumber" name="contactNumber" value="011-10746752" readonly>
                        </div>    
                    </div>

					<!-- Form Buttons (Moved inside form-container) -->
					<div class="form-buttons">
						<button type="button" class="btn btn-primary"
							onclick="window.location.href='editProfile_tvpss.jsp'">Edit</button>

					</div>
				</form>
			</div>
		</main>
	</div>
</body>
</html>
