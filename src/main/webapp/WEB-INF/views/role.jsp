<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Select Role - GiveAndTake</title>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Poppins', sans-serif;
}
body {
  background: #f9fafb;
  color: #1f2937;
  line-height: 1.6;
}

/* Navbar/Header */
header {
  position: sticky;
  top: 0;
  width: 100%;
  background: white;
  color: #2563eb;
  padding: 18px 50px;
  font-size: 1.5rem;
  font-weight: 700;
  box-shadow: 0 2px 6px rgba(0,0,0,0.05);
  z-index: 1000;
  display: flex;
  align-items: center;
}
header img {
  width: 36px;
  margin-right: 10px;
}

/* Container */
.container {
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 40px;
  min-height: calc(100vh - 90px);
  padding: 40px 20px;
  flex-wrap: wrap;
}

/* Card */
.card {
  background: white;
  padding: 40px 30px;
  border-radius: 14px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
  text-align: center;
  width: 260px;
  transition: transform 0.3s;
}
.card:hover {
  transform: translateY(-6px);
}
.card img {
  width: 70px;
  margin-bottom: 15px;
}
.card h2 {
  margin-bottom: 10px;
  color: #2563eb;
  font-size: 1.4rem;
}
.card p {
  font-size: 14px;
  margin-bottom: 20px;
  color: #4b5563;
}

/* Buttons */
.card button {
  padding: 10px 20px;
  border: none;
  background: #facc15;
  color: #111827;
  border-radius: 8px;
  cursor: pointer;
  font-size: 15px;
  font-weight: 600;
  transition: background 0.3s;
}
.card button:hover {
  background: #eab308;
}

.card a {
  text-decoration: none;
}
</style>
</head>
<body>

<header>
  <img src="https://img.icons8.com/fluency/48/box.png" alt="logo">
  GiveAndTake
</header>

<div class="container">
  <div class="card">
    <img src="https://img.icons8.com/fluency/96/donate.png" alt="Donor">
    <h2>User</h2>
    <p>Donate or exchange items in your community.</p>
    <a href="UserLogin"><button>Login</button></a>
  </div>
  
  <div class="card">
    <img src="https://img.icons8.com/fluency/96/admin-settings-male.png" alt="Admin">
    <h2>Admin</h2>
    <p>Manage users, items & approvals easily.</p>
    <a href="AdminLoginPage"><button>Login</button></a>
  </div>
</div>

</body>
</html>
