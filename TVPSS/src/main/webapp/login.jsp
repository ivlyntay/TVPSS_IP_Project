<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Login to Account</title>
<link rel="stylesheet" href="<c:url value='/css/reg_login.css' />">
</head>
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
    height: 100vh;
    margin: 0;
    position: relative;
    overflow: hidden;
}

.login-container {
    background-color: white;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
    width: 300px;
    text-align: center;
    position: relative;
    z-index: 1;
}
</style>
<body>
	<div class="background"></div>
	<div class="login-container">
		<div class="header">
			<img src="img/logo.png" alt="Logo">
			<h2>TVPSS 7G</h2>
		</div>
		<h2>Login to Account</h2>
		<br>
		<form action="UserController" method="post">
			<input type="hidden" name="action" value="login">
			<label for="email">Email Address</label>
			<input type="text" name="email" required><br> 
			<label for="password">Password</label>
			<input type="password" name="password" required><br>
			<button type="submit">Login</button>
			
		<div class="login-prompt">
                <span>Don’t have an account?</span> 
                <a href="register.jsp">Create Account</a>
            </div>
		</form>

		<c:if test="${not empty message}">
			<p style="color: red;">${message}</p>
		</c:if>
	</div>
</body>
</html>