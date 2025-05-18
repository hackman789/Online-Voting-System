<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="usersidebar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard - Ongoing Elections</title>
    <style>
        /* === CSS Variables === */
        :root {
            --primary-color: #3498db;
            --primary-dark: #2980b9;
            --secondary-color: #2ecc71;
            --secondary-dark: #27ae60;
            --background: #f0f2f5;
            --card-bg: #fff;
            --text-primary: #34495e;
            --text-secondary: #555;
            --text-light: #777;
            --text-danger: #e74c3c;
            --border-radius: 12px;
            --box-shadow: 0 12px 20px rgba(0, 0, 0, 0.1);
            --transition: all 0.3s ease;
        }

        /* === Reset and Base Styles === */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--background);
            color: var(--text-primary);
            line-height: 1.6;
            padding-bottom: 50px;
        }

        /* === Layout === */
        .container {
            width: 85%;
            margin: 0 auto;
            padding: 40px;
            position: relative;
        }

        /* === Typography === */
        .title {
            text-align: center;
            font-size: 2.5rem;
            color: var(--primary-dark);
            margin-bottom: 40px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
            position: relative;
            padding-bottom: 15px;
        }

        .title::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 4px;
            background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
            border-radius: 2px;
        }

        /* === Election Cards === */
        .election-list {
            display: flex;
            flex-wrap: wrap;
            gap: 30px;
            justify-content: center;
            perspective: 1000px;
        }

        .election-card {
            background-color: var(--card-bg);
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            width: 300px;
            padding: 28px;
            transition: var(--transition);
            border: 1px solid rgba(0, 0, 0, 0.08);
            position: relative;
            overflow: hidden;
            transform-style: preserve-3d;
        }

        .election-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 5px;
            background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
        }

        .election-card:hover {
            transform: translateY(-15px) rotateX(5deg);
            box-shadow: 0 20px 30px rgba(0, 0, 0, 0.15);
        }

        .election-name {
            font-size: 1.6rem;
            color: var(--primary-dark);
            margin-bottom: 20px;
            font-weight: 600;
            text-align: center;
            padding-bottom: 12px;
            border-bottom: 1px solid rgba(0, 0, 0, 0.08);
        }

        .election-details {
            margin-bottom: 15px;
        }

        .election-details p {
            margin-bottom: 12px;
            color: var(--text-secondary);
            font-size: 1.05rem;
            display: flex;
            align-items: center;
        }

        .election-details strong {
            font-weight: 600;
            color: var(--text-primary);
            min-width: 100px;
            display: inline-block;
        }

        /* === Buttons === */
        .vote-btn {
            display: block;
            padding: 14px 25px;
            background-color: var(--secondary-color);
            color: white;
            text-align: center;
            text-decoration: none;
            border-radius: 8px;
            font-weight: 600;
            margin-top: 20px;
            transition: var(--transition);
            letter-spacing: 0.5px;
            box-shadow: 0 4px 10px rgba(46, 204, 113, 0.3);
            border: none;
            cursor: pointer;
            position: relative;
            overflow: hidden;
            z-index: 1;
        }

        .vote-btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(to right, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: var(--transition);
            z-index: -1;
        }

        .vote-btn:hover {
            background-color: var(--secondary-dark);
            transform: translateY(-3px);
            box-shadow: 0 6px 15px rgba(46, 204, 113, 0.4);
        }

        .vote-btn:hover::before {
            left: 100%;
        }

        /* === Empty State === */
        .no-election-msg {
            text-align: center;
            font-size: 1.4rem;
            color: var(--text-danger);
            margin-top: 40px;
            font-weight: 600;
            padding: 30px;
            background-color: var(--card-bg);
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            max-width: 600px;
            margin: 40px auto;
            border: 1px solid rgba(231, 76, 60, 0.2);
        }

        .no-election-msg::before {
            content: "📢";
            display: block;
            font-size: 3rem;
            margin-bottom: 15px;
        }

        /* === Responsive Design === */
        @media (max-width: 768px) {
            .container {
                width: 95%;
                padding: 20px;
            }

            .election-card {
                width: 100%;
                margin-bottom: 20px;
            }

            .title {
                font-size: 1.8rem;
                margin-bottom: 30px;
            }
            
            .election-name {
                font-size: 1.4rem;
            }
        }

        /* === Animation === */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .election-card {
            animation: fadeIn 0.5s ease-out forwards;
        }

        .election-list .election-card:nth-child(2) {
            animation-delay: 0.1s;
        }

        .election-list .election-card:nth-child(3) {
            animation-delay: 0.2s;
        }

        .election-list .election-card:nth-child(4) {
            animation-delay: 0.3s;
        }

        .election-list .election-card:nth-child(5) {
            animation-delay: 0.4s;
        }

        /* === Additional Details === */
        .status-badge {
            position: absolute;
            top: 15px;
            right: 15px;
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 600;
            background-color: rgba(46, 204, 113, 0.15);
            color: var(--secondary-dark);
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="title">Ongoing Elections in Your State</h2>

        <!-- Check if there are elections -->
        <c:if test="${not empty activeElections}">
            <div class="election-list">
                <c:forEach var="election" items="${activeElections}">
                    <div class="election-card">
                        <span class="status-badge">Active</span>
                        <h3 class="election-name">${election.name}</h3>
                        <div class="election-details">
                            <p><strong>Start Date:</strong> ${election.startDate}</p>
                            <p><strong>End Date:</strong> ${election.endDate}</p>
                            <p><strong>State:</strong> ${election.state}</p>
                            <p><strong>District:</strong> ${election.district}</p>
                        </div>
                        <!-- If the election is active, show the vote button -->
                        <c:if test="${election.active}">
                            <a href="/vote/${election.codenum}" class="vote-btn">Vote Now</a>
                        </c:if>
                    </div>
                </c:forEach>
            </div>
        </c:if>

        <!-- If there are no elections or the list is empty, show this message -->
        <c:if test="${empty activeElections}">
            <p class="no-election-msg">No ongoing elections in your state.</p>
        </c:if>
    </div>
</body>
</html>