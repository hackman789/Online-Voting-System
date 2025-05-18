<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.klef.jfsd.springboot.model.User"%>
<%
User user = (User) session.getAttribute("user");
if (user == null) {
    response.sendRedirect("usersessionexpiry");
    return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- Fonts & Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">

    <!-- Bootstrap (Optional if you already use it elsewhere) -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f4f6f8;
            color: #333;
        }

        .dashboard-container {
            display: flex;
            min-height: 100vh;
        }

        .content {
            flex-grow: 1;
            margin-left: 280px;
            padding: 30px;
        }

        .card {
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.08);
            padding: 20px;
            margin-bottom: 30px;
        }

        .welcome {
            font-size: 1.8rem;
            font-weight: 600;
            margin-bottom: 20px;
        }

        .election-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 20px;
        }

        .election-card {
            border-left: 5px solid;
            border-radius: 10px;
            background: #fff;
            padding: 15px 20px;
            transition: all 0.3s ease;
            box-shadow: 0 4px 8px rgba(0,0,0,0.05);
        }

        .election-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        }

        .election-card.active {
            border-color: #28a745;
        }

        .election-card.inactive {
            border-color: #6c757d;
        }

        .election-card h5 {
            margin-bottom: 10px;
            font-size: 1.25rem;
        }

        .election-card p {
            margin: 0 0 8px 0;
            font-size: 0.95rem;
            color: #555;
        }

        .badge {
            font-size: 0.8rem;
            padding: 6px 10px;
            border-radius: 5px;
            display: inline-block;
            font-weight: 600;
        }

        .badge-success {
            background-color: #28a745;
            color: #fff;
        }

        .badge-secondary {
            background-color: #6c757d;
            color: #fff;
        }
    </style>
</head>
<body>
<div class="dashboard-container">
    <%@ include file="usersidebar.jsp" %>

    <div class="content">
        <!-- Welcome Card -->
        <div class="card">
            <div class="welcome">Welcome back, ${user.fullName}!</div>
            <p>Here are all the elections available for you to view and participate in.</p>
        </div>

        <!-- Elections List -->
        <div class="card">
            <h4 class="mb-4">All Elections</h4>
            <div class="election-grid">
                <c:forEach var="election" items="${electionList}">
                    <div class="election-card ${election.active ? 'active' : 'inactive'}">
                        <h5>${election.name}</h5>
                        <p><strong>Code:</strong> ${election.codenum}</p>
                        <p><strong>State:</strong> ${election.state}</p>
                        <p><strong>District:</strong>
                            <c:choose>
                                <c:when test="${not empty election.district}">${election.district}</c:when>
                                <c:otherwise><em>State-wide</em></c:otherwise>
                            </c:choose>
                        </p>
                        <p><strong>Start Date:</strong> ${election.startDate}</p>
                        <p><strong>End Date:</strong> ${election.endDate}</p>
                        <span class="badge ${election.active ? 'badge-success' : 'badge-secondary'}">
                            ${election.active ? 'Active' : 'Inactive'}
                        </span>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
</body>
</html>
