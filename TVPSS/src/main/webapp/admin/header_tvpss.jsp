<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
/* Style for header */
.header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px;
    background-color: white; /* Optional background color */
}

/* Style for tvpss name */
.tvpss-name {
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
    <span class="tvpss-name">TV Pusat Sumber Sekolah</span>
    
    <!-- Profile Section -->
    <div class="profile">
        <img src="../../img/profile.png" alt="Moni Roy" class="profile-image">
        <div class="profile-details">
            <span class="profile-name">Moni Roy</span><br>
            <span class="role">Admin</span>
        </div>
    </div>
</header>