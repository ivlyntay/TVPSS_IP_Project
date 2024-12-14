<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>Create an Account</title>
<link rel="stylesheet" href="<c:url value='/css/reg_login.css' />">
<script>
function toggleFields() {
    const role = document.getElementById('role').value;
    const schoolFields = document.getElementById('schoolFields');

    if (role === 'schoolAdmin') {
        schoolFields.style.display = 'block';
    } else {
        schoolFields.style.display = 'none';
    }
}
</script>
<style>
.login-prompt {
	margin-top: 15px;
	font-size: 13px;
	color: #666;
	text-align: center;
}

.login-prompt span {
	margin-right: 5px;
}

.login-prompt a {
	color: #4880FF;
	text-decoration: none;
	font-weight: bold;
}

.login-prompt a:hover {
	text-decoration: underline;
}

body {
	background-color: #4880FF;
	font-family: Arial, sans-serif;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 130vh;
	margin: 0;
	position: relative;
	overflow-y: auto;
}

.register-container {
	background-color: white;
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
	width: 550px;
	text-align: center;
	position: relative;
	z-index: 1;
}

#schoolFields {
	display: none;
}
</style>
</head>
<body>
	<div class="background"></div>
	<div class="register-container">
		<div class="header">
			<img src="img/logo.png" alt="Logo">
			<h2>TVPSS 7G</h2>
		</div>
		<h2>Create an Account</h2>
		<br>
		<form action="UserController" method="post" class="register-form">
			<input type="hidden" name="action" value="register"> 
			
			<label for="fullName">Full Name</label> 
			<input type="text" id="fullname" name="fullname" required> 
			
			<label for="icNumber">IC Number</label> 
			<input type="text" id="icNumber" name="icNumber" required>
			
			<label for="email">Email Address</label> 
			<input type="text" id="email" name="email" required> 
			
			<label for="contactNumber">Contact Number</label> 
			<input type="text" id="contactNumber" name="contactNumber" required> 
			
			<label for="role">Role</label>
			<select id="role" name="role" required onchange="toggleFields()">
				<option value="">Select Role</option>
				<option value="schoolAdmin">School Admin</option>
				<option value="tvpssAdmin">TVPSS Admin</option>
			</select>

			<div id="schoolFields">
				<label for="schoolName">School Name</label> 
				<input type="text" id="schoolName" name="schoolName"> 
				
				<label for="district">District</label> 
				<select id="district" name="district">
					<option value="">Select District</option>
					<option value="Ledang">Ledang</option>
					<option value="Segamat">Segamat</option>
					<option value="Muar">Muar</option>
					<option value="Batu Pahat">Batu Pahat</option>
					<option value="Kluang">Kluang</option>
					<option value="Mersing">Mersing</option>
					<option value="Pontian">Pontian</option>
					<option value="Kulai Jaya">Kulai Jaya</option>
					<option value="Kotat Tnggi">Kota Tinggi</option>
					<option value="Johor Bahru">Johor Bahru</option>
				</select>
			</div>

			
			
			<label for="password">Password</label> 
			<input type="password" id="password" name="password" required>

			<button type="submit">Register</button>

			<div class="login-prompt">
				<span>Already have an account?</span> <a href="login.jsp">Login</a>
			</div>
		</form>

		<c:if test="${not empty message}">
			<p>${message}</p>
		</c:if>
	</div>
</body>
</html>
