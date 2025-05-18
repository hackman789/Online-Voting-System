<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-color: #4361ee;
            --primary-light: #4361ee15;
            --secondary-color: #3bc4a2;
            --sidebar-bg: #ffffff;
            --text-primary: #2c3e50;
            --text-secondary: #64748b;
            --sidebar-width: 280px;
            --card-shadow: 0 10px 30px rgba(37, 117, 252, 0.1);
            --transition-speed: 0.3s;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: #f8fafc;
            display: flex;
            min-height: 100vh;
        }

        /* Content area to push content beside sidebar */
        .content-area {
            margin-left: var(--sidebar-width);
            width: calc(100% - var(--sidebar-width));
            padding: 30px;
            transition: margin-left var(--transition-speed) ease;
        }

        /* Sidebar Styles */
        .sidebar {
            width: var(--sidebar-width);
            background-color: var(--sidebar-bg);
            position: fixed;
            top: 0;
            left: 0;
            height: 100%;
            padding: 20px 0;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.05);
            transition: width var(--transition-speed) ease, transform var(--transition-speed) ease;
            z-index: 1000;
            overflow-y: auto;
        }

        .sidebar-logo {
            display: flex;
            align-items: center;
            padding: 0 20px 20px;
            margin-bottom: 20px;
            border-bottom: 1px solid rgba(0, 0, 0, 0.05);
        }

        .sidebar-logo i {
            font-size: 1.8rem;
            color: var(--primary-color);
            margin-right: 12px;
        }

        .sidebar-title {
            font-size: 1.4rem;
            font-weight: 700;
            color: var(--text-primary);
            letter-spacing: -0.5px;
        }

        .sidebar h2 {
            color: var(--text-secondary);
            font-size: 0.85rem;
            padding: 0 20px;
            margin: 30px 0 15px;
            text-transform: uppercase;
            letter-spacing: 1px;
            font-weight: 600;
        }

        .sidebar-menu {
            list-style: none;
            padding: 0 10px;
        }

        .sidebar-menu li {
            margin: 6px 0;
        }

        .sidebar-menu a {
            display: flex;
            align-items: center;
            text-decoration: none;
            color: var(--text-secondary);
            padding: 12px 16px;
            font-size: 0.95rem;
            border-radius: 8px;
            transition: all var(--transition-speed);
            font-weight: 500;
        }

        .sidebar-menu a:hover {
            background-color: var(--primary-light);
            color: var(--primary-color);
            transform: translateX(3px);
        }

        .sidebar-menu a.active {
            background-color: var(--primary-color);
            color: #fff;
            box-shadow: 0 5px 15px rgba(67, 97, 238, 0.3);
        }

        .sidebar-menu a i {
            margin-right: 14px;
            font-size: 1.1rem;
            width: 20px;
            text-align: center;
        }

        .sidebar-menu a.text-danger {
            color: #e53e3e;
        }

        .sidebar-menu a.text-danger:hover {
            background-color: #fff5f5;
            color: #c53030;
        }

        /* Toggle button for mobile */
        .sidebar-toggle {
            position: fixed;
            top: 20px;
            left: 20px;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: var(--primary-color);
            color: white;
            display: none;
            justify-content: center;
            align-items: center;
            cursor: pointer;
            z-index: 1001;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        /* Mobile Responsiveness */
        @media (max-width: 768px) {
            .sidebar {
                transform: translateX(-100%);
                width: var(--sidebar-width);
            }

            .sidebar.open {
                transform: translateX(0);
            }

            .content-area {
                margin-left: 0;
                width: 100%;
            }

            .sidebar-toggle {
                display: flex;
            }
        }

        /* Additional nice-to-have styles */
        .sidebar-footer {
            position: absolute;
            bottom: 0;
            width: 100%;
            padding: 15px 20px;
            border-top: 1px solid rgba(0, 0, 0, 0.05);
            font-size: 0.8rem;
            color: var(--text-secondary);
            text-align: center;
        }
        
        /* Animation for active menu item */
        .sidebar-menu a::before {
            content: '';
            position: absolute;
            left: 0;
            height: 0;
            width: 4px;
            background-color: var(--primary-color);
            border-radius: 0 3px 3px 0;
            transition: height 0.3s ease;
        }
        
        .sidebar-menu a.active::before {
            height: 65%;
        }
        
        /* Badge styles for notifications */
        .badge {
            background-color: var(--secondary-color);
            color: white;
            border-radius: 10px;
            padding: 2px 8px;
            font-size: 0.75rem;
            margin-left: auto;
        }
    </style>
</head>
<body>
    <!-- Mobile sidebar toggle button -->
    <div class="sidebar-toggle" id="sidebarToggle">
        <i class="fas fa-bars"></i>
    </div>

    <!-- Sidebar -->
    <div class="sidebar" id="sidebar">
        <div class="sidebar-logo">
            <i class="fas fa-cogs"></i>
            <span class="sidebar-title">Admin Panel</span>
        </div>
        <h2>Navigation</h2>
        <ul class="sidebar-menu">
            <li><a href="AdminDashboard" class="active"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
            <li><a href="viewallusers"><i class="fas fa-users"></i> Users <span class="badge">12</span></a></li>
            <li><a href="AddElection"><i class="fas fa-vote-yea"></i> Add Election</a></li>
            <li><a href="viewallelections"><i class="fas fa-poll"></i> View Elections</a></li>
            <li><a href="AddCandidate"><i class="fas fa-user-plus"></i> Add Candidate</a></li>
            <li><a href="viewcandidatesfilter"><i class="fas fa-user-tie"></i> View Candidates</a></li>
             <li><a href="viewcandidatevotefilter"><i class="fas fa-user-tie"></i> View Candidates votes</a></li>
            <li><a href="#"><i class="fas fa-cogs"></i> Settings</a></li>
            <li><a href="adminlogout" class="text-danger"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
        </ul>
        
        <div class="sidebar-footer">
            Admin Panel v1.2 © 2025
        </div>
    </div>

    <!-- Content Area (placeholder) -->
    

    <script>
        // Toggle sidebar on mobile
        document.getElementById('sidebarToggle').addEventListener('click', function() {
            document.getElementById('sidebar').classList.toggle('open');
        });
        
        // Make current page link active
        document.addEventListener('DOMContentLoaded', function() {
            const currentPath = window.location.pathname.split('/').pop();
            const menuLinks = document.querySelectorAll('.sidebar-menu a');
            
            menuLinks.forEach(link => {
                const href = link.getAttribute('href');
                if (href === currentPath) {
                    link.classList.add('active');
                } else {
                    link.classList.remove('active');
                }
            });
        });
    </script>
</body>
</html>