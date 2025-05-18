<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>About Us - Online Voting System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>

<!-- Navbar -->
<div class="col-lg-9 col-md-7 col-6">
    <div class="header-bottom-right">
        <!-- main-menu -->
        <div class="main-menu">
            <nav class="main-navigation">
                <ul>
                    <li><a href="/">HOME</a></li>
                    <li><a href="about">ABOUT</a></li>

                    <li class="dropdown">LOGIN
                        <ul class="sub-menu">
                            <li><a href="AdminLogin">ADMIN LOGIN</a></li>
                            <li><a href="userLoginRegister">VOTER LOGIN</a></li>
                            <li><a href="candidateLogin.jsp">CANDIDATE LOGIN</a></li>
                        </ul>
                    </li>

                    
                </ul>
            </nav>
        </div>
        <!--// main-menu -->
    </div>
</div>

<!-- About Section -->
<section class="py-5 bg-light">
    <div class="container">
        <h2 class="text-center mb-4">About Our Project</h2>
        <p class="lead text-center">
            Our <strong>Online Voting System</strong> is a secure, efficient, and user-friendly platform developed as part of the <strong>FFSD Hackathon</strong>. It aims to digitize and simplify the electoral process while ensuring transparency and security.
        </p>
        <p class="text-center">
            From secure logins to real-time results, our system is built with the user in mind. We adopted modern technologies and best practices to ensure a seamless experience for administrators and voters.
        </p>
    </div>
</section>

<!-- Team Section -->
<section class="py-5">
    <div class="container">
        <h3 class="text-center mb-5">Meet the Developers</h3>
        <div class="row text-center">
            <!-- Jeshwwanth -->
            <div class="col-md-4 mb-4">
                <div class="card border-0 shadow p-4">
                    <i class="fas fa-code fa-2x mb-3 text-primary"></i>
                    <h5 class="card-title">Jeshwwanth</h5>
                    <p class="card-text">Backend & Database Developer</p>
                    <p>Designed database schema and implemented secure server-side logic for voting flow.</p>
                </div>
            </div>
            <!-- Rahul Naidu -->
            <div class="col-md-4 mb-4">
                <div class="card border-0 shadow p-4">
                    <i class="fas fa-laptop-code fa-2x mb-3 text-success"></i>
                    <h5 class="card-title">Rahul Naidu</h5>
                    <p class="card-text">Full Stack Developer</p>
                    <p>Integrated frontend with backend logic and optimized performance across modules.</p>
                </div>
            </div>
            <!-- Tejus -->
            <div class="col-md-4 mb-4">
                <div class="card border-0 shadow p-4">
                    <i class="fas fa-paint-brush fa-2x mb-3 text-warning"></i>
                    <h5 class="card-title">Tejus</h5>
                    <p class="card-text">UI/UX Designer</p>
                    <p>Crafted intuitive user interfaces and ensured a responsive experience for all users.</p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Hackathon Highlight -->
<section class="bg-dark text-white text-center py-5">
    <div class="container">
        <h4 class="mb-3">Built for FFSD Hackathon</h4>
        <p class="lead">This system was developed and demonstrated at the FFSD Hackathon, showcasing our skills in rapid prototyping, system design, and teamwork.</p>
        <p>We are proud of this achievement and continue to refine the system for real-world use.</p>
    </div>
</section>

<!-- Footer -->
<footer class="bg-dark text-white py-4">
    <div class="container text-center">
        <small>&copy; 2025 Team Jeshwwanth, Rahul Naidu, Tejus – Online Voting System</small>
    </div>
</footer>

<!-- Bootstrap JS -->
<script src="assets/js/bootstrap.bundle.min.js"></script>
</body>
</html>
