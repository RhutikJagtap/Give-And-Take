<!DOCTYPE html>
<%@page import="com.giveandtakemodel.User"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GiveAndTake - User Dashboard</title>
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
	overflow-x: hidden;
	height: 100%;
	background: #f4f7fa;
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
	transition: background 0.3s;
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

/* Stats Cards */
.stats {
	display: flex;
	flex-wrap: wrap;
	gap: 20px;
	margin-bottom: 30px;
}

.stat-card {
	flex: 1 1 220px;
	min-width: 200px;
	background: #fff;
	border-radius: 12px;
	padding: 20px;
	display: flex;
	align-items: center;
	box-shadow: 0 6px 12px rgba(0, 0, 0, 0.05);
	transition: transform 0.3s;
}

.stat-card:hover {
	transform: translateY(-5px);
}

.stat-icon {
	width: 50px;
	height: 50px;
	border-radius: 10px;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 20px;
	margin-right: 15px;
}

.stat-info h3 {
	font-size: 22px;
	color: #111827;
	margin-bottom: 5px;
}

.stat-info p {
	font-size: 14px;
	color: #6b7280;
}

/* Hero Slider */
.hero {
	position: relative;
	width: 100%;
	height: 250px;
	border-radius: 12px;
	overflow: hidden;
	margin-bottom: 20px;
}

.slide {
	position: absolute;
	width: 100%;
	height: 100%;
	background-size: cover;
	background-position: center;
	opacity: 0;
	transition: opacity 1s ease-in-out;
	border-radius: 12px;
}

.slide.active {
	opacity: 1;
}

.slider-controls {
	position: absolute;
	top: 50%;
	width: 100%;
	transform: translateY(-50%);
	display: flex;
	justify-content: space-between;
	padding: 0 15px;
}

.slider-controls button {
	background: rgba(0, 0, 0, 0.5);
	color: #fff;
	border: none;
	padding: 10px;
	border-radius: 50%;
	cursor: pointer;
	transition: 0.3s;
}

.slider-controls button:hover {
	background: rgba(0, 0, 0, 0.8);
}

/* Dashboard Cards */
.cards {
	display: flex;
	flex-wrap: wrap;
	gap: 20px;
}

.card {
	flex: 1 1 calc(25% - 20px);
	min-width: 220px;
	background: #fff;
	border-radius: 12px;
	padding: 20px;
	text-align: center;
	box-shadow: 0 6px 12px rgba(0, 0, 0, 0.05);
	transition: transform 0.3s, box-shadow 0.3s;
}

.card:hover {
	transform: translateY(-6px);
	box-shadow: 0 12px 20px rgba(0, 0, 0, 0.1);
}

.card img {
	width: 64px;
	margin-bottom: 12px;
}

.card h3 {
	margin-bottom: 8px;
	font-size: 18px;
	color: #1f2937;
}

.card p {
	font-size: 14px;
	color: #6b7280;
	margin-bottom: 12px;
}

.card button {
	padding: 10px 16px;
	background: #3b82f6;
	color: #fff;
	border: none;
	border-radius: 6px;
	cursor: pointer;
	transition: background 0.3s;
}

