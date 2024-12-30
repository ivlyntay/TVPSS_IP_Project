<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TVPSS 7G Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        :root {
            --primary-blue: #4769ff;
            --sidebar-width: 240px;
            --background-color: #f8f9fe;
        }
        
        body {
            margin: 0;
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background: var(--background-color);
        }
        
        .container {
            display: flex;
        }
        
        /* Sidebar Styles */
        .sidebar {
            width: var(--sidebar-width);
            height: 100vh;
            background: white;
            padding: 20px;
            position: fixed;
            border-right: 1px solid #eee;
        }
        
        .logo {
            display: flex;
		    align-items: center;
		    gap: 10px;
		    font-size: 1.5rem;
		    font-weight: bold;
		    margin-bottom: 20px;
        }
        
        .logo img {
            width: 40px;
		    height: 40px;
		    border-radius: 50%;
        }
        
        .nav-item {
            display: flex;
            align-items: center;
            padding: 12px 16px;
            margin: 4px 0;
            border-radius: 8px;
            color: #666;
            text-decoration: none;
            font-size: 14px;
        }
        
        .nav-item.active {
            background: #eef1ff;
            color: var(--primary-blue);
        }
        
        .nav-item i {
            margin-right: 12px;
        }
        
        /* Main Content */
        .content {
            margin-left: var(--sidebar-width);
            padding: 24px;
            width: calc(100% - var(--sidebar-width));
        }
        
        /* Header */
        .dashboard-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 24px;
        }
        
        .search-container {
            position: relative;
        }
        
        .header-search-bar {
            width: 300px;
            padding: 8px 36px;
            border: none;
            border-radius: 8px;
            background: #f1f3f9;
            font-size: 14px;
        }
        
        .search-icon {
            position: absolute;
            left: 12px;
            top: 50%;
            transform: translateY(-50%);
            color: #666;
        }
        
        .user-profile {
            display: flex;
            align-items: center;
            gap: 8px;
        }
        
        .user-profile img {
            width: 32px;
            height: 32px;
            border-radius: 50%;
        }
        
        /* Stats Cards */
        .stats-container {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 24px;
            margin-bottom: 32px;
        }
        
        .stat-card {
            background: white;
            padding: 20px;
            border-radius: 12px;
            border: 1px solid #eee;
        }
        
        .stat-card h3 {
            margin: 0;
            font-size: 28px;
            font-weight: 600;
            margin-bottom: 8px;
        }
        
        .stat-card p {
            margin: 0;
            color: #666;
            font-size: 14px;
            margin-bottom: 8px;
        }
        
        .stat-card .trend {
            font-size: 12px;
        }
        
        .trend.up {
            color: #22c55e;
        }
        
        .trend.down {
            color: #ef4444;
        }
        
        /* Recent Videos */
        .videos-section {
            background: white;
            border-radius: 12px;
            border: 1px solid #eee;
            padding: 24px;
        }
        
        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        
        .section-header h2 {
            margin: 0;
            font-size: 20px;
            font-weight: 600;
        }
        
        .view-all {
            color: var(--primary-blue);
            text-decoration: none;
            font-size: 14px;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
        }
        
        th {
            text-align: left;
            padding: 12px 16px;
            font-weight: 500;
            color: #666;
            border-bottom: 1px solid #eee;
            font-size: 14px;
        }
        
        td {
            padding: 16px;
            border-bottom: 1px solid #eee;
            font-size: 14px;
        }
        
        .category-tag {
            padding: 4px 12px;
            border-radius: 15px;
            font-size: 12px;
            display: inline-block;
        }
        
        .category-tag.education {
            background: #dcfce7;
            color: #166534;
        }
        
        .category-tag.awareness {
            background: #dbeafe;
            color: #1e40af;
        }
        /* Reset Styles */
*,
body, h1, h2, h3, ul, li, p, table, th, td {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
     font-family: Arial, sans-serif;
    background: #f9f9f9;
    color: #333;
}

/* Layout Styling */
.container {
    display: flex;
    height: 100vh;
}

/* Sidebar Styling */
.sidebar {
    width: 240px;
    background: #FFFFFF;
    color: #202224;
    display: flex;
    flex-direction: column;
    padding: 20px;
    height: 100vh;
    border-right: 1px solid #ddd;
}

.logo {
    display: flex;
    align-items: center;
    gap: 10px;
    font-size: 1.5rem;
    font-weight: bold;
    margin-bottom: 20px;
}

.logo img {
    width: 40px;
    height: 40px;
    border-radius: 50%;
}

.menu {
    list-style: none;
}

.menu li {
    margin-bottom: 15px;
}

.menu li a {
    display: flex;
    align-items: center;
    padding: 10px 16px;
    border-radius: 8px;
    color: #202224;
    text-decoration: none;
    font-size: 1rem;
    transition: background-color 0.3s ease;
}

