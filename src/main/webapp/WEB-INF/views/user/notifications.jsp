<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.giveandtakemodel.Notification"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GiveAndTake - Notifications</title>
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

.notification-badge {
	background: #ef4444;
	color: white;
	border-radius: 50%;
	padding: 2px 7px;
	font-size: 12px;
	margin-left: 5px;
	display: inline-block;
	text-align: center;
	min-width: 20px;
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

.notifications {
	display: flex;
	flex-direction: column;
	gap: 15px;
}

.notification-card {
	background: #fff;
	border-radius: 12px;
	padding: 15px 20px;
	box-shadow: 0 6px 12px rgba(0, 0, 0, 0.05);
	display: flex;
	align-items: center;
	justify-content: space-between;
	transition: 0.3s;
}

.notification-card:hover {
	transform: translateY(-3px);
	box-shadow: 0 10px 15px rgba(0, 0, 0, 0.1);
}

.notification-card .icon {
	font-size: 20px;
	margin-right: 15px;
	color: #3b82f6;
}

.notification-card .content {
	flex: 1;
}

.notification-card .content p {
	font-size: 14px;
	color: #111827;
}

.notification-card .content span {
	font-size: 12px;
	color: #6b7280;
}

/* Mark as Read Button */
.mark-read-btn {
	padding: 5px 10px;
	background: #3b82f6;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: 0.3s;
}

.mark-read-btn:hover {
	background: #2563eb;
}

/* Responsive */
@media ( max-width :1024px) {
	.main {
		margin-left: 200px;
	}
	.sidebar {
		width: 200px;
	}
	.topbar {
		left: 200px;
	}
}

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
}
</style>
</head>
<body>
<%
	List<Notification> notifications = (List<Notification>) request.getAttribute("notifications");
%>

<!-- Sidebar -->
<div class="sidebar">
	<div class="logo">
		<i class="fas fa-box"></i> GiveAndTake
	</div>
	<nav>
		<a href="dashboard"><i class="fas fa-home"></i> Dashboard</a>
		<a href="MyItemsPage"><i class="fas fa-box-open"></i> My Items</a>
		<a href="BrowseItemsPage"><i class="fas fa-search"></i> Browse Items</a>
		<a href="MessagesPage"><i class="fas fa-envelope"></i> Messages</a>
		<a href="NotificationsPage" class="active">
			<i class="fas fa-bell"></i> Notifications
			<%
				if (notifications != null && !notifications.isEmpty()) {
			%>
				<span class="notification-badge"><%= notifications.size() %></span>
			<%
				}
			%>
		</a>
		<a href="ProfilePage"><i class="fas fa-user"></i> Profile</a>
	</nav>
</div>

<!-- Topbar -->
<div class="topbar">
	<h2>Notifications</h2>
	<div class="user-info">
		<img src="https://i.pravatar.cc/40" alt="User">
		<button>Logout</button>
	</div>
</div>

<!-- Main Content -->
<div class="main">
	<div class="notifications">
		<%
			if (notifications != null && !notifications.isEmpty()) {
				for (Notification notification : notifications) {
					String iconClass = "";
					switch (notification.getType()) {
						case "approved": iconClass = "fas fa-check-circle"; break;
						case "rejected": iconClass = "fas fa-times-circle"; break;
						case "requested_your_item": iconClass = "fas fa-envelope-open-text"; break;
						case "you_requested_item": iconClass = "fas fa-exchange-alt"; break;
						default: iconClass = "fas fa-info-circle";
					}
		%>
		<div class="notification-card">
			<div class="icon">
				<i class="<%=iconClass%>"></i>
			</div>
			<div class="content">
				<p><strong><%=notification.getMessage()%></strong></p>
				<span><%=notification.getCreatedAt()%></span>
			</div>
			<div>
					<a href="MarkAsRead?notificationId=<%=notification.getId()%>"><button type="submit" class="mark-read-btn">Mark as Read</button></a>
			</div>
		</div>
		<%
				}
			} else {
		%>
		<p style="color: gray;">No notifications found.</p>
		<%
			}
		%>
	</div>
</div>

</body>
</html>
