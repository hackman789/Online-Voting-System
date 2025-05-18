<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vote for Candidate</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* === CSS Variables === */
        :root {
            --primary-color: #3498db;
            --primary-dark: #2980b9;
            --secondary-color: #2ecc71;
            --secondary-dark: #27ae60;
            --background: #f4f7fb;
            --card-bg: #fff;
            --text-primary: #2c3e50;
            --text-secondary: #555;
            --text-light: #777;
            --border-radius: 12px;
            --box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            --header-gradient: linear-gradient(135deg, #3498db, #2ecc71);
            --transition: all 0.3s ease;
        }

        /* === Base Styles === */
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
        }

        /* === Layout === */
        .container {
            max-width: 1100px;
            margin: 60px auto;
            padding: 30px;
            background: var(--card-bg);
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            position: relative;
            overflow: hidden;
        }

        .container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 5px;
            background: var(--header-gradient);
        }

        /* === Typography === */
        h2 {
            text-align: center;
            color: var(--primary-dark);
            margin-bottom: 30px;
            font-weight: 700;
            font-size: 2.2rem;
            position: relative;
            padding-bottom: 15px;
        }

        h2::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 4px;
            background: var(--header-gradient);
            border-radius: 2px;
        }

        /* === Table Styling === */
        .table {
            border-collapse: separate;
            border-spacing: 0;
            width: 100%;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            margin-bottom: 30px;
        }

        .table thead {
            background: linear-gradient(to right, #3498db, #2980b9);
            color: white;
        }

        .table th {
            padding: 15px;
            text-align: left;
            font-weight: 600;
            font-size: 1.05rem;
            letter-spacing: 0.5px;
            border: none;
            vertical-align: middle;
        }

        .table td {
            padding: 15px;
            border-top: 1px solid rgba(0, 0, 0, 0.05);
            vertical-align: middle;
            transition: var(--transition);
        }

        .table tbody tr {
            transition: var(--transition);
        }

        .table tbody tr:hover {
            background-color: rgba(52, 152, 219, 0.05);
            transform: translateY(-2px);
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.03);
        }

        /* === Party Image === */
        .party-image {
            width: 60px;
            height: 60px;
            object-fit: contain;
            border-radius: 50%;
            border: 3px solid rgba(52, 152, 219, 0.2);
            padding: 3px;
            background: white;
            transition: var(--transition);
            display: block;
            margin: 0 auto;
        }

        tr:hover .party-image {
            transform: scale(1.1);
            border-color: var(--primary-color);
        }

        /* === Radio Buttons === */
        input[type="radio"] {
            cursor: pointer;
            width: 22px;
            height: 22px;
            position: relative;
            margin: 0 auto;
            display: block;
            accent-color: var(--secondary-color);
        }

        /* === Vote Button === */
        .btn-vote {
            background: linear-gradient(135deg, #2ecc71, #27ae60);
            color: white;
            border: none;
            padding: 12px 28px;
            border-radius: 30px;
            font-weight: 600;
            font-size: 1.1rem;
            letter-spacing: 0.5px;
            box-shadow: 0 5px 15px rgba(46, 204, 113, 0.3);
            transition: var(--transition);
            display: inline-flex;
            align-items: center;
            gap: 10px;
        }

        .btn-vote i {
            font-size: 1.2rem;
        }

        .btn-vote:hover {
            background: linear-gradient(135deg, #27ae60, #219652);
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(46, 204, 113, 0.4);
        }

        .btn-vote:active {
            transform: translateY(0);
        }

        /* === Alerts === */
        .alert {
            border-radius: 8px;
            padding: 15px 20px;
            margin-bottom: 25px;
            position: relative;
            border: none;
            font-weight: 500;
        }

        .alert-success {
            background-color: rgba(46, 204, 113, 0.15);
            color: #27ae60;
            border-left: 4px solid #2ecc71;
        }

        .alert-danger {
            background-color: rgba(231, 76, 60, 0.15);
            color: #c0392b;
            border-left: 4px solid #e74c3c;
        }

        .alert-warning {
            background-color: rgba(241, 196, 15, 0.15);
            color: #d35400;
            border-left: 4px solid #f39c12;
        }

        /* === Responsive Design === */
        @media (max-width: 992px) {
            .container {
                margin: 30px 20px;
                padding: 25px;
            }
            
            h2 {
                font-size: 1.8rem;
            }
            
            .table thead {
                display: none;
            }
            
            .table, .table tbody, .table tr, .table td {
                display: block;
                width: 100%;
            }
            
            .table tr {
                margin-bottom: 20px;
                border: 1px solid rgba(0, 0, 0, 0.1);
                border-radius: 8px;
                overflow: hidden;
                background: white;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            }
            
            .table td {
                text-align: right;
                padding: 12px 15px;
                position: relative;
                border-bottom: 1px solid rgba(0, 0, 0, 0.05);
            }
            
            .table td:last-child {
                border-bottom: none;
            }
            
            .table td::before {
                content: attr(data-label);
                position: absolute;
                left: 15px;
                top: 50%;
                transform: translateY(-50%);
                font-weight: 600;
                color: var(--primary-dark);
            }
            
            .party-image {
                margin: 0 0 0 auto;
            }
            
            input[type="radio"] {
                margin: 0 0 0 auto;
            }
        }

        @media (max-width: 576px) {
            .container {
                margin: 20px 10px;
                padding: 20px 15px;
            }
            
            h2 {
                font-size: 1.5rem;
            }
            
            .btn-vote {
                width: 100%;
                justify-content: center;
            }
        }

        /* === Additional Enhancements === */
        .vote-info {
            background-color: rgba(52, 152, 219, 0.1);
            border-radius: 8px;
            padding: 15px 20px;
            margin-bottom: 25px;
            border-left: 4px solid var(--primary-color);
        }

        .vote-info p {
            margin-bottom: 0;
            color: var(--text-secondary);
        }

        .candidate-name {
            font-weight: 600;
            color: var(--text-primary);
        }

        .party-name {
            color: var(--primary-dark);
            font-weight: 500;
        }

        /* Animation */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .container {
            animation: fadeIn 0.5s ease-out forwards;
        }
    </style>
</head>
<body>

<%@ include file="usersidebar.jsp" %>

<div class="container">
    <h2>Select a Candidate to Vote</h2>

    <!-- Success and Error Flash Messages -->
    <c:if test="${not empty success}">
        <div class="alert alert-success text-center">
            <i class="fas fa-check-circle me-2"></i> ${success}
        </div>
    </c:if>
    <c:if test="${not empty error}">
        <div class="alert alert-danger text-center">
            <i class="fas fa-exclamation-circle me-2"></i> ${error}
        </div>
    </c:if>

    <!-- Voting Information -->
    <div class="vote-info">
        <p><i class="fas fa-info-circle me-2"></i> Please select a candidate to cast your vote. Your vote is confidential and secure.</p>
    </div>

    <c:choose>
        <c:when test="${not empty candidates}">
            <form action="${pageContext.request.contextPath}/vote/cast" method="post">
                <table class="table">
                    <thead>
                        <tr>
                            <th width="10%">Select</th>
                            <th width="20%">Candidate</th>
                            <th width="20%">Party</th>
                            <th width="15%">State</th>
                            <th width="15%">District</th>
                            <th width="20%">Party Symbol</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="c" items="${candidates}">
                            <tr>
                                <td data-label="Select">
                                    <input type="radio" name="candidateId" value="${c.candidateId}" required />
                                </td>
                                <td data-label="Candidate" class="candidate-name">${c.candidateName}</td>
                                <td data-label="Party" class="party-name">${c.party}</td>
                                <td data-label="State">${c.state}</td>
                                <td data-label="District">${c.district}</td>
                                <td data-label="Party Symbol">
                                    <c:choose>
                                        <c:when test="${not empty c.image}">
                                            <img src="${pageContext.request.contextPath}/candidate/displaypartyimage/${c.candidateId}" 
                                                 alt="${c.party} Symbol" class="party-image" />
                                        </c:when>
                                        <c:otherwise>
                                            <div class="text-muted text-center">No Symbol</div>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div class="text-center">
                    <input type="hidden" name="codenum" value="${codenum}" />
                    <button type="submit" class="btn btn-vote">
                        <i class="fas fa-vote-yea"></i> Cast Your Vote
                    </button>
                </div>
            </form>
        </c:when>
        <c:otherwise>
            <div class="alert alert-warning text-center">
                <i class="fas fa-exclamation-triangle me-2"></i> No candidates available for your district/state.
            </div>
        </c:otherwise>
    </c:choose>
</div>

<script>
    // Add confirmation before submitting vote
    document.querySelector('form').addEventListener('submit', function(e) {
        if (!confirm('Are you sure you want to cast your vote? This action cannot be undone.')) {
            e.preventDefault();
        }
    });
</script>

</body>
</html>