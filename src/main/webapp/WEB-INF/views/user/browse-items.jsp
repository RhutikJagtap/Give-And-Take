<!DOCTYPE html>
<%@page import="com.giveandtakemodel.Item"%>
<%@page import="java.util.List"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GiveAndTake - Browse Items</title>
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
	position: relative;
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
} /* Filter Panel (TOP RIGHT) */
.filter-panel {
	position: absolute;
	top: 70px; /* Just below the topbar */
	right: 20px;
	width: 220px;
	background: #fff;
	padding: 15px;
	border-radius: 10px;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
	z-index: 5;
}

.filter-panel h3 {
	margin-bottom: 10px;
	font-size: 16px;
	color: #111827;
}

.filter-panel label {
	display: block;
	margin: 10px 0 5px;
	font-size: 14px;
	color: #374151;
}

.filter-panel select {
	width: 100%;
	padding: 6px 8px;
	border-radius: 6px;
	border: 1px solid #d1d5db;
} /* Main Content */
.main {
	margin-left: 250px;
	margin-top: 70px;
	padding: 20px;
}

.page-title {
	font-size: 24px;
	font-weight: 600;
	color: #111827;
	margin-bottom: 20px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.items-grid {
	display: flex;
	flex-wrap: wrap;
	gap: 20px;
}

.item-card {
	background: #fff;
	border-radius: 12px;
	padding: 15px;
	width: calc(30% - 20px);
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
	height: 180px;
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
	margin-bottom: 12px;
}

.item-card .actions {
	display: flex;
	justify-content: center;
}

.item-card .actions button {
	padding: 8px 16px;
	font-size: 14px;
	border: none;
	border-radius: 6px;
	cursor: pointer;
	background: #3b82f6;
	color: #fff;
	transition: 0.3s;
}

.item-card .actions button:hover {
	background: #2563eb;
} /* Responsive */
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
	.filter-panel {
		position: static;
		width: 100%;
		margin-top: 10px;
	}
}

.items-count {
	text-align: center;
	margin-left: 360px;
	margin-top: 20px;
	padding: 12px;
	font-size: 15px;
	font-weight: 500;
	color: red;
	border: 1px solid #e5e7eb;
	display: inline-block;
}

.pagination {
	display: flex;
	justify-content: center;
	align-items: center;
	margin: 25px 0;
	gap: 8px;
}

.pagination button {
	padding: 8px 14px;
	border: none;
	border-radius: 6px;
	cursor: pointer;
	font-size: 14px;
	background: #f3f4f6;
	color: #374151;
	transition: 0.3s;
}

.pagination button:hover {
	background: #3b82f6;
	color: #fff;
}

.pagination button.active {
	background: #3b82f6;
	color: #fff;
	font-weight: 600;
}
</style>

<!-- Google Maps Places API -->
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDau4lJFTENpHxTtok66JYLTOpjErwZnO4&libraries=places"></script>
<script>
	function initAutocomplete() {
		// Initialize the input field for location autocomplete
		const input = document.getElementById('location-input');
		const autocomplete = new google.maps.places.Autocomplete(input);
		autocomplete.setFields([ 'geometry', 'name' ]); // only get geometry and name
	}
