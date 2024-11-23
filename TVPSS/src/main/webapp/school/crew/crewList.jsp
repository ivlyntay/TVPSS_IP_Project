<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.example.model.CrewMember" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Crew List</title>
    <link rel="stylesheet" href="../../css/styles.css?v=2">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>
    <div class="container">
    <%@ include file="sidebar.jsp" %>
    <main class="content">
        <header class="header">
            <div class="header-right">
                <div class="profile">
                    <img src="../../img/profile.png" alt="Moni Roy" class="profile-image">
                    <div class="header-profile">
                        <span class="profile-name">Moni Roy</span><br>
                        <span class="role">Admin</span>
                    </div>
                </div>
            </div>
        </header>
        
        <h1>Crew List</h1>
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
                    <option value="">Role</option>
                    <option value="Reporter">Reporter</option>
                    <option value="Assistant Director">Assistant Director</option>
                    <option value="Camera Operator">Camera Operator</option>
                    <option value="Script Writer">Script Writer</option>
                    <option value="Video Editor">Video Editor</option>
                </select>
                <button class="reset-button">
                    <i class="bi bi-arrow-clockwise"></i> Reset Filter
                </button>
            </div>
        </section>

        <!-- Crew List Section -->
        <section class="crew-list">
            <table>
                <thead>
                    <tr>
				        <th>Crew Name</th>
				        <th>Role</th>
				        <th>Email</th>
				        <th>Contact Number</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                   <c:forEach var="crew" items="${crewList}">
		                <tr>
				            <td>${crew.fullName}</td>
				            <td>${crew.role}</td>
				            <td>${crew.email}</td>
				            <td>${crew.contactNumber}</td>
		                    <td>
                                <!-- View Icon -->
                                <button class="action-btn" onclick="window.location.href='viewCrew.jsp?id=${crew.id}'">
                                    <i class="bi bi-eye"></i> <!-- View icon -->
                                </button>
                                <!-- Edit Icon -->
                                <button class="action-btn" onclick="window.location.href='editCrew.jsp?id=${crew.id}'">
                                    <i class="bi bi-pencil-square"></i> <!-- Edit icon -->
                                </button>
                                <!-- Delete Icon -->
                                <button class="action-btn" onclick="return confirm('Are you sure you want to delete this crew member?')">
                                    <i class="bi bi-trash"></i> <!-- Delete icon -->
                                </button>
                            </td>
               			 </tr>
           			 </c:forEach>
                </tbody>
            </table>
             <button class="btn btn-primary" onclick="window.location.href='addCrew.jsp'">Add Crew</button>
        </section>
    </main>
    <script src="script.js"></script>
    </div>
</body>
</html>
