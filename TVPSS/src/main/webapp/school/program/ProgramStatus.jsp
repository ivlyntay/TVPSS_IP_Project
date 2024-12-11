<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Program status</title>
    <link rel="stylesheet" href="../../css/program.css">
    <link rel="stylesheet" href="../../css/progSidebar_header.css">
</head>
<body>
    <div class="container">
        <%@ include file="sidebar.jsp" %>
        <div class="main-content">
            <%@ include file="../header_school.jsp" %>
            <div class="program-header">
                <h2>Program Status</h2>
            </div>

            <div class="program-list">
                <h3>School Information</h3>
                <div class="card">
                    <div class="school-info">
                        <div>
                            <div class="form-group">
                                <label>School Name:</label>
                                <span>SEKOLAH KEBANGSAAN MAWAI</span>
                            </div>
                            <div class="form-group">
                                <label>Code:</label>
                                <span>JBA3005</span>
                            </div>
                            <div class="form-group">
                                <label>District:</label>
                                <span>KOTA TINGGI</span>
                            </div>
                        </div>
                        <div></div>
                        <img src="../../img/schoolLogo.jpeg" alt="School Logo" class="school-logo">
                    </div>
                </div>

                <h3>TV PSS Program Status</h3>
                <div class="card">
                    <form id="programStatusForm">
                        <div class="form-group">
                            <label>Logo:</label>
                            <div class="radio-group">
                                <label class="radio-option">
                                    <input type="radio" name="logo" value="yes" checked>Yes
                                </label>
                                <label class="radio-option">
                                    <input type="radio" name="logo" value="no">No
                                </label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label>Studio/ Mini Studio:</label>
                            <div class="radio-group">
                                <label class="radio-option">
                                    <input type="radio" name="studio" value="yes" checked>Yes
                                </label>
                                <label class="radio-option">
                                    <input type="radio" name="studio" value="no">No
                                </label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label>In-School Recording:</label>
                            <div class="radio-group">
                                <label class="radio-option">
                                    <input type="radio" name="recording" value="yes" checked>Yes
                                </label>
                                <label class="radio-option">
                                    <input type="radio" name="recording" value="no">No
                                </label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label>Upload on Youtube:</label>
                            <div class="radio-group">
                                <label class="radio-option">
                                    <input type="radio" name="youtube" value="yes" checked>Yes
                                </label>
                                <label class="radio-option">
                                    <input type="radio" name="youtube" value="no">No
                                </label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label>Youtube Channel Link:</label>
                            <input type="text" name="youtubeLink">
                        </div>

                        <div class="form-group">
                            <label>Recording inside and outside the school:</label>
                            <div class="radio-group">
                                <label class="radio-option">
                                    <input type="radio" name="insideOutside" value="yes">Yes
                                </label>
                                <label class="radio-option">
                                    <input type="radio" name="insideOutside" value="no" checked>No
                                </label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label>Collaborate with external agencies:</label>
                            <div class="radio-group">
                                <label class="radio-option">
                                    <input type="radio" name="collaborate" value="yes">Yes
                                </label>
                                <label class="radio-option">
                                    <input type="radio" name="collaborate" value="no" checked>No
                                </label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label>Using 'Green Screen' Technology:</label>
                            <div class="radio-group">
                                <label class="radio-option">
                                    <input type="radio" name="greenScreen" value="yes">Yes
                                </label>
                                <label class="radio-option">
                                    <input type="radio" name="greenScreen" value="no" checked>No
                                </label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label>Version:</label>
                            <span>1</span>
                        </div>

                        <div class="button-container">
                            <button type="submit" class="save-btn">Save</button>
                            <button type="button" class="next-btn" onclick="window.location.href='equipment_management.jsp'">Next</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
	<div id="confirmationModal" class="modal">
	    <div class="modal-content">
	        <h3>Confirm Save</h3>
	        <p>Are you sure you want to save the changes?</p>
	        <div class="modal-buttons">
	            <button id="confirmBtn" class="confirm-btn">Confirm</button>
	            <button id="cancelBtn" class="cancel-btn">Cancel</button>
	        </div>
	    </div>
	</div>
	
    <script>
    document.addEventListener('DOMContentLoaded', function () {
        const modal = document.getElementById('confirmationModal');
        const confirmBtn = document.getElementById('confirmBtn');
        const cancelBtn = document.getElementById('cancelBtn');
        const saveBtn = document.querySelector('.save-btn'); // Select the Save button
        const form = document.getElementById('programStatusForm');

        // Handle Save button click
        saveBtn.addEventListener('click', function (event) {
            event.preventDefault(); // Prevent form submission
            modal.style.display = "block"; // Show the confirmation modal
        });

        // Handle confirm button click
        confirmBtn.addEventListener('click', function () {
            modal.style.display = "none"; // Hide modal

            // Collect form data
            const formData = new FormData(form);
            const data = Object.fromEntries(formData.entries());

            // Calculate version number
            let version = 1;
            if (data.logo === "yes") version = 2;
            if (data.studio === "yes" && data.recording === "yes") version = 3;
            if (data.youtube === "yes" && data.collaborate === "yes" && data.greenScreen === "yes") version = 4;

            // Update the version display
            const versionSpan = document.querySelector("form .form-group span");
            versionSpan.textContent = version;

        });

        // Handle cancel button click
        cancelBtn.addEventListener('click', function () {
            modal.style.display = "none"; // Hide modal
        });

        // Close modal when clicking outside
        window.onclick = function (event) {
            if (event.target === modal) {
                modal.style.display = "none";
            }
        };
    });



    </script>
</body>
</html>