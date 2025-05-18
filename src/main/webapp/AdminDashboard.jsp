<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap" rel="stylesheet">
    
    <!-- FontAwesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <style>
        /* CSS for the sidebar and dashboard layout */
        :root {
            --primary-color: #4a6cf7;
            --secondary-color: #16c79a;
            --background-color: #f4f7ff;
            --text-primary: #2c3e50;
            --text-secondary: #6c757d;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: var(--background-color);
            display: flex;
            min-height: 100vh;
        }

        .dashboard-content {
            margin-left: 280px;
            width: calc(100% - 280px);
            padding: 30px;
        }

        .dashboard-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }

        .dashboard-header h1 {
            color: var(--primary-color);
            font-weight: 700;
        }

        .dashboard-stats {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            margin-bottom: 30px;
        }

        .stat-card {
            background: white;
            border-radius: 12px;
            padding: 20px;
            display: flex;
            align-items: center;
            box-shadow: 0 10px 30px rgba(37, 117, 252, 0.1);
        }

        .stat-card i {
            font-size: 2.5rem;
            margin-right: 20px;
            color: var(--primary-color);
        }

        .stat-card-content h3 {
            color: var(--text-secondary);
            margin-bottom: 5px;
        }

        .stat-card-content p {
            font-weight: 700;
            color: var(--primary-color);
        }

        /* Mobile Responsiveness */
        @media (max-width: 768px) {
            .sidebar {
                width: 0;
                overflow: hidden;
            }

            .dashboard-content {
                margin-left: 0;
                width: 100%;
            }

            .dashboard-stats {
                grid-template-columns: repeat(2, 1fr);
            }
        }
    </style>
</head>
<body>

    <%@ include file="adminsidenavbar.jsp" %>

    <!-- Dashboard Content -->
    <div class="dashboard-content">
        <div class="dashboard-header">
            <h1>Admin Dashboard</h1>
            <div>
                <span>Welcome, Admin</span>
            </div>
        </div>

        <!-- Dashboard Stats -->
        <div class="dashboard-stats">
            <div class="stat-card">
                <i class="fas fa-user-circle"></i>
                <div class="stat-card-content">
                    <h3>Total Users</h3>
                    <p><c:out value="${totalUsers}" /></p>
                </div>
            </div>

            <div class="stat-card">
                <i class="fas fa-cogs"></i>
                <div class="stat-card-content">
                    <h3>Total Elections</h3>
                    <p><c:out value="${totalElections}" /></p>
                </div>
            </div>

            <div class="stat-card">
                <i class="fas fa-users-cog"></i>
                <div class="stat-card-content">
                    <h3>Total Candidates</h3>
                    <p><c:out value="${totalCandidates}" /></p>
                </div>
            </div>

            <div class="stat-card">
                <i class="fas fa-vote-yea"></i>
                <div class="stat-card-content">
                    <h3>Total Votes</h3>
                    <p><c:out value="${totalVotes}" /></p>
                </div>
            </div>
        </div>

        <!-- Recent Election Details -->
        <div class="card">
            <div class="card-header bg-primary text-white">
                <i class="fas fa-table"></i> Recent Election Records
            </div>
            <div class="table-responsive">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Election Name</th>
                            <th>Start Date</th>
                            <th>End Date</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="election" items="${elections}">
                            <tr>
                                <td><c:out value="${election.name}" /></td>
                                <td><c:out value="${election.startDate}" /></td>
                                <td><c:out value="${election.endDate}" /></td>
                                <td>
                                    <a href="viewElectionDetails?id=${election.id}" class="btn btn-info">View</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</body>
</html>
