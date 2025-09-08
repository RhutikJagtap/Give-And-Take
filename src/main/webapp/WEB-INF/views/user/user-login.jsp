<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Login - GiveAndTake</title>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap"
	rel="stylesheet">
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}

body {
	background: #f9fafb;
	color: #1f2937;
	line-height: 1.6;
	display: flex;
	flex-direction: column;
	align-items: center;
	min-height: 100vh;
}

/* Navbar */
.navbar {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 18px 50px;
	background: white;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
	position: sticky;
	top: 0;
	width: 100%;
	z-index: 1000;
}

.navbar .logo {
	font-weight: 700;
	font-size: 1.5rem;
	color: #2563eb;
	display: flex;
	align-items: center;
}

.navbar .logo img {
	width: 36px;
	margin-right: 10px;
}

.navbar ul {
	display: flex;
	list-style: none;
	gap: 25px;
}

.navbar ul li a {
	text-decoration: none;
	color: #374151;
	font-weight: 500;
}

.navbar ul li a:hover {
	color: #2563eb;
}

.navbar .btn-yellow {
	background: #facc15;
	color: #111827;
	padding: 8px 16px;
	border-radius: 8px;
	border: none;
	font-weight: 600;
	cursor: pointer;
}

.navbar .btn-yellow:hover {
	background: #eab308;
}

/* Login Form */
.login-box {
	background: white;
	padding: 40px;
	border-radius: 16px;
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
	margin-top: 80px;
	width: 350px;
	text-align: center;
}

.login-box h2 {
	color: #2563eb;
	margin-bottom: 20px;
}

.login-box label {
	display: block;
	text-align: left;
	margin: 12px 0 5px;
	font-weight: 500;
}

.login-box input {
	width: 100%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 8px;
}

.login-box button {
	margin-top: 20px;
	width: 100%;
	padding: 12px;
	background: #facc15;
	border: none;
	border-radius: 8px;
	font-weight: 600;
	cursor: pointer;
	transition: background 0.3s;
}

.login-box button:hover {
	background: #eab308;
}

.login-box a {
	display: block;
	margin-top: 15px;
	color: #2563eb;
	text-decoration: none;
}

.login-box a:hover {
	text-decoration: underline;
}
</style>
</head>
<body>

	<!-- Navbar -->
	<header class="navbar">
		<div class="logo">
			<img src="https://img.icons8.com/fluency/48/box.png" alt="logo">
			GiveAndTake
		</div>
		<ul>
			<li><a href="#features">Features</a></li>
			<li><a href="login.html">Login</a></li>
			<li><a href="signup.html" class="btn-yellow">Sign Up</a></li>
		</ul>
	</header>

	<!-- Login Form -->
	<div class="login-box">
		<h2>User Login</h2>
		<form action="UserLogin" method="post">
			<label for="username">Username</label> <input type="text"
				id="username" name="username" placeholder="Enter Username" required>

			<label for="password">Password</label> <input type="password"
				id="password" name="password" placeholder="Enter Password" required>

			<button type="submit">Login</button>
		</form>
		<a href="SignUpUser">New User? Register Here</a> <a href="index.jsp">←
			Back to Home</a>
	</div>

</body>
</html>
