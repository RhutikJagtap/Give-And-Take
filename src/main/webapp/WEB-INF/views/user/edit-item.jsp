<!DOCTYPE html>
<%@page import="com.giveandtake.model.Item"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Item - GiveAndTake</title>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
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
}
/* Sidebar */
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
}
/* Topbar */
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
}
/* Main Content */
.main {
	margin-left: 250px;
	margin-top: 70px;
	padding: 20px;
}
/* Edit Form Container */
.container {
	max-width: 600px;
	margin: auto;
	background: #fff;
	padding: 30px;
	border-radius: 12px;
	box-shadow: 0 6px 12px rgba(0, 0, 0, 0.05);
}
h2 {
	font-size: 24px;
	font-weight: 600;
	color: #1f2937;
	margin-bottom: 20px;
	text-align: center;
}
/* Form */
form {
	display: flex;
	flex-direction: column;
	gap: 15px;
}
label {
	font-size: 14px;
	font-weight: 600;
	color: #374151;
}
input[type="text"], textarea {
	padding: 10px 12px;
	border: 1px solid #d1d5db;
	border-radius: 8px;
	font-size: 14px;
	width: 100%;
}
textarea {
	resize: none;
	height: 100px;
}
button {
	padding: 10px 16px;
	background: #3b82f6;
	color: #fff;
	border: none;
	border-radius: 6px;
	font-size: 15px;
	cursor: pointer;
	transition: 0.3s;
}
button:hover {
	background: #2563eb;
}
.cancel-btn {
	background: #6b7280;
}
.cancel-btn:hover {
	background: #4b5563;
}
.btn-group {
	display: flex;
	justify-content: space-between;
	margin-top: 10px;
}
/* Responsive */
@media (max-width: 600px) {
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
			<a href="dashboard"><i class="fas fa-home"></i> Dashboard</a>
			<a href="MyItemsPage" class="active"><i class="fas fa-box-open"></i> My Items</a>
			<a href="BrowseItemsPage"><i class="fas fa-search"></i> Browse Items</a>
			<a href="MessagesPage"><i class="fas fa-envelope"></i> Messages</a>
			<a href="NotificationsPage"><i class="fas fa-bell"></i> Notifications</a>
			<a href="ProfilePage"><i class="fas fa-user"></i> Profile</a>
		</nav>
	</div>

	<!-- Topbar -->
	<div class="topbar">
		<h2>
			Welcome, <span style="color: #3b82f6;">User</span>
		</h2>
		<div class="user-info">
			<img src="https://i.pravatar.cc/40" alt="User">
			<a href="LogOut"><button>Logout</button></a>
		</div>
	</div>

	<!-- Main Content -->
	<div class="main">
		<div class="container">
			<h2>Edit Item</h2>
			<%
				Item item = (Item) request.getAttribute("item");
				if (item != null) {
			%>
			<form action="UpdateItem" method="post">
				<input type="hidden" name="itemId" value="<%= item.getId()%>">

				<label>Item Name</label>
				<input type="text" name="itemName" value="<%= item.getItemName() %>" required>

				<label>Description</label>
				<textarea name="description" required><%= item.getDescription() %></textarea>

				<label>Category</label>
				<input type="text" name="category" value="<%= item.getCategory() %>">

				<label>Condition</label>
				<input type="text" name="condition" value="<%= item.getCondition() %>">

				<div class="btn-group">
					<button type="submit">Update Item</button>
					<a href="MyItemsPage"><button type="button" class="cancel-btn">Cancel</button></a>
				</div>
			</form>
			<% } else { %>
				<p style="text-align:center;color:red;">Item not found!</p>
			<% } %>
		</div>
	</div>

</body>
</html>
