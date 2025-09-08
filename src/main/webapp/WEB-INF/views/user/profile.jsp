<%@ page import="com.giveandtakemodel.User"%>
<%
User user = (User) session.getAttribute("user");
if (user == null) {
	response.sendRedirect("LoginPage.jsp");
	return;
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GiveAndTake - Profile</title>
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	rel="stylesheet">
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Inter', sans-serif;
}

body, html {
	background: #f4f7fa;
	overflow-x: hidden;
} /* Sidebar */
.sidebar {
	width: 250px;
	background: #1f2937;
	color: #fff;
	position: fixed;
	top: 0;
	bottom: 0;
	left: 0;
	display: flex;
	flex-direction: column;
	padding: 20px;
}

.sidebar .logo {
	font-size: 22px;
	font-weight: 700;
	color: #3b82f6;
	margin-bottom: 30px;
	text-align: center;
}

.sidebar nav a {
	display: flex;
	align-items: center;
	text-decoration: none;
	color: #cbd5e1;
	padding: 12px;
	margin-bottom: 10px;
	border-radius: 8px;
	transition: 0.3s;
}

.sidebar nav a i {
	margin-right: 10px;
	width: 20px;
	text-align: center;
}

.sidebar nav a:hover, .sidebar nav a.active {
	background: #3b82f6;
	color: #fff;
} /* Topbar */
.topbar {
	position: fixed;
	top: 0;
	left: 250px;
	right: 0;
	height: 70px;
	background: #fff;
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 0 20px;
	border-bottom: 1px solid #e5e7eb;
	z-index: 10;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
}

.topbar h2 {
	font-size: 20px;
}

.user-info {
	display: flex;
	align-items: center;
	gap: 15px;
}

.user-info img {
	width: 40px;
	height: 40px;
	border-radius: 50%;
	border: 2px solid #3b82f6;
}

.user-info button {
	padding: 8px 14px;
	background: #ef4444;
	color: white;
	border: none;
	border-radius: 6px;
	cursor: pointer;
	transition: 0.3s;
}

.user-info button:hover {
	background: #dc2626;
} /* Main Content */
.main {
	margin-left: 250px;
	margin-top: 70px;
	padding: 20px;
} /* Profile Card */
.profile-card {
	background: #fff;
	border-radius: 12px;
	padding: 25px;
	max-width: 500px;
	margin: auto;
	box-shadow: 0 6px 12px rgba(0, 0, 0, 0.05);
	display: flex;
	flex-direction: column;
	gap: 20px;
}

.profile-card h2 {
	font-size: 24px;
	color: #1f2937;
	margin-bottom: 10px;
	text-align: center;
}

.profile-info {
	display: flex;
	align-items: center;
	gap: 20px;
}

.profile-info img {
	width: 120px;
	height: 120px;
	border-radius: 50%;
	border: 3px solid #3b82f6;
}

.profile-details {
	flex: 1;
}

.profile-details p {
	font-size: 16px;
	color: #374151;
	margin-bottom: 8px;
}

.profile-details span {
	font-weight: 600;
	color: #111827;
} /* Edit Form */
.edit-form {
	display: flex;
	flex-direction: column;
	gap: 15px;
	margin-top: 10px;
}

.edit-form label {
	font-weight: 600;
	font-size: 14px;
	color: #374151;
}

.edit-form input {
	padding: 10px;
	border-radius: 6px;
	border: 1px solid #d1d5db;
	font-size: 14px;
}

.edit-form button {
	padding: 10px 16px;
	background: #3b82f6;
	color: #fff;
	border: none;
	border-radius: 6px;
	cursor: pointer;
	transition: 0.3s;
	width: 150px;
	align-self: flex-start;
}

.edit-form button:hover {
	background: #2563eb;
} /* Responsive */
@media ( max-width :768px) {
	.sidebar {
		display: none;
	}
	.topbar {
		left: 0;
		width: 100%;
	}
	.main {
		margin-left: 0;
	}
	.profile-card {
		padding: 15px;
	}
}
</style>
</head>
<body>

	<!-- Sidebar -->
	<div class="sidebar">
		<div class="logo">
			<i class="fas fa-box"></i> GiveAndTake
		</div>
		<nav>
			<a href="dashboard"><i class="fas fa-home"></i> Dashboard</a> <a
				href="MyItemsPage"><i class="fas fa-box-open"></i> My Items</a> <a
				href="BrowseItemsPage"><i class="fas fa-search"></i> Browse
				Items</a> <a href="MessagesPage"><i class="fas fa-envelope"></i>
				Messages</a> <a href="NotificationsPage"><i class="fas fa-bell"></i>
				Notifications</a> <a href="ProfilePage" class="active"><i
				class="fas fa-user"></i> Profile</a>
		</nav>
	</div>

	<!-- Topbar -->
	<div class="topbar">
		<h2>Profile</h2>
		<div class="user-info">
			<img src="https://i.pravatar.cc/40" alt="User"> <a
				href="LogOut"><button>Logout</button></a>
		</div>
	</div>

	<!-- Main Content -->
	<div class="main">
		<div class="profile-card">
			<h2>User Profile</h2>
			<div class="profile-info">
				<img src="https://i.pravatar.cc/120" alt="User">
				<div class="profile-details">
					<p>
						Name: <span><%=user.getName()%></span>
					</p>
					<p>
						Email: <span><%=user.getEmail()%></span>
					</p>
					<p>
						Phone: <span><%=user.getPhoneNo()%></span>
					</p>
					<p>
						Location: <span><%=user.getAddress()%></span>
					</p>
				</div>
			</div>
			<hr>
			<h3>Edit Profile</h3>
			<form class="edit-form" action="UpdateProfile" method="post">
				<label for="name">Name</label> <input type="text" id="name"
					name="name" value="<%=user.getName()%>" required> <label
					for="email">Email</label> <input type="email" id="email"
					name="email" value="<%=user.getEmail()%>" required> <label
					for="phone">Phone</label> <input type="text" id="phone"
					name="phone" value="<%=user.getPhoneNo()%>"> <label
					for="location">Location</label> <input type="text" id="location"
					name="location" value="<%=user.getAddress()%>">

				<button type="submit">Update Profile</button>
			</form>
		</div>
	</div>

</body>
</html>
