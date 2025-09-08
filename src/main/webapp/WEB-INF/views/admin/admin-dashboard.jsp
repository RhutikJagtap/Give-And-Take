<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GiveAndTake - Admin Dashboard</title>
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
    box-shadow: 0 2px 4px rgba(0,0,0,0.05);
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
}
.stat-card {
    flex: 1 1 calc(25% - 20px);
    min-width: 200px;
    background: #fff;
    border-radius: 12px;
    padding: 20px;
    box-shadow: 0 6px 12px rgba(0,0,0,0.05);
    display: flex;
    align-items: center;
}
.stat-icon {
    width: 50px;
    height: 50px;
    border-radius: 12px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 20px;
    margin-right: 15px;
    background: #3b82f6;
    color: #fff;
}

/* Action Cards */
.cards {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    margin-top: 20px;
}
.card {
    flex: 1 1 calc(25% - 20px);
    min-width: 220px;
    background: #fff;
    border-radius: 12px;
    padding: 20px;
    text-align: center;
    box-shadow: 0 6px 12px rgba(0,0,0,0.05);
    transition: transform 0.3s, box-shadow 0.3s;
    cursor: pointer;
}
.card:hover {
    transform: translateY(-6px);
    box-shadow: 0 12px 20px rgba(0,0,0,0.1);
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

/* Recent Activity */
.activity {
    margin-top: 30px;
    background: #fff;
    padding: 20px;
    border-radius: 12px;
    box-shadow: 0 6px 12px rgba(0,0,0,0.05);
}
.activity h3 {
    margin-bottom: 12px;
}
.activity-list li {
    margin-bottom: 8px;
    font-size: 14px;
    color: #374151;
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
@media (max-width: 1024px) {
    .stat-card, .card {
        flex: 1 1 calc(50% - 20px);
    }
}
@media (max-width: 600px) {
    .sidebar { display: none; }
    .topbar { left: 0; width: 100%; }
    .main { margin-left: 0; }
    .stat-card, .card { flex: 1 1 100%; }
}
</style>
</head>
<body>

<!-- Sidebar -->
<div class="sidebar">
    <div class="logo"><i class="fas fa-box"></i> GiveAndTake</div>
    <nav>
        <a href="admin-dashboard" class="active"><i class="fas fa-home"></i> Dashboard</a>
        <a href="ManageItemsPage"><i class="fas fa-box-open"></i> Manage Items</a>
        <a href="ManageUserPage"><i class="fas fa-users"></i>Manage Users</a>
        <a href="#"><i class="fas fa-exchange-alt"></i> Pending Exchanges</a>
         <a href="TransactionsPage"><i class="fas fa-receipt"></i> Transactions</a>
        </nav>
</div>

<!-- Topbar -->
<div class="topbar">
    <h2>Welcome, <span style="color:#3b82f6;">Admin</span></h2>
    <div class="user-info">
        <img src="https://i.pravatar.cc/40" alt="Admin">
			<a href="LogOut"><button>Logout</button></a>
    </div>
</div>

<!-- Main Content -->
<div class="main">

    <!-- Stats Section -->
    <div class="stats">
        <div class="stat-card">
            <div class="stat-icon"><i class="fas fa-box"></i></div>
            <div class="stat-info">
                <h3>50</h3>
                <p>Total Items</p>
            </div>
        </div>
        <div class="stat-card">
            <div class="stat-icon"><i class="fas fa-users"></i></div>
            <div class="stat-info">
                <h3>20</h3>
                <p>Active Users</p>
            </div>
        </div>
        <div class="stat-card">
            <div class="stat-icon"><i class="fas fa-exchange-alt"></i></div>
            <div class="stat-info">
                <h3>15</h3>
                <p>Pending Exchanges</p>
            </div>
        </div>
        <div class="stat-card">
            <div class="stat-icon"><i class="fas fa-bell"></i></div>
            <div class="stat-info">
                <h3>5</h3>
                <p>Notifications</p>
            </div>
        </div>
    </div>

    <!-- Action Cards -->
    <div class="cards">
        <div class="card" onclick="location.href='#'">
            <img src="https://img.icons8.com/fluency/96/box.png">
            <h3>Manage Items</h3>
            <p>Add, update, or remove items.</p>
            <button>Go</button>
        </div>
        <div class="card" onclick="location.href='#'">
            <img src="https://img.icons8.com/fluency/96/users.png">
            <h3>Users</h3>
            <p>View and manage all users.</p>
            <button>Go</button>
        </div>
        <div class="card" onclick="location.href='#'">
            <img src="https://img.icons8.com/fluency/96/exchange.png">
            <h3>Pending Exchanges</h3>
            <p>Approve or reject requests.</p>
            <button>Go</button>
        </div>
        <div class="card" onclick="location.href='#'">
            <img src="https://img.icons8.com/fluency/96/settings.png">
            <h3>Settings</h3>
            <p>Platform configuration options.</p>
            <button>Go</button>
        </div>
    </div>

    <!-- Recent Activity -->
    <div class="activity">
        <h3>Recent Activity</h3>
        <ul class="activity-list">
            <li>User John added a new item "Old Bicycle"</li>
            <li>Exchange request approved for "Books Set"</li>
            <li>New user Alice registered</li>
            <li>Pending approval for "Used Laptop"</li>
        </ul>
    </div>

</div>

<footer>&copy; 2025 GiveAndTake. All rights reserved.</footer>
</body>
</html>
