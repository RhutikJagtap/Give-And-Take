<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import="com.giveandtake.model.Item"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>All Items - GiveAndTake Admin</title>
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	rel="stylesheet">
<style>
/* (reuse the same CSS from your Manage Items page for consistency) */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Inter', sans-serif;
}

body, html {
	background: #f4f7fa;
}

.sidebar {
	width: 250px;
	background: #1f2937;
	color: #fff;
	position: fixed;
	top: 0;
	bottom: 0;
	left: 0;
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
}

.sidebar nav a:hover, .sidebar nav a.active {
	background: #3b82f6;
	color: #fff;
}

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
	color: #fff;
	border: none;
	border-radius: 6px;
	cursor: pointer;
	transition: 0.3s;
}

.user-info button:hover {
	background: #dc2626;
}

.main {
	margin-left: 250px;
	margin-top: 70px;
	padding: 20px;
}

.page-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 20px;
}

.page-header h3 {
	font-size: 22px;
}

.table-container {
	background: #fff;
	border-radius: 12px;
	box-shadow: 0 6px 12px rgba(0, 0, 0, 0.05);
	overflow-x: auto;
	padding: 20px;
}

.table-container table {
	width: 100%;
	border-collapse: collapse;
}

.table-container th, .table-container td {
	padding: 12px 15px;
	text-align: left;
}

.table-container th {
	background: #3b82f6;
	color: #fff;
	border-radius: 6px;
}

.table-container tr:nth-child(even) {
	background: #f4f7fa;
}

.table-container td button {
	padding: 6px 12px;
	margin: 3px;
	border: none;
	border-radius: 6px;
	cursor: pointer;
	color: #fff;
	font-size: 14px;
}

.edit-btn {
	background: #3b82f6;
}

.edit-btn:hover {
	background: #2563eb;
}

.delete-btn {
	background: #ef4444;
}

.delete-btn:hover {
	background: #dc2626;
}

footer {
	text-align: center;
	padding: 15px;
	background: #1f2937;
	color: #fff;
	margin-top: 30px;
}

@media ( max-width : 768px) {
	.page-header {
		flex-direction: column;
		gap: 10px;
	}
}

@media ( max-width : 600px) {
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
			<a href="admin-dashboard"><i class="fas fa-home"></i> Dashboard</a> <a
				href="ManageItemsPage" class="active"><i class="fas fa-box-open"></i> Manage
				Items</a> <a href="ManageUserPage"><i
				class="fas fa-users"></i> Manage Users</a> <a href="#"><i
				class="fas fa-exchange-alt"></i> Pending Exchanges</a> <a
				href="TransactionsPage"><i class="fas fa-receipt"></i>
				Transactions</a>
		</nav>
	</div>

	<!-- Topbar -->
	<div class="topbar">
		<h2>
			Welcome, <span style="color: #3b82f6;">Admin</span>
		</h2>
		<div class="user-info">
			<img src="https://i.pravatar.cc/40" alt="Admin"> <a
				href="LogOut"><button>Logout</button></a>
		</div>
	</div>

	<!-- Main content -->
	<div class="main">
		<div class="page-header">
			<h3>All Items</h3>
		</div>

		<div class="table-container">
			<table>
				<thead>
					<tr>
						<th>ID</th>
						<th>Item Name</th>
						<th>Owner</th>
						<th>Category</th>
						<th>Status</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<%
					List<Item> allItems = (List<Item>) request.getAttribute("allItems");
					if (allItems != null && !allItems.isEmpty()) {
						for (Item item : allItems) {
					%>
					<tr>
						<td><%=item.getId()%></td>
						<td><%=item.getItemName()%></td>
						<td><%=item.getOwnerId()%></td>
						<td><%=item.getCategory()%></td>
						<td><%=item.getStatus()%></td>
						<td><a href="EditItemPage?itemId=<%=item.getId()%>">
								<button class="edit-btn">Edit</button>
						</a> <a href="DeleteItem?itemId=<%=item.getId()%>"
							onclick="return confirm('Are you sure you want to delete this item?');">
							<button class="delete-btn">Delete</button>
						</a></td>
					</tr>
					<%
					}
					} else {
					%>
					<tr>
						<td colspan="6"
							style="text-align: center; color: red; font-weight: bold;">
							No items found</td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
	</div>

	<footer>&copy; 2025 GiveAndTake. All rights reserved.</footer>
</body>
</html>
