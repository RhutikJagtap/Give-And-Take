<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import="com.giveandtake.model.Item"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GiveAndTake - My Items</title>
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

/* Page Heading */
.page-title {
	font-size: 24px;
	font-weight: 600;
	color: #111827;
	margin-bottom: 20px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.page-title button {
	padding: 10px 16px;
	background: #3b82f6;
	color: #fff;
	border: none;
	border-radius: 6px;
	cursor: pointer;
	transition: 0.3s;
}

.page-title button:hover {
	background: #2563eb;
}

/* Items Grid */
.items-grid {
	display: flex;
	flex-wrap: wrap;
	gap: 20px;
}

.item-card {
	background: #fff;
	border-radius: 12px;
	padding: 15px;
	width: calc(25% - 20px);
	box-shadow: 0 6px 12px rgba(0, 0, 0, 0.05);
	transition: transform 0.3s, box-shadow 0.3s;
	position: relative;
}

.item-card:hover {
	transform: translateY(-5px);
	box-shadow: 0 12px 20px rgba(0, 0, 0, 0.1);
}

.item-card img {
	width: 100%;
	height: 150px;
	object-fit: cover;
	border-radius: 10px;
	margin-bottom: 12px;
}

.item-card h3 {
	font-size: 18px;
	color: #1f2937;
	margin-bottom: 6px;
}

.item-card p {
	font-size: 14px;
	color: #6b7280;
	margin-bottom: 10px;
}

.item-card .actions {
	display: flex;
	justify-content: space-between;
}

.item-card .actions button {
	padding: 6px 12px;
	font-size: 13px;
	border: none;
	border-radius: 6px;
	cursor: pointer;
	transition: 0.3s;
}

.item-card .actions .edit {
	background: #facc15;
	color: #1f2937;
}

.item-card .actions .edit:hover {
	background: #eab308;
}

.item-card .actions .delete {
	background: #ef4444;
	color: white;
}

.item-card .actions .delete:hover {
	background: #dc2626;
}

/* Responsive */
@media ( max-width :1024px) {
	.item-card {
		width: calc(50% - 20px);
	}
}

@media ( max-width :600px) {
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
	.item-card {
		width: 100%;
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
			<a href="dashboard" ><i class="fas fa-home"></i> Dashboard</a>
			<a href="MyItemsPage" class="active"><i class="fas fa-box-open"></i> My Items</a>
			<a href="BrowseItemsPage"><i class="fas fa-search"></i> Browse
				Items</a> <a href="MessagesPage"><i class="fas fa-envelope"></i>
				Messages</a> <a href="NotificationsPage"><i class="fas fa-bell"></i>
				Notifications</a> <a href="ProfilePage"><i class="fas fa-user"></i>
				Profile</a>
		</nav>
	</div>

	<!-- Topbar -->
	<div class="topbar">
		<h2>
			Welcome, <span style="color: #3b82f6;">User</span>
		</h2>
		<div class="user-info">
			<img src="https://i.pravatar.cc/40" alt="User">
			<a href="LogOut"> <button>Logout</button></a>
		</div>
	</div>

	<!-- Main Content -->
	<div class="main">

		<div class="page-title">
			<span>My Items</span>
			<a href="AddItemPage"> <button>Add New Item</button></a>
		</div>

		      	<% List<Item> items= (List<Item>)request.getAttribute("items"); 	%>	
		<div class="items-grid">
	<% 	if (items != null) {
				for (Item item : items) {
			%>
		      
			<div class="item-card">
				<img
					src="https://upload.wikimedia.org/wikipedia/commons/4/41/Left_side_of_Flying_Pigeon.jpg"
					alt="Item">
				<h3><%= item.getItemName() %></h3>
				<p><%= item.getDescription()%></p>
				<div class="actions">
					<a href="EditItemPage?itemId=<%= item.getId()%>"><button class="edit">Edit</button></a>
					<button class="delete">Delete</button>
				</div>
			</div>
			<%
				}
			} else {
			%>
			<p>No Items available.</p>
			<%
			}
			%>
		</div>
		<p style="text-align: center;padding-top:15px"> <%= items.size()%> items available </p>
	</div>

</body>
</html>
