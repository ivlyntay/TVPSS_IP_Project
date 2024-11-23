<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.example.model.User"%>
<%@ page session="true"%>
<%
User user = (User) session.getAttribute("user");
if (user == null) {
	response.sendRedirect("../../login.jsp");
	return;
}
%>
<style>
/* Style for header */
.header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px;
    background-color: white; /* Optional background color */
}

/* Style for school name */
.school-name {
    font-size: 1.5rem;
    font-weight: bold;
    color: #333; /* Optional color */
    text-align: right;
}

/* Style for profile section */
.profile {
    display: flex;
    align-items: center;
}

.profile-image {
    width: 50px;
    height: 50px;
    border-radius: 50%;
    margin-right: 10px;
}

.profile-details {
    text-align: left;
}
</style>

<header class="header">
    <!-- School Name on the rightmost side -->
    <span class="school-name"><%= user.getSchoolName() %></span>
    
    <!-- Profile Section -->
    <div class="profile">
        <img src="../../img/profile.png" alt="Moni Roy" class="profile-image">
        <div class="profile-details">
            <span class="profile-name"><%= user.getFullName() %></span><br>
            <span class="role">Admin</span>
        </div>
    </div>
</header>