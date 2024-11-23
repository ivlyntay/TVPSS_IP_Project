<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Crew Profile</title>
    <link rel="stylesheet" href="../../css/styles.css?v=2">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <%@ include file="adminsidebar.jsp" %>
        <main class="content">
            <!-- Header Section -->
            <%@ include file="../header_tvpss.jsp" %>

            <!-- View Crew Profile Section -->
            <h1>View Crew Profile</h1>
            <section class="view-crew-profile">
                <div class="form-container">
                    <div class="image-upload">
                        <img src="../../img/default.jpg" alt="Crew Profile" class="crew-image">
                        <h2>Christine Brooks</h2>
                    </div>
                    <div class="profile-details">
				    <table>
				    	<tr>
				            <td>School:</td>
				            <td>SMK Bandar Kota Tinggi</td>
				        </tr>
				        <tr>
				            <td>IC Number:</td>
				            <td>031214100312</td>
				        </tr>
				        <tr>
				            <td>Email:</td>
				            <td>christine@gmail.com</td>
				        </tr>
				        <tr>
				            <td>Contact Number:</td>
				            <td>011-10746752</td>
				        </tr>
				        <tr>
				            <td>Gender:</td>
				            <td>Female</td>
				        </tr>
				        <tr>
				            <td>Role:</td>
				            <td>Reporter</td>
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