</script>
</head>
<body onload="initAutocomplete()">

	<!-- Sidebar -->
	<div class="sidebar">
		<div class="logo">
			<i class="fas fa-box"></i> GiveAndTake
		</div>
		<nav>
			<a href="dashboard"><i class="fas fa-home"></i> Dashboard</a> <a
				href="MyItemsPage"><i class="fas fa-box-open"></i> My Items</a> <a
				href="BrowseItemsPage" class="active"><i class="fas fa-search"></i>
				Browse Items</a> <a href="MessagesPage"><i class="fas fa-envelope"></i>
				Messages</a> <a href="NotificationsPage"><i class="fas fa-bell"></i>
				Notifications</a> <a href="ProfilePage"><i class="fas fa-user"></i>
				Profile</a>
		</nav>
	</div>

	<!-- Topbar -->
	<div class="topbar">
		<h2>Browse Items</h2>
		<div class="user-info">
			<img src="https://i.pravatar.cc/40" alt="User"> <a
				href="LogOut"><button>Logout</button></a>
		</div>
	</div>

	<!-- Filter Panel -->
	<div class="filter-panel">
		<%
		String selectedCategory = (String) request.getAttribute("selectedCategory");
		String selectedCondition = (String) request.getAttribute("selectedCondition");
		String selectedDateSort = (String) request.getAttribute("selectedDateSort");
		String selectedType = (String) request.getAttribute("selectedType");
		String selectedLocation = (String) request.getAttribute("selectedLocation");
		%>
		<h3>Filter / Sort Items</h3>

		<form action="ItemSortController" method="get">
			<label for="category">Filter by Category</label> <select
				id="category" name="category" onchange="this.form.submit()">
				<option value="">--Select--</option>
				<option value="Electronics"
					<%="Electronics".equals(selectedCategory) ? "selected" : ""%>>Electronics</option>
				<option value="Books"
					<%="Books".equals(selectedCategory) ? "selected" : ""%>>Books</option>
				<option value="Clothes"
					<%="Clothes".equals(selectedCategory) ? "selected" : ""%>>Clothes</option>
				<option value="Toys"
					<%="Toys".equals(selectedCategory) ? "selected" : ""%>>Toys</option>
			</select>
		</form>

		<form action="ItemSortController" method="get">
			<label for="date-sort">Sort by Date Added</label> <select
				id="date-sort" name="dateSort" onchange="this.form.submit()">
				<option value="">--Select--</option>
				<option value="NewestFirst"
					<%="NewestFirst".equals(selectedDateSort) ? "selected" : ""%>>Newest
					First</option>
				<option value="OldestFirst"
					<%="OldestFirst".equals(selectedDateSort) ? "selected" : ""%>>Oldest
					First</option>
			</select>
		</form>

		<form action="ItemSortController" method="get">
			<label for="type">Filter by Type</label> <select id="type"
				name="type" onchange="this.form.submit()">
				<option value="">--Select--</option>
				<option value="Donate"
					<%="Donate".equals(selectedType) ? "selected" : ""%>>Donate</option>
				<option value="Exchange"
					<%="Exchange".equals(selectedType) ? "selected" : ""%>>Exchange</option>
			</select>
		</form>

		<!-- Filter by Nearby Location -->
		<form action="ItemSortController" method="get">
			<label for="location">Filter by Nearby Location</label> <input
				type="text" id="location-input" name="location"
				placeholder="Enter location"
				value="<%=selectedLocation != null ? selectedLocation : ""%>">
			<button type="submit"
				style="margin-top: 8px; background: #3b82f6; color: #fff; padding: 6px 12px; border: none; border-radius: 6px;">Search
				Nearby</button>
		</form>
	</div>

	<!-- Main Content -->
	<div class="main">
		<div class="page-title">
			<span>Available Items for Exchange/Donation</span>
		</div>

		<%
		List<Item> list = (List<Item>) request.getAttribute("allItem");
		%>
		<div class="items-grid">
			<%
			if (list != null && !list.isEmpty()) {
				for (Item item : list) {
			%>
			<div class="item-card">
				<img
					src="https://upload.wikimedia.org/wikipedia/commons/4/41/Left_side_of_Flying_Pigeon.jpg"
					alt="Item">
				<h3><%=item.getItemName()%></h3>
				<p><%=item.getDescription()%></p>

				<p>
					Type:
					<%=item.getType()%></p>
				<div class="actions">
					<a href="ItemDetailsPage?itemId=<%=item.getId()%>"><button
							type="button">View Details</button></a>
					<form action="MessageController" method="post"
						style="display: inline; padding-left: 10px">
						<input type="hidden" name="receiverId"
							value="<%=item.getOwnerId()%>">
						<button type="submit">Message Owner</button>
					</form>
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

		<div class="items-count"><%= (list!=null?list.size():0) %>
			Items found
		</div>

		<!-- Pagination (Static for now) -->
		<div class="pagination">
			<button class="prev">&laquo; Previous</button>
			<button class="active">1</button>
			<button>2</button>
			<button>3</button>
			<button class="next">Next &raquo;</button>
		</div>

	</div>

</body>
</html>
