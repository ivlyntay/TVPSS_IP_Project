<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Crew Profile</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <%@ include file="sidebar.jsp" %>
        <main class="content">
            <!-- Header Section -->
            <%@ include file="../header_school.jsp" %>

            <!-- View Crew Profile Section -->
            <h1>View Crew Profile</h1>
            <section class="view-crew-profile">
                <div class="form-container">
                    <div class="image-upload">
                        <!-- Display crew member's profile photo -->
                       <img src="../../img/crew_1.jpg" alt="${crew.fullName} Profile" class="crew-image">
            			<h2>${crew.fullName}</h2>
                    </div>
                   <div class="profile-details">
                        <table>
                            <tr>
                                <td>IC Number:</td>
                                <td>${crew.icNumber}</td>
                            </tr>
                            <tr>
                                <td>Email:</td>
                                <td>${crew.email}</td>
                            </tr>
                            <tr>
                                <td>Contact Number:</td>
                                <td>${crew.contactNumber}</td>
                            </tr>
                            <tr>
                                <td>Gender:</td>
                                <td>${crew.gender}</td>
                            </tr>
                            <tr>
                                <td>Role:</td>
                                <td>${crew.role}</td>
                            </tr>
                        </table> 
                    </div>
                    <div class="form-buttons">
                        <button type="button" class="btn btn-primary" onclick="window.location.href='crewList.jsp'">Back</button>
                    </div>
                </div>
            </section>
        </main>
    </div>
</body>
</html>
