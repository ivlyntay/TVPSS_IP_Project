<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page import="com.example.model.User" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Management</title>
    <link rel="stylesheet" href="../../css/styles.css?v=2">
    <link rel="stylesheet" href="../../css/user.css?v=2">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>
    <div class="container">
    <%@ include file="sidebar_user.jsp" %>
    <main class="content">
         <%@ include file="../header_tvpss.jsp" %>
        
        <h1>User List</h1>
        <!-- Filter Section -->
        <section class="filter-section">
        	<div class="search-container">
				        <i class="bi bi-search search-icon"></i> <!-- Search Icon -->
				        <input type="text" placeholder="Search..." class="header-search-bar">
			</div><br>
            <div class="filter-container">
                <div class="filter-item">
                    <i class="bi bi-funnel"></i> <!-- Filter Icon -->
                    <span>Filter By</span>
                </div>
                <select class="filter-dropdown">
                    <option value="">District</option>
                    <option value="ledang">Ledang</option>
					<option value="segamat">Segamat</option>
					<option value="muar">Muar</option>
					<option value="batupahat">Batu Pahat</option>
					<option value="kluang">Kluang</option>
					<option value="mersing">Mersing</option>
					<option value="pontian">Pontian</option>
					<option value="kulaijaya">Kulai Jaya</option>
					<option value="kotatinggi">Kota Tinggi</option>
					<option value="johorbahru">Johor Bahru</option>
                </select>              
                <button class="reset-button">
                    <i class="bi bi-arrow-clockwise"></i> Reset Filter
                </button>
                <button class="btn btn-primary add-user-button" onclick="window.location.href='addUser.jsp'">Add User</button>
            </div>
        </section>

        <!-- Crew List Section -->
        <section class="crew-list">
            <table>
                <thead>
                    <tr>
				        <th>Admin Name</th>
				        <th>School Name</th>
				        <th>District</th>
				        <th>Youtube Channel</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                   <c:forEach var="user" items="${userList}">
		                <tr>
				            <td>${user.fullName}</td>
				            <td>${user.schoolName}</td>
				            <td>${user.district}</td>
				            <td>${user.formattedYoutubeLink}"</td>
		                    <td>
                                <!-- View Icon -->
                                <button class="action-btn" onclick="window.location.href='viewUser.jsp?id=${user.id}'">
                                    <i class="bi bi-eye"></i> <!-- View icon -->
                                </button>
                                <!-- Edit Icon -->
                                <button class="action-btn" onclick="window.location.href='editUser.jsp?id=${user.id}'">
                                    <i class="bi bi-pencil-square"></i> <!-- Edit icon -->
                                </button>
                                <!-- Delete Icon -->
                                <button class="action-btn" onclick="return confirm('Are you sure you want to delete this user?')">
                                    <i class="bi bi-trash"></i> <!-- Delete icon -->
                                </button>
                            </td>
               			 </tr>
           			 </c:forEach>
                </tbody>
            </table>
             
        </section>
    </main>
    <script src="script.js"></script>
    </div>
</body>
</html>
