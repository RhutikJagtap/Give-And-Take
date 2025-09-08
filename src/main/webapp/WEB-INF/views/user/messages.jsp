<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GiveAndTake - Messages</title>
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
	display: flex;
	height: calc(100vh - 70px);
	overflow: hidden;
}

/* Conversations List */
.conversations {
	width: 300px;
	background: #fff;
	border-radius: 12px;
	box-shadow: 0 6px 12px rgba(0, 0, 0, 0.05);
	overflow-y: auto;
	padding: 10px;
	margin-right: 20px;
}

.conversations h3 {
	font-size: 18px;
	margin-bottom: 10px;
	color: #111827;
	text-align: center;
}

.conversation {
	display: flex;
	align-items: center;
	padding: 10px;
	border-radius: 8px;
	cursor: pointer;
	transition: 0.3s;
}

.conversation:hover, .conversation.active {
	background: #3b82f6;
	color: #fff;
}

.conversation img {
	width: 40px;
	height: 40px;
	border-radius: 50%;
	margin-right: 10px;
}

.conversation p {
	font-size: 14px;
	flex: 1;
}

/* Chat Window */
.chat-window {
	flex: 1;
	background: #fff;
	border-radius: 12px;
	box-shadow: 0 6px 12px rgba(0, 0, 0, 0.05);
	display: flex;
	flex-direction: column;
	overflow: hidden;
}

.chat-header {
	padding: 15px;
	border-bottom: 1px solid #e5e7eb;
	font-weight: 600;
	font-size: 18px;
	color: #111827;
}

.chat-messages {
	flex: 1;
	padding: 15px;
	overflow-y: auto;
	display: flex;
	flex-direction: column;
	gap: 10px;
}

.message {
	max-width: 60%;
	padding: 10px 14px;
	border-radius: 12px;
	font-size: 14px;
	line-height: 1.4;
}

.message.sent {
	background: #3b82f6;
	color: #fff;
	align-self: flex-end;
	border-bottom-right-radius: 0;
}

.message.received {
	background: #e5e7eb;
	color: #111827;
	align-self: flex-start;
	border-bottom-left-radius: 0;
}

.chat-input {
	display: flex;
	padding: 10px;
	border-top: 1px solid #e5e7eb;
}

.chat-input input {
	flex: 1;
	padding: 10px 15px;
	border-radius: 8px;
	border: 1px solid #cbd5e1;
	margin-right: 10px;
}

.chat-input button {
	padding: 10px 16px;
	background: #3b82f6;
	color: #fff;
	border: none;
	border-radius: 8px;
	cursor: pointer;
	transition: 0.3s;
}

.chat-input button:hover {
	background: #2563eb;
}

/* Responsive */
@media ( max-width :1024px) {
	.conversations {
		width: 200px;
	}
}

@media ( max-width :768px) {
	.main {
		flex-direction: column;
	}
	.conversations {
		margin-right: 0;
		margin-bottom: 15px;
		width: 100%;
		height: 200px;
	}
	.chat-window {
		height: calc(100vh - 70px - 215px);
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
				Items</a> <a href="MessagesPage" class="active"><i
				class="fas fa-envelope"></i> Messages</a> <a href="NotificationsPage"><i
				class="fas fa-bell"></i> Notifications</a> <a href="ProfilePage"><i
				class="fas fa-user"></i> Profile</a>
		</nav>
	</div>

	<!-- Topbar -->
	<div class="topbar">
		<h2>Messages</h2>
		<div class="user-info">
			<img src="https://i.pravatar.cc/40" alt="User">
			<a href="LogOut"> <button>Logout</button></a>
		</div>
	</div>

	<!-- Main Content -->
	<div class="main">
		<!-- Conversations List -->
		<div class="conversations">
			<h3>Chats</h3>
			<div class="conversation active">
				<img src="https://i.pravatar.cc/40?img=1" alt="User">
				<p>John Doe</p>
			</div>
			<div class="conversation">
				<img src="https://i.pravatar.cc/40?img=2" alt="User">
				<p>Alice Smith</p>
			</div>
			<div class="conversation">
				<img src="https://i.pravatar.cc/40?img=3" alt="User">
				<p>Bob Johnson</p>
			</div>
		</div>

		<!-- Chat Window -->
		<div class="chat-window">
			<div class="chat-header">John Doe</div>
			<div class="chat-messages">
				<div class="message received">Hi! Is the bicycle still
					available?</div>
				<div class="message sent">Yes, it is. Are you interested?</div>
				<div class="message received">Yes, can I request it for pickup
					tomorrow?</div>
			</div>
			<div class="chat-input">
				<input type="text" placeholder="Type a message...">
				<button>Send</button>
			</div>
		</div>
	</div>

</body>
</html>
