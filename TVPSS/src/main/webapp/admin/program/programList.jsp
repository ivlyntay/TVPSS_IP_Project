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
                        <select class="filter-dropdown" name="statusVersion">
    						<option value="">Status Version</option>
    						<option value="Version 1">Version 1</option>
    						<option value="Version 2">Version 2</option>
						</select>
						<select class="filter-dropdown" name="equipmentLevel">
						    <option value="">Equipment Level</option>
						    <option value="Level 1">Level 1</option>
						    <option value="Level 2">Level 2</option>
						    <option value="Level 3">Level 3</option>
						</select>
						<select class="filter-dropdown" name="lastEdited">
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
	    // Search Functionality
	    document.querySelector('.search-bar').addEventListener('input', function () {
	        const searchValue = this.value.toLowerCase();
	        const rows = document.querySelectorAll('.status-table tbody tr');
	        
	        rows.forEach(row => {
	            const schoolName = row.cells[0].textContent.toLowerCase();
	            row.style.display = schoolName.includes(searchValue) ? '' : 'none';
	        });
	    });
	
	    // Filter Functionality
	    document.querySelectorAll('.filter-dropdown').forEach(filter => {
	        filter.addEventListener('change', applyFilters);
	    });
	
	    function applyFilters() {
	        const versionFilter = document.querySelector('select[name="statusVersion"]').value;
	        const levelFilter = document.querySelector('select[name="equipmentLevel"]').value;
	        const dateFilter = document.querySelector('select[name="lastEdited"]').value;
	
	        const rows = document.querySelectorAll('.status-table tbody tr');
	
	        rows.forEach(row => {
	            const version = row.cells[1].textContent;
	            const level = row.cells[2].textContent;
	            const lastEdited = row.cells[3].textContent;
	
	            let show = true;
	
	            if (versionFilter && version !== versionFilter) show = false;
	            if (levelFilter && level !== levelFilter) show = false;
	            if (dateFilter === 'newest') {
	                show = [...rows].sort((a, b) => new Date(b.cells[3].textContent) - new Date(a.cells[3].textContent));
	            } else if (dateFilter === 'oldest') {
	                show = [...rows].sort((a, b) => new Date(a.cells[3].textContent) - new Date(b.cells[3].textContent));
	            }
	
	            row.style.display = show ? '' : 'none';
	        });
	    }
	
	    // Reset Functionality
	    document.querySelector('.reset-button').addEventListener('click', function () {
	        document.querySelector('.search-bar').value = '';
	        document.querySelectorAll('.filter-dropdown').forEach(filter => filter.value = '');
	        const rows = document.querySelectorAll('.status-table tbody tr');
	        rows.forEach(row => row.style.display = '');
	    });
	    
	 // Open the edit modal and populate fields
	    function openEditModal(schoolName, version, level) {
	        const modal = document.getElementById('editModal');
	        const schoolNameInput = document.getElementById('schoolName');
	        const statusVersionSelect = document.getElementById('statusVersion');
	        const equipmentLevelSelect = document.getElementById('equipmentLevel');

	      	// Populate fields with current values
	        schoolNameInput.value = schoolName;
	        statusVersionSelect.value = version;
	        equipmentLevelSelect.value = level;

	        // Show the modal
	        modal.style.display = 'block';
	    }

	    // Close the edit modal
	    function closeEditModal() {
	        const modal = document.getElementById('editModal');
	        modal.style.display = 'none';
	    }

	 // Save the changes and update the table
	    document.getElementById('editForm').onsubmit = function (e) {
	        e.preventDefault();

	        const schoolName = document.getElementById('schoolName').value;
	        const statusVersion = document.getElementById('statusVersion').value;
	        const equipmentLevel = document.getElementById('equipmentLevel').value;

	        // Validate inputs
	        if (!schoolName || !statusVersion || !equipmentLevel) {
	            alert('All fields are required!');
	            return;
	        }

	        // Get the current date in YYYY-MM-DD format
	        const currentDate = new Date().toISOString().split('T')[0];

	        // Find the matching row and update its content
	        const rows = document.querySelectorAll('.status-table tbody tr');
	        rows.forEach(row => {
	            if (row.cells[0].textContent === schoolName) {
	                row.cells[1].textContent = statusVersion; // Update Status Version
	                row.cells[2].textContent = equipmentLevel; // Update Equipment Level
	                row.cells[3].textContent = currentDate; // Update Last Edited Date
	            }
	        });

	        // Close the modal after saving changes
	        closeEditModal();
	    };

	    // Close modal when clicking outside
	    window.onclick = function (event) {
	        const modal = document.getElementById('editModal');
	        if (event.target === modal) {
	            closeEditModal();
	        }
	    };

	    // Allow Cancel button to close the modal
	    document.querySelector('.cancel-btn').addEventListener('click', closeEditModal);

    </script>
</body>
</html>