.card button:hover {
	background: #2563eb;
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
@media ( max-width :1024px) {
	.card {
		flex: 1 1 calc(50% - 20px);
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
	.card {
		flex: 1 1 100%;
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
			<a href="dashboard" class="active"><i class="fas fa-home"></i>
				Dashboard</a> <a href="MyItemsPage"><i class="fas fa-box-open"></i>
				My Items</a> <a href="BrowseItemsPage"><i class="fas fa-search"></i>
				Browse Items</a> <a href="MessagesPage"><i class="fas fa-envelope"></i>
				Messages</a> <a href="NotificationsPage"><i class="fas fa-bell"></i>
				Notifications</a> <a href="ProfilePage"><i class="fas fa-user"></i>
				Profile</a>
		</nav>
	</div>

	<%
	User user = (User) session.getAttribute("user");
	%>

	<!-- Topbar -->
	<div class="topbar">
		<h2>
			Welcome, <span style="color: #3b82f6;"><%=user.getName()%></span>
		</h2>
		<div class="user-info">
			<img src="https://i.pravatar.cc/40" alt="User"> <a
				href="LogOut">
				<button>Logout</button>
			</a>
		</div>
	</div>

	<!-- Main Content -->
	<div class="main">

		<!-- Stats Section ABOVE Hero -->
		<div class="stats">
			<div class="stat-card">
				<div class="stat-icon"
					style="background-color: rgba(59, 130, 246, 0.1); color: #3b82f6;">
					<i class="fas fa-box"></i>
				</div>
				<div class="stat-info">
					<h3>10</h3>
					<p>Items Donated</p>
				</div>
			</div>
			<div class="stat-card">
				<div class="stat-icon"
					style="background-color: rgba(16, 185, 129, 0.1); color: #10b981;">
					<i class="fas fa-exchange-alt"></i>
				</div>
				<div class="stat-info">
					<h3>5</h3>
					<p>Items Exchanged</p>
				</div>
			</div>
			<div class="stat-card">
				<div class="stat-icon"
					style="background-color: rgba(245, 158, 11, 0.1); color: #f59e0b;">
					<i class="fas fa-comment-alt"></i>
				</div>
				<div class="stat-info">
					<h3>3</h3>
					<p>Messages</p>
				</div>
			</div>
			<div class="stat-card">
				<div class="stat-icon"
					style="background-color: rgba(239, 68, 68, 0.1); color: #ef4444;">
					<i class="fas fa-clock"></i>
				</div>
				<div class="stat-info">
					<h3>2</h3>
					<p>Pending Requests</p>
				</div>
			</div>
		</div>

		<!-- Hero Slider -->
		<div class="hero">
			<div class="slide active"
				style="background-image: url('https://images.unsplash.com/photo-1612831666411-12b3fa4b6bbf?auto=format&fit=crop&w=1200&q=80')"></div>
			<div class="slide"
				style="background-image: url('https://images.unsplash.com/photo-1612831455543-66b9c7f21457?auto=format&fit=crop&w=1200&q=80')"></div>
			<div class="slide"
				style="background-image: url('https://images.unsplash.com/photo-1612831412345-9e4b7d1caa8f?auto=format&fit=crop&w=1200&q=80')"></div>
			<div class="slider-controls">
				<button id="prev">&#10094;</button>
				<button id="next">&#10095;</button>
			</div>
		</div>

		<!-- Dashboard Cards -->
		<div class="cards">
			<div class="card">
				<img src="https://img.icons8.com/fluency/96/box.png">
				<h3>My Items</h3>
				<p>View and manage your items.</p>
				<button>Go</button>
			</div>
			<div class="card">
				<img src="https://img.icons8.com/fluency/96/search.png">
				<h3>Browse Items</h3>
				<p>Explore items to exchange or donate.</p>
				<button>Go</button>
			</div>
			<div class="card">
				<img src="https://img.icons8.com/fluency/96/sms.png">
				<h3>Messages</h3>
				<p>Chat with other users.</p>
				<button>Go</button>
			</div>
			<div class="card">
				<img
					src="https://img.icons8.com/fluency/96/appointment-reminders.png">
				<h3>Notifications</h3>
				<p>Stay updated on exchanges.</p>
				<button>Go</button>
			</div>
		</div>

	</div>

	<footer>&copy; 2025 GiveAndTake. All rights reserved.</footer>

	<script>
const slides=document.querySelectorAll('.slide'); let currentSlide=0;
function showSlide(index){slides.forEach(s=>s.classList.remove('active')); slides[index].classList.add('active');}
function nextSlide(){currentSlide=(currentSlide+1)%slides.length; showSlide(currentSlide);}
function prevSlide(){currentSlide=(currentSlide-1+slides.length)%slides.length; showSlide(currentSlide);}
let slideInterval=setInterval(nextSlide,3500);
document.getElementById('next').addEventListener('click',()=>{nextSlide(); clearInterval(slideInterval); slideInterval=setInterval(nextSlide,3500);});
document.getElementById('prev').addEventListener('click',()=>{prevSlide(); clearInterval(slideInterval); slideInterval=setInterval(nextSlide,3500);});
</script>

</body>
</html>
