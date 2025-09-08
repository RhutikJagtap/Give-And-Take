<!DOCTYPE html>
<%@page import="com.giveandtake.model.User"%>
<%@page import="java.util.List"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GiveAndTake - Manage Users</title>
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
	padding: 20px;
	display: flex;
	flex-direction: column;
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

/* Users Table */
.table-container {
	background: #fff;
	border-radius: 12px;
	padding: 20px;
	box-shadow: 0 6px 12px rgba(0, 0, 0, 0.05);
	margin-top: 20px;
	overflow-x: auto;
}

.table-container h3 {
	margin-bottom: 15px;
}

table {
	width: 100%;
	border-collapse: collapse;
}

thead {
	background: #3b82f6;
	color: #fff;
}

th, td {
	padding: 12px 15px;
	text-align: left;
	border-bottom: 1px solid #e5e7eb;
}

tr:hover {
	background: #f1f5f9;
}

.action-btn {
	padding: 6px 12px;
	border: none;
	border-radius: 6px;
	cursor: pointer;
	transition: 0.3s;
}

.edit {
	background: #10b981;
	color: #fff;
}

.edit:hover {
	background: #059669;
}

.delete {
	background: #ef4444;
	color: #fff;
}

.delete:hover {
	background: #dc2626;
}

/* Footer */
footer {
	text-align: center;
	padding: 15px;
	background: #1f2937;
	color: white;
	margin-top: 30px;
}

/* Responsive */
@media ( max-width : 768px) {
	.table-container {
		padding: 10px;
	}
	th, td {
		padding: 8px;
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
        <a href="admin-dashboard" ><i class="fas fa-home"></i> Dashboard</a>
        <a href="ManageItemsPage"><i class="fas fa-box-open"></i> Manage Items</a>
        <a href="ManageUserPage" class="active"><i class="fas fa-users"></i>Manage Users</a>
        <a href="#"><i class="fas fa-exchange-alt"></i> Pending Exchanges</a>
         <a href="TransactionsPage"><i class="fas fa-receipt"></i> Transactions</a>
    </nav>
	</div>

	<!-- Topbar -->
	<div class="topbar">
		<h2>
			Welcome, <span style="color: #3b82f6;">Admin</span>
		</h2>
		<div class="user-info">
			<img src="https://i.pravatar.cc/40" alt="Admin">
			<a href="LogOut"><button>Logout</button></a>
		</div>
	</div>

<% 
    List<User> userList = (List<User>) request.getAttribute("alluser");
    if(userList != null && !userList.isEmpty()) {
%>
<div class="main">
    <div class="table-container">
        <h3>Manage Users</h3>
        <table>
            <thead>
                <tr>
                    <th>User ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Role</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% for(User u : userList) { %>
                <tr>
                    <td><%= u.getUserId() %></td>
                    <td><%= u.getName() %></td>
                    <td><%= u.getEmail() %></td>
                    <td><%= u.getRole() %></td>
                    <td>
                        <%-- Example logic: status based on lastLogin or custom field --%>
                        <%= (u.getLastLogin() != null) ? "Active" : "Inactive" %>
                    </td>
                    <td>
                        <button class="action-btn edit">Edit</button>
                        <button class="action-btn delete">Delete</button>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</div>
<% } else { %>
<div class="main">
    <div class="table-container">
        <h3>Manage Users</h3>
        <p style="text-align:center; color:red; font-weight:bold;">
            No users found.
        </p>
    </div>
</div>
<% } %>

	<footer>&copy; 2025 GiveAndTake. All rights reserved.</footer>
</body>
</html>
