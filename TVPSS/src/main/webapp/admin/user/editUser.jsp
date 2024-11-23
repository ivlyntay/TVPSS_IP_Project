<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit User</title>
    <link rel="stylesheet" href="../../css/styles.css?v=2">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <%@ include file="sidebar_user.jsp" %>
        <!-- Main Content -->
        <main class="content">
             <%@ include file="../header_tvpss.jsp" %>

            <h1>Edit User</h1>
            <div class="form-container">
                <!-- Profile Image Upload -->
                <div class="image-upload">
                    <img src="<%= request.getAttribute("crewImage") != null ? request.getAttribute("crewImage") : "../img/default.jpg" %>" 
                         alt="Crew Profile" class="crew-image">
                    <label for="crew-photo" class="upload-label">Upload User Photo</label>
                    <input type="file" id="crew-photo" name="crewPhoto" style="opacity: 0" accept="img/*">
                </div>

                <!-- Form Fields -->
                <form action="EditUserServlet" method="post">
                    <input type="hidden" name="crewId" value="<%= request.getAttribute("crewId") %>">
                    
                    <div class="form-grid">
                        <!-- Row 1 -->
                        <div class="form-group">
                            <label for="fullName">Admin Name (as per IC)</label>
                            <input type="text" id="fullName" name="fullName" 
                                   value="<%= request.getAttribute("fullName") %>" 
                                   placeholder="Enter full name">
                        </div>
                        <div class="form-group">
                            <label for="icNumber">IC Number</label>
                            <input type="text" id="icNumber" name="icNumber" 
                                   value="<%= request.getAttribute("icNumber") %>" 
                                   placeholder="Enter IC Number">
                        </div>

                        <!-- Row 2 -->
                        <div class="form-group">
                            <label for="schoolName">School Name</label>
                            <input type="text" id="schoolName" name="schoolName" 
                            	value="<%= request.getAttribute("icNumber") %>"
                            	placeholder="Enter school name" required>
                        </div>
                        <div class="form-group">
                            <label for="district">Disrict</label>
                            <select id="district" name="district" required>
                                <option value="">Select District</option>
			                    <option value="ledang" <%= "ledang".equals(request.getAttribute("district")) ? "selected" : "" %>>Ledang</option>
								<option value="segamat" <%= "segamat".equals(request.getAttribute("district")) ? "selected" : "" %>>Segamat</option>
								<option value="muar" <%= "muar".equals(request.getAttribute("district")) ? "selected" : "" %>>Muar</option>
								<option value="batupahat" <%= "batupahat".equals(request.getAttribute("district")) ? "selected" : "" %>>Batu Pahat</option>
								<option value="kluang" <%= "kluang".equals(request.getAttribute("district")) ? "selected" : "" %>>Kluang</option>
								<option value="mersing" <%= "mersing".equals(request.getAttribute("district")) ? "selected" : "" %>>Mersing</option>
								<option value="pontian" <%= "pontian".equals(request.getAttribute("district")) ? "selected" : "" %>>Pontian</option>
								<option value="kulaijaya" <%= "kulaijaya".equals(request.getAttribute("district")) ? "selected" : "" %>>Kulai Jaya</option>
								<option value="kotatinggi" <%= "kotatinggi".equals(request.getAttribute("district")) ? "selected" : "" %>>Kota Tinggi</option>
								<option value="johorbahru" <%= "johorbahru".equals(request.getAttribute("district")) ? "selected" : "" %>>Johor Bahru</option>
                            </select>
                        </div>

                        <!-- Row 3 -->
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" id="email" name="email" 
                            value="<%= request.getAttribute("email") %>"
                            placeholder="Enter email" required>
                        </div> 
                        <div class="form-group">
                            <label for="contactNumber">Contact Number</label>
                            <input type="text" id="contactNumber" name="contactNumber" 
                            value="<%= request.getAttribute("contactNumber") %>"
                            placeholder="Enter contact number" required>
                        </div>
                        <!-- Row 4 -->
                        <div class="form-group">
                            <label for=ytbLink>Youtube Channel Link</label>
                            <input type="text" id="ytbLink" name="ytbLink" 
                            value="<%= request.getAttribute("ytbLink") %>"
                            placeholder="Enter Youtube Channel Link" required>
                        </div> 
                        <div class="form-group">
                            <label for="ytbName">Youtube Channel Name</label>
                            <input type="text" id="ytbName" name="ytbName" 
                            value="<%= request.getAttribute("ytbName") %>"
                            placeholder="Enter Youtube Channel Name" required>
                        </div>
                    </div>

                    <!-- Form Buttons -->
                    <div class="form-buttons">
                        <button type="submit" class="btn btn-primary">Save Changes</button>
                        <button type="button" class="btn btn-secondary" onclick="window.location.href='userList.jsp'">Cancel</button>
                    </div>
                </form>
            </div>
        </main>
    </div>
</body>
</html>
