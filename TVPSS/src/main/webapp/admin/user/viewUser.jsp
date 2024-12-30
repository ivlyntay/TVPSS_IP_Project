<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>View User Profile</title>
<link rel="stylesheet" href="../../css/styles.css?v=2">
<link rel="stylesheet" href="../../css/user.css?v=2">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
	rel="stylesheet">
</head>
<body>
	<div class="container">
		<%@ include file="sidebar_user.jsp"%>
		<main class="content">
			<%@ include file="../header_tvpss.jsp"%>

			<!-- View User Profile Section -->
			<h1>User List&nbsp;&nbsp;>&nbsp;&nbsp;${user.fullName}</h1>

			<section class="view-user-profile">
				<div class="form-container">
					<div class="profile-details">
						<div class="image-upload">
							<img src="../../img/default.jpg" alt="User Profile"
								class="user-image">
						</div>
						<table>
							<tr>
								<td>Admin Name:</td>
								<td>${user.fullName}</td>
							</tr>
							<tr>
								<td>IC Number:</td>
								<td>${user.icNumber}</td>
							</tr>
							<tr>
								<td>School Name:</td>
								<td>${user.schoolName}</td>
							</tr>
							<tr>
								<td>District:</td>
								<td>${user.district}</td>
							</tr>
							<tr>
								<td>Email:</td>
								<td>${user.email}</td>
							</tr>
							<tr>
								<td>Contact Number:</td>
								<td>${user.contactNumber}</td>
							</tr>
							<tr>
								<td>Youtube Channel:</td>
								<td><a href="https://www.youtube.com/@tvpsssktkk" target="_blank">TVPSS SKTKK (KK STUDIO)</a></td>
								<%-- <td>${user.formattedYoutubeLink}</td> --%>
								
							</tr>
						</table>
					</div>					
				</div>
				<div class="form-buttons">
						<button type="button" class="btn btn-primary"
							onclick="window.location.href='userList.jsp'">Back</button>
					</div>
			</section>
		</main>
		<script src="script.js"></script>
	</div>
</body>
</html>