.menu li a i {
    margin-right: 12px;
    font-size: 1.2rem;
    color: inherit;
}

.menu .active a {
    background-color: #4880FF;
    color: #FFFFFF;
}

.menu a:hover:not(.active) {
    background-color: #979797;
    color: white;
}

.menu .separator {
    border-top: 1px solid #ccc;
    margin: 10px 0;
}

.menu .logout a {
    color: red;
    font-weight: bold;
}

.menu .logout a:hover {
    background-color: #ffcccc;
    color: darkred;
}

/* Content Section */
.content {
    flex: 1;
    padding: 20px;
    background: #F5F6FA;
    display: flex;
    flex-direction: column;
    gap: 20px;
}

/* Header Styling */
.header {
    display: flex;
    justify-content: flex-end;
    align-items: center;
    padding: 10px 20px;
    background-color: #FFFFFF;
    margin-bottom: 20px;
    border-radius: 8px;
}

.profile {
    display: flex;
    align-items: center;
    gap: 10px;
}

.profile img {
    width: 40px;
    height: 40px;
    border-radius: 50%;
}

/* Search Bar */
.search-container {
    position: relative;
    width: 100%;
}

.header-search-bar {
    padding: 10px 10px 10px 30px;
    font-size: 1rem;
    border: 1px solid #ccc;
    border-radius: 10px;
    width: 250px;
    background: #FFFFFF;
}

.search-icon {
    position: absolute;
    top: 50%;
    left: 10px;
    transform: translateY(-50%);
    font-size: 1.2rem;
    color: #888;
}

.header-search-bar:focus {
    outline: none;
    border-color: #4880FF;
    box-shadow: 0px 0px 5px rgba(72, 128, 255, 0.5);
}
    </style>
</head>
<body>
    <div class="container">
<div class="sidebar">
    <div class="logo">
        <img src="../../img/logo.png" alt="TVPSS Logo" class="logo-image">
        TVPSS 7G
    </div>
    <ul class="menu">
        <li class="active"><a href="#"><i class="bi bi-speedometer2"></i> Dashboard</a></li>
        <li><a href="../content/contentList.jsp"><i class="bi bi-journal-text"></i> Content Management</a></li>
        <li><a href="../program/ProgramStatus.jsp"><i class="bi bi-bar-chart"></i> Program Status Management</a></li>
        <li><a href="../crew/crewList.jsp"><i class="bi bi-people"></i> Crew Management</a></li>
        <li><a href="../profile/profile.jsp"><i class="bi bi-person"></i> Profile</a></li>
        <li><a href="../setting/setting.jsp"><i class="bi bi-gear"></i> Settings</a></li>
        <li class="separator"></li>
        <li class="logout"><a href="../../login.jsp"><i class="bi bi-box-arrow-right"></i> Logout</a></li>
    </ul>
</div>

        <!-- Main Content -->
        <main class="content">
            <!-- Header -->
            <%@ include file="../header_school.jsp" %>

            <!-- Statistics Cards -->
            <div class="stats-container">
                <div class="stat-card">
                    <h3>8</h3>
                    <p>Total Videos this Week</p>
                    <span class="trend up">↑ 8.5% Up from last week</span>
                </div>
                <div class="stat-card">
                    <h3>10293</h3>
                    <p>Total Likes</p>
                    <span class="trend up">↑ 1.9% Up from past week</span>
                </div>
                <div class="stat-card">
                    <h3>6.8 minutes</h3>
                    <p>Average Duration</p>
                    <span class="trend down">↓ 4.3% Down from last Week</span>
                </div>
                <div class="stat-card">
                    <h3>3100</h3>
                    <p>Subscribers</p>
                </div>
            </div>

            <!-- Recent Videos -->
            <section class="videos-section">
                <div class="section-header">
                    <h2>Recent Videos</h2>
                    <a href="#" class="view-all">View all</a>
                </div>
                <table>
                    <thead>
                        <tr>
                            <th>Video Name</th>
                            <th>Category</th>
                            <th>Views</th>
                            <th>Likes</th>
                            <th>Uploaded date</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Episode 14: Studio Teknik TVPSS (2024)</td>
                            <td><span class="category-tag education">Education</span></td>
                            <td>3.1k</td>
                            <td>450</td>
                            <td>Oct 15, 2024</td>
                        </tr>
                        <tr>
                            <td>PERTANDINGAN VIDEO KREATIF TVPSS</td>
                            <td><span class="category-tag awareness">Awareness</span></td>
                            <td>4.1k</td>
                            <td>600</td>
                            <td>Oct 13, 2024</td>
                        </tr>
                    </tbody>
                </table>
            </section>
        </main>
    </div>
</body>
</html>