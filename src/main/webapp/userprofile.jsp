<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="usersidebar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <style>
        /* === User Profile Styles === */
        
        /* === Base Styles === */
        :root {
            --primary-color: #3498db;
            --primary-dark: #2980b9;
            --secondary-color: #2ecc71;
            --text-color: #333;
            --light-text: #666;
            --background: #f9f9f9;
            --card-bg: #fff;
            --border-radius: 8px;
            --box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            --transition: all 0.3s ease;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--background);
            color: var(--text-color);
            line-height: 1.6;
        }
        
        /* === Layout === */
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 40px 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        
        /* === Typography === */
        h2 {
            font-size: 2.5rem;
            margin-bottom: 30px;
            color: var(--primary-color);
            text-align: center;
            position: relative;
            padding-bottom: 10px;
        }
        
        h2:after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 3px;
            background-color: var(--secondary-color);
        }
        
        h3 {
            font-size: 1.8rem;
            margin-bottom: 20px;
            color: var(--primary-dark);
        }
        
        p {
            margin-bottom: 15px;
            font-size: 1.1rem;
        }
        
        strong {
            color: var(--primary-dark);
            font-weight: 600;
        }
        
        /* === Profile Card === */
        .profile-card {
            background-color: var(--card-bg);
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            padding: 30px;
            width: 100%;
            max-width: 800px;
            margin: 0 auto;
            transition: var(--transition);
        }
        
        .profile-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
        }
        
        .profile-info {
            background-color: rgba(52, 152, 219, 0.05);
            border-radius: var(--border-radius);
            padding: 20px;
            margin: 20px 0;
            border-left: 4px solid var(--primary-color);
        }
        
        /* === Buttons === */
        .btn {
            display: inline-block;
            background-color: var(--primary-color);
            color: white;
            padding: 12px 25px;
            border-radius: var(--border-radius);
            text-decoration: none;
            font-weight: 600;
            transition: var(--transition);
            margin-right: 10px;
            margin-top: 15px;
            border: none;
            cursor: pointer;
            text-align: center;
        }
        
        .btn:hover {
            background-color: var(--primary-dark);
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        
        .btn:last-child {
            background-color: #e74c3c;
        }
        
        .btn:last-child:hover {
            background-color: #c0392b;
        }
        
        /* === Responsive Design === */
        @media (max-width: 768px) {
            h2 {
                font-size: 2rem;
            }
            
            h3 {
                font-size: 1.5rem;
            }
            
            .profile-card {
                padding: 20px;
            }
            
            .btn {
                width: 100%;
                margin-bottom: 10px;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <h2>User Profile</h2>

    <!-- Check if user is logged in -->
    <c:if test="${not empty user}">
        <div class="profile-card">
            <h3>Welcome, <c:out value="${user.fullName}" /></h3>

            <div class="profile-info">
                <p><strong>Email: </strong><c:out value="${user.email}" /></p>
                <p><strong>Gender: </strong><c:out value="${user.gender}" /></p>
                <p><strong>Date of Birth: </strong><c:out value="${user.dateOfBirth}" /></p>
                <p><strong>Mobile: </strong><c:out value="${user.mobileNumber}" /></p>
                <p><strong>City: </strong><c:out value="${user.city}" /></p>
                <p><strong>State: </strong><c:out value="${user.state}" /></p>
                <p><strong>District: </strong><c:out value="${user.district}" /></p>
                <p><strong>Pincode: </strong><c:out value="${user.pincode}" /></p>
                <p><strong>Country: </strong><c:out value="${user.country}" /></p>
            </div>

            <a href="<c:url value='/userDashboard' />" class="btn">Go to Dashboard</a>
            <a href="<c:url value='/userLogout' />" class="btn">Logout</a>
        </div>
    </c:if>

    <!-- If the user is not logged in, display a message -->
    <c:if test="${empty user}">
        <div class="profile-card">
            <h3>Access Restricted</h3>
            <p>Please log in to view your profile.</p>
            <a href="<c:url value='/userLoginRegister' />" class="btn">Login</a>
        </div>
    </c:if>

</div>

</body>
</html>