<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page import="com.example.model.User"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Management</title>

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

			<h1>User List</h1>
			<!-- Filter Section -->
			<section class="filter-section">
				<div class="search-container">
					<i class="bi bi-search search-icon"></i>
					<!-- Search Icon -->
					<input type="text" placeholder="Search..."
						class="header-search-bar">
				</div>
				<br>
				<div class="filter-container">
					<div class="filter-item">
						<i class="bi bi-funnel"></i>
						<!-- Filter Icon -->
						<span>Filter By</span>
					</div>
					<select class="filter-dropdown">
						<option value="">District</option>
						<option value="Ledang">Ledang</option>
						<option value="Segamat">Segamat</option>
						<option value="Muar">Muar</option>
						<option value="Batu Pahat">Batu Pahat</option>
						<option value="Kluang">Kluang</option>
						<option value="Mersing">Mersing</option>
						<option value="Pontian">Pontian</option>
						<option value="Kulai Jaya">Kulai Jaya</option>
						<option value="Kotat Tnggi">Kota Tinggi</option>
						<option value="Johor Bahru">Johor Bahru</option>
					</select>
					<button class="reset-button">
						<i class="bi bi-arrow-clockwise"></i> Reset Filter
					</button>
					<!-- <button class="btn btn-primary add-user-button"
						onclick="window.location.href='addUser.jsp'">Add User</button> -->
				</div>
			</section>

			<!-- User List Section -->
			<section class="user-list">
				<table>
					<thead>
						<tr>
							<th>User Id</th>
							<th>Admin Name</th>
							<th>School Name</th>
							<th>District</th>
							<th>Youtube Channel</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
							<tr>
								<td>1</td>
								<td>Tan Yun Xi</td>
								<td>SMK Johor</td>
								<td>Johor Bahru</td>
								<td><a href="https://www.youtube.com/@tvpsssktkk" target="_blank">TVPSS SKTKK (KK STUDIO)</a></td>
								
						<%-- <c:forEach var="user" items="${userList}">
							<tr>
								<td>${user.id}</td>
								<td>${user.fullName}</td>
								<td>${user.schoolName}</td>
								<td>${user.district}</td>
								<td>${user.formattedYoutubeLink}"</td>
								<td> --%>
								<td>
									<!-- View Icon -->
									<button class="action-btn"
										onclick="window.location.href='UserServlet?action=view&id=${user.id}'">
										<i class="bi bi-eye"></i>
										<!-- View icon -->
									</button> 
								<!-- Delete Icon -->
									<button class="action-btn"
										onclick="return confirm('Are you sure you want to delete this user?')">
										<i class="bi bi-trash"></i>
										<!-- Delete icon -->
									</button>
								</td>
							</tr>
						<%-- </c:forEach> --%>
					</tbody>
				</table>

			</section>
		</main>
		<script src="script.js"></script>
	</div>
</body>
</html>
