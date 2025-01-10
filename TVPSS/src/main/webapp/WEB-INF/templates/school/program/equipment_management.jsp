<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Equipment Management</title>
    <link rel="stylesheet" href="../../css/equipment.css">
    <link rel="stylesheet" href="../../css/progSidebar_header.css">
</head>
<body>
    <div class="container">
        <%@ include file="sidebar.jsp" %>
        <div class="main-content">
            <%@ include file="../header_school.jsp" %>
            <div class="program-header">
                <h2>Equipment Management</h2>
                <button class="back-btn" onclick="window.location.href='ProgramStatus.jsp'">Back</button>
            </div>
            
            <div class="cards-container">
                <div class="level-card">
                    <div class="level-label">Level 1</div>
                    <h3 class="level-title">Beginner</h3>
                    <ul class="equipment-list">
                        <li class="equipment-item">TV Program/Show corner/room</li>
                        <li class="equipment-item">Smartphone</li>
                        <li class="equipment-item">External Mic (Lavalier/Clip Mic)</li>
                        <li class="equipment-item">Monopod</li>
                        <li class="equipment-item">Ring Light</li>
                    </ul>
                    <button class="select-btn" data-level="1">Select</button>
                </div>

                <div class="level-card">
                    <div class="level-label">Level 2</div>
                    <h3 class="level-title">Intermidiate</h3>
                    <ul class="equipment-list">
                        <li class="equipment-item">TV Program/Show corner/room</li>
                        <li class="equipment-item">Editing Corner/Room</li>
                        <li class="equipment-item">Webcam</li>
                        <li class="equipment-item">Tripod</li>
                        <li class="equipment-item">External Mic (Lavalier/Clip Mic) / Wireless Mic</li>
                        <li class="equipment-item">Mobile lighting</li>
                        <li class="equipment-item">Mobile Green Screen set</li>
                        <li class="equipment-item">Editing Software (Open Source)</li>
                    </ul>
                    <button class="select-btn" data-level="2">Select</button>
                </div>

                <div class="level-card">
                    <div class="level-label">Level 3</div>
                    <h3 class="level-title">Advance</h3>
                    <ul class="equipment-list">
                        <li class="equipment-item">TV Program/Show corner/room</li>
                        <li class="equipment-item">Editing Corner/Room</li>
                        <li class="equipment-item">Camera</li>
                        <li class="equipment-item">Tripod</li>
                        <li class="equipment-item">External Mic (Lavalier/Clip Mic) / Wireless Mic</li>
                        <li class="equipment-item">Mobile lighting (3 point)</li>
                        <li class="equipment-item">Green Screen (permanent)</li>
                        <li class="equipment-item">Editing Software (Pro/paid version)</li>
                    </ul>
                    <button class="select-btn" data-level="3">Select</button>
                </div>
            </div>
        </div>
    </div>

    <div id="confirmationModal" class="modal">
        <div class="modal-content">
            <h3>Confirm Selection</h3>
            <p>Are you sure you want to select Level <span id="selectedLevel"></span>?</p>
            <div class="modal-buttons">
                <button class="confirm-btn">Confirm</button>
                <button class="cancel-btn">Cancel</button>
            </div>
        </div>
    </div>

    <script src="../../js/equipment.js"></script>
</body>
</html>