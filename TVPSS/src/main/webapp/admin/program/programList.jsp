<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Program List</title>
    <link rel="stylesheet" href="../../css/progSidebar_header.css">
    <link rel="stylesheet" href="../../css/admin_program.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <%@ include file="adminsidebar.jsp" %>
        <main class="content">
            <%@ include file="../header_tvpss.jsp" %>

            <h1>Program List</h1>
            <!-- Search Section -->
            <section class="search-section">
                <div class="search-container">
                    <input type="text" placeholder="Search" class="search-bar">
                </div>
            </section>

            <!-- Filter Section -->
            <section class="filter-section">
                <div class="filter-container">
                    <div class="filter-group">
                        <span class="filter-btn">
                            <i class="bi bi-funnel"></i>
                            Filter By
                        </span>
                        <select class="filter-dropdown">
                            <option value="">Status Version</option>
                            <option value="1">Version 1</option>
                            <option value="2">Version 2</option>
                        </select>
                        <select class="filter-dropdown">
                            <option value="">Equipment Level</option>
                            <option value="1">Level 1</option>
                            <option value="2">Level 2</option>
                            <option value="3">Level 3</option>
                        </select>
                        <select class="filter-dropdown">
                            <option value="">Last Edited</option>
                            <option value="newest">Newest</option>
                            <option value="oldest">Oldest</option>
                        </select>
                        <button class="reset-button">
                            <i class="bi bi-arrow-counterclockwise"></i>
                            Reset Filter
                        </button>
                    </div>
                </div>
            </section>

            <!-- Program Status Table -->
            <section class="program-status">
                <table class="status-table">
                    <thead>
                        <tr>
                            <th>SCHOOL NAME</th>
                            <th>Status Version</th>
                            <th>Equipment Level</th>
                            <th>Last Edited</th>
                            <th>ACTION</th>
                        </tr>
                    </thead>
                    <tbody>
                            <tr>
                                <td>SMK Mewah</td>
                                <td>Version 1</td>
                                <td>Level 3</td>
                                <td>2024-10-29</td>
                                <td>
                                    <button class="action-btn" onclick="openEditModal('SMK Mewah', 'Version 1', 'Level 3')">
                                        <i class="bi bi-pencil-square"></i>
                                    </button>
                                </td>
                            </tr>
                    </tbody>
                </table>
            </section>

            <!-- Edit Modal -->
            <div id="editModal" class="modal">
                <div class="modal-content">
                    <h2>Edit Program Status</h2>
                    <form id="editForm">
                        <div class="form-group">
                            <label for="schoolName">School Name:</label>
                            <input type="text" id="schoolName" name="schoolName" readonly>
                        </div>
                        <div class="form-group">
                            <label for="statusVersion">Status Version:</label>
                            <select id="statusVersion" name="statusVersion">
                                <option value="Version 1">Version 1</option>
                                <option value="Version 2">Version 2</option>
                                <option value="Version 3">Version 3</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="equipmentLevel">Equipment Level:</label>
                            <select id="equipmentLevel" name="equipmentLevel">
                                <option value="Level 1">Level 1</option>
                                <option value="Level 2">Level 2</option>
                                <option value="Level 3">Level 3</option>
                            </select>
                        </div>
                        <div class="modal-buttons">
                            <button type="button" class="cancel-btn" onclick="closeEditModal()">Cancel</button>
                            <button type="submit" class="save-btn">Save Changes</button>
                        </div>
                    </form>
                </div>
            </div>
        </main>
    </div>

    <script>
        function openEditModal(schoolName, version, level) {
            const modal = document.getElementById('editModal');
            const schoolNameInput = document.getElementById('schoolName');
            const statusVersionSelect = document.getElementById('statusVersion');
            const equipmentLevelSelect = document.getElementById('equipmentLevel');

            schoolNameInput.value = schoolName;
            statusVersionSelect.value = version;
            equipmentLevelSelect.value = level;

            modal.style.display = 'block';
        }

        function closeEditModal() {
            const modal = document.getElementById('editModal');
            modal.style.display = 'none';
        }

        // Close modal when clicking outside
        window.onclick = function(event) {
            const modal = document.getElementById('editModal');
            if (event.target === modal) {
                closeEditModal();
            }
        }

        // Handle form submission
        document.getElementById('editForm').onsubmit = function(e) {
            e.preventDefault();
            // Add your form submission logic here
            console.log('Form submitted');
            closeEditModal();
        }
    </script>
</body>
</html>