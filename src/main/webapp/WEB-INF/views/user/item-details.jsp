<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GiveAndTake - Item Details</title>
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
/* Page Heading */
.page-title {
	font-size: 24px;
	font-weight: 600;
	color: #111827;
	margin-bottom: 20px;
}
/* Item Details Card */
.item-details {
	background: #fff;
	border-radius: 12px;
	padding: 20px;
	display: flex;
	gap: 20px;
	box-shadow: 0 6px 12px rgba(0, 0, 0, 0.05);
}
.item-details img {
	width: 350px;
	height: 300px;
	object-fit: cover;
	border-radius: 10px;
}
.item-info {
	flex: 1;
}
.item-info h2 {
	color: #1f2937;
	margin-bottom: 10px;
}
.item-info p {
	font-size: 15px;
	color: #374151;
	margin: 8px 0;
}
.item-actions {
	margin-top: 20px;
	display: flex;
	gap: 15px;
	flex-wrap: wrap;
}
.item-actions button {
	padding: 10px 16px;
	font-size: 14px;
	border: none;
	border-radius: 6px;
	cursor: pointer;
	transition: 0.3s;
}
.item-actions .request {
	background: #3b82f6;
	color: white;
}
.item-actions .request:hover {
	background: #2563eb;
}
.item-actions .chat {
	background: #10b981;
	color: white;
}
.item-actions .chat:hover {
	background: #059669;
}
.item-actions .wishlist {
	background: #facc15;
	color: #1f2937;
}
.item-actions .wishlist:hover {
	background: #eab308;
}
/* Info messages */
.info-msg {
	margin-top: 15px;
	padding: 12px;
	border-radius: 8px;
	font-size: 14px;
}
.info-wait {
	background: #fef3c7;
	border: 1px solid #fcd34d;
	color: #92400e;
}
.info-reject {
	background: #fee2e2;
	border: 1px solid #f87171;
	color: #991b1b;
}
</style>
</head>
<body>

	<!-- Sidebar -->
	<div class="sidebar">
		<div class="logo"><i class="fas fa-box"></i> GiveAndTake</div>
		<nav>
			<a href="dashboard"><i class="fas fa-home"></i> Dashboard</a>
			<a href="MyItemsPage"><i class="fas fa-box-open"></i> My Items</a>
			<a href="BrowseItemsPage" class="active"><i class="fas fa-search"></i> Browse Items</a>
			<a href="MessagesPage"><i class="fas fa-envelope"></i> Messages</a>
			<a href="NotificationsPage"><i class="fas fa-bell"></i> Notifications</a>
			<a href="ProfilePage"><i class="fas fa-user"></i> Profile</a>
		</nav>
	</div>

	<!-- Topbar -->
	<div class="topbar">
		<h2>Welcome, <span style="color: #3b82f6;">User</span></h2>
		<div class="user-info">
			<img src="https://i.pravatar.cc/40" alt="User">
			<a href="LogOut"><button>Logout</button></a>
		</div>
	</div>

	<!-- Main Content -->
	<div class="main">
		<div class="page-title">Item Details</div>

		<div class="item-details">
			<img src="https://upload.wikimedia.org/wikipedia/commons/4/41/Left_side_of_Flying_Pigeon.jpg" alt="Item">
			<div class="item-info">
				<h2>Old Bicycle</h2>
				<p><strong>Description:</strong> A sturdy used bicycle in good condition. Perfect for daily rides.</p>
				<p><strong>Category:</strong> Exchange</p>
				<p><strong>Location:</strong> Pune, India</p>
				<p><strong>Posted by:</strong> Mr. John Doe</p>

				<div class="item-actions">
					<!-- Case 1: Before Request -->
					<button class="request">Request Item</button>
					<button class="chat">Message Owner</button>
					<button class="wishlist">Add to Wishlist</button>

					<!-- Case 2: After Request Sent -->
					<!-- <div class="info-msg info-wait">✅ You have requested this item. Waiting for owner’s response.</div> -->

					<!-- Case 3: Request Accepted -->
					<!-- <button class="chat">Start Chat with Owner</button> -->

					<!-- Case 4: Request Rejected -->
					<!-- <div class="info-msg info-reject">❌ Your request was rejected by the owner.</div> -->
				</div>
			</div>
		</div>
	</div>

</body>
</html>
