<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Crew List</title>
    <link rel="stylesheet" href="../../css/crew.css?v=2">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>
    <div class="container">
    <%@ include file="adminsidebar.jsp" %>
    <main class="content">
        <%@ include file="../header_tvpss.jsp" %>
        
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
                <select class="filter-dropdown">
                    <option value="">School</option>
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
                    	<th>School Name</th>
				        <th>Crew Name</th>
				        <th>Role</th>
				        <th>Email</th>
				        <th>Contact Number</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
		                <tr>
		                <td>SMK  Bandar Kota Tinggi</td>
                        <td>Ivlyn Tay Wan Rou</td>
                        <td>Script-Writer</td>
                        <td>ivlyn@graduate.utm.my</td>
                        <td>011-10746482</td>
                        <td>
                                <!-- View Icon -->
                                <button class="action-btn" onclick="window.location.href='viewCrew.jsp?id=${crew.id}'">
                                    <i class="bi bi-eye"></i> <!-- View icon -->
                                </button>
                            </td>
               			 </tr>
                </tbody>
            </table>
        </section>
    </main>
    <script src="script.js"></script>
    </div>
</body>
</html>
