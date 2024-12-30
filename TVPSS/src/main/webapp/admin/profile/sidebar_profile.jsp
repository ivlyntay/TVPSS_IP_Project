<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="css/styles.css?v=2">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<div class="sidebar">
    <div class="logo">
        <img src="../../img/logo.png" alt="TVPSS Logo" class="logo-image">
        TVPSS 7G
    </div>
    <ul class="menu">
        <li><a href="../dashboard/dashboard.jsp"><i class="bi bi-speedometer2"></i> Dashboard</a></li>
        <li><a href="../user/userList.jsp"><i class="bi bi-border-all"></i> User Management</a></li>
        <li><a href="../content/contentList.jsp"><i class="bi bi-journal-text"></i> Content Management</a></li>
        <li ><a href="../program/programList.jsp"><i class="bi bi-bar-chart"></i> Program Status Management</a></li>
        <li><a href="../crew/crewList.jsp"><i class="bi bi-people"></i> Crew Management</a></li>
        <li class="active"><a href="../profile/profile_tvpss.jsp"><i class="bi bi-person"></i> Profile</a></li>
        <li><a href="../setting/setting_tvpss.jsp"><i class="bi bi-gear"></i> Settings</a></li>
        <li class="separator"></li>
        <li class="logout"><a href="../../login.jsp"><i class="bi bi-box-arrow-right"></i> Logout</a></li>
    </ul>
</div>

