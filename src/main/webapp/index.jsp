<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GiveAndTake</title>
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

/* Navbar */
.navbar {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 18px 50px;
  background: white;
  box-shadow: 0 2px 6px rgba(0,0,0,0.05);
  position: sticky;
  top: 0;
  z-index: 1000;
}
.navbar .logo {
  font-weight: 700;
  font-size: 1.5rem;
  color: #2563eb;
  display: flex;
  align-items: center;
}
.navbar .logo img {
  width: 36px;
  margin-right: 10px;
}
.navbar ul {
  display: flex;
  list-style: none;
  gap: 25px;
}
.navbar ul li a {
  text-decoration: none;
  color: #374151;
  font-weight: 500;
}
.navbar ul li a:hover {
  color: #2563eb;
}
.navbar .btn {
  padding: 8px 16px;
  border-radius: 8px;
  border: none;
  cursor: pointer;
  font-weight: 600;
}
.btn-primary {
  background: #2563eb;
  color: white;
}
.btn-primary:hover {
  background: #1d4ed8;
}
.btn-yellow {
  width:120px;
  height:30px;
  background: #facc15;
  color: #111827;
}
.btn-yellow:hover {
  background: #eab308;
}

/* Hero */
.hero {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  justify-content: space-between;
  padding: 80px 50px;
  background: linear-gradient(120deg, #dbeafe, #f0fdf4);
}
.hero-text {
  flex: 1 1 500px;
  padding-right: 30px;
}
.hero-text h1 {
  font-size: 3rem;
  font-weight: 700;
  color: #111827;
  margin-bottom: 15px;
}
.hero-text p {
  font-size: 1.1rem;
  margin-bottom: 20px;
  color: #4b5563;
}
.hero-text .btn-yellow {
  font-size: 16px;
}
.hero-img {
  flex: 1 1 400px;
  text-align: center;
}
.hero-img img {
  width: 90%;
  max-width: 450px;
}

/* Features */
.features {
  padding: 70px 40px;
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
  gap: 25px;
}
.feature-card {
  background: white;
  border-radius: 14px;
  padding: 25px;
  text-align: center;
  box-shadow: 0 4px 10px rgba(0,0,0,0.05);
  transition: transform 0.3s;
}
.feature-card:hover {
  transform: translateY(-6px);
}
.feature-card img {
  width: 70px;
  margin-bottom: 15px;
}
.feature-card h3 {
  margin-bottom: 10px;
  color: #2563eb;
}

/* Stats Section */
.stats {
  background: #1f2937;
  color: white;
  text-align: center;
  padding: 60px 20px;
}
.stats h2 {
  font-size: 2rem;
  margin-bottom: 30px;
}
.stat-boxes {
  display: flex;
  justify-content: center;
  gap: 40px;
  flex-wrap: wrap;
}
.stat {
  background: #111827;
  padding: 25px;
  border-radius: 12px;
  min-width: 180px;
}
.stat h3 {
  font-size: 2rem;
  color: #facc15;
}
.stat p {
  margin-top: 5px;
  color: #d1d5db;
}

/* Footer */
footer {
  text-align: center;
  padding: 20px;
  background: #f3f4f6;
  color: #374151;
  margin-top: 30px;
}
</style>
</head>
<body>

<!-- Navbar -->
<header class="navbar">
  <div class="logo">
    <img src="https://img.icons8.com/fluency/48/box.png" alt="logo">
    GiveAndTake
  </div>
  <ul>
    <li><a href="#features">Features</a></li>
    <li><a href="login.html">Login</a></li>
    <li><a href="signup.html" class="btn btn-yellow">Sign Up</a></li>
  </ul>
</header>

<!-- Hero -->
<section class="hero">
  <div class="hero-text">
    <h1>Give Items a New Life</h1>
    <p>Join GiveAndTake to donate, exchange, or share unused items with your community. Together we reduce waste and build connections.</p>
    <a href="welcome"><button class="btn btn-yellow">Get Started</button></a>
  </div>
  <div class="hero-img">
    <img src="https://cdn-icons-png.flaticon.com/512/3081/3081559.png" alt="sharing illustration">
  </div>
</section>

<!-- Features -->
<section class="features" id="features">
  <div class="feature-card">
    <img src="https://img.icons8.com/fluency/96/gift.png" alt="Donate">
    <h3>Donate & Share</h3>
    <p>Give unused items a second chance by donating them directly to others who need them.</p>
  </div>
  <div class="feature-card">
    <img src="https://img.icons8.com/fluency/96/swap.png" alt="Exchange">
    <h3>Exchange Items</h3>
    <p>Swap what you don’t need for something you do, saving money and resources.</p>
  </div>
  <div class="feature-card">
    <img src="https://img.icons8.com/fluency/96/admin-settings-male.png" alt="Admin Tools">
    <h3>Admin Tools</h3>
    <p>Admins can easily approve, monitor, and manage all listings in the platform.</p>
  </div>
</section>

<!-- Stats -->
<section class="stats">
  <h2>Our Growing Community</h2>
  <div class="stat-boxes">
    <div class="stat">
      <h3>5K+</h3>
      <p>Items Shared</p>
    </div>
    <div class="stat">
      <h3>2K+</h3>
      <p>Active Users</p>
    </div>
    <div class="stat">
      <h3>1K+</h3>
      <p>Successful Exchanges</p>
    </div>
  </div>
</section>

<!-- Footer -->
<footer>
  &copy; 2025 GiveAndTake. All rights reserved.
</footer>

</body>
</html>
