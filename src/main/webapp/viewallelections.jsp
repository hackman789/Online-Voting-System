<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="adminsidenavbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>Election List</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<style>
body {
    background-color: #f8f9fa;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.container {
    max-width: 1200px;
    margin: 100px auto;
    padding: 20px;
}

h2 {
    text-align: center;
    margin-bottom: 30px;
    color: #343a40;
}

.view-toggle {
    display: flex;
    justify-content: flex-end;
    margin-bottom: 20px;
}

.view-toggle .btn {
    margin-left: 10px;
}

.grid-container {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
    gap: 20px;
}

.election-card {
    background-color: white;
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    padding: 20px;
    transition: transform 0.3s ease;
}

.election-card:hover {
    transform: translateY(-5px);
}

.election-header {
    border-bottom: 1px solid #e9ecef;
    padding-bottom: 10px;
    margin-bottom: 15px;
}

.election-code {
    background-color: #007bff;
    color: white;
    border-radius: 5px;
    padding: 2px 8px;
    font-size: 0.9rem;
    display: inline-block;
    margin-bottom: 5px;
}

.election-name {
    font-size: 1.4rem;
    font-weight: bold;
    margin-bottom: 5px;
    color: #343a40;
}

.election-location {
    color: #6c757d;
    font-size: 1rem;
    margin-bottom: 10px;
}

.election-dates {
    display: flex;
    justify-content: space-between;
    color: #495057;
    margin-bottom: 15px;
}

.date-label {
    font-size: 0.8rem;
    font-weight: bold;
    color: #6c757d;
}

.status-active {
    color: green;
    font-weight: bold;
}

.status-inactive {
    color: red;
    font-weight: bold;
}

.election-actions {
    display: flex;
    justify-content: flex-end;
    margin-top: 15px;
}

.election-actions .btn {
    margin-left: 5px;
}

.status-badge {
    border-radius: 20px;
    padding: 5px 12px;
    font-size: 0.85rem;
    font-weight: bold;
    display: inline-block;
}

.status-badge.active {
    background-color: rgba(40, 167, 69, 0.2);
    color: #28a745;
}

.status-badge.inactive {
    background-color: rgba(220, 53, 69, 0.2);
    color: #dc3545;
}

.table-container {
    background-color: white;
    border-radius: 10px;
    padding: 20px;
    box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    margin-bottom: 20px;
    overflow-x: auto;
}

.table-container table {
    width: 100%;
}

.table-view {
    display: none; /* Hidden by default, will be toggled via JavaScript */
}

.grid-view {
    display: block; /* Shown by default */
}
</style>
</head>
<body>

<div class="container">
    <h2>Election List</h2>
    
    <div class="view-toggle">
        <button id="tableViewBtn" class="btn btn-outline-primary">
            <i class="fas fa-list"></i> Table View
        </button>
        <button id="gridViewBtn" class="btn btn-primary">
            <i class="fas fa-th"></i> Grid View
        </button>
    </div>
    
    <!-- Table View -->
    <div id="tableView" class="table-view">
        <div class="table-container">
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th>Code</th>
                        <th>Name</th>
                        <th>State</th>
                        <th>District</th>
                        <th>Start Date</th>
                        <th>End Date</th>
                        <th>Status</th>
                        <th>Delete</th>
                        <th>Edit</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="election" items="${electionList}">
                        <tr>
                            <td>${election.codenum}</td>
                            <td>${election.name}</td>
                            <td>${election.state}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${not empty election.district}">
                                        ${election.district}
                                    </c:when>
                                    <c:otherwise>
                                        <em>State-wide</em>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>${election.startDate}</td>
                            <td>${election.endDate}</td>
                            <td>
                                <span class="${election.active ? 'status-active' : 'status-inactive'}">
                                    ${election.active ? 'Active' : 'Inactive'}
                                </span>
                            </td>
                            <td>
                                <a href="<c:url value='/deleteElection' />?id=${election.codenum}" class="btn btn-danger btn-sm"
                                   onclick="return confirm('Are you sure you want to delete this election?');">
                                    Delete
                                </a>
                            </td>
                            <td>
                                <a href="<c:url value='/editElection' />?id=${election.id}" class="btn btn-warning btn-sm"
                                   onclick="return confirm('Are you sure you want to Edit this election?');">
                                    Edit
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    
    <!-- Grid View -->
    <div id="gridView" class="grid-view">
        <div class="grid-container">
            <c:forEach var="election" items="${electionList}">
                <div class="election-card">
                    <div class="election-header">
                        <div class="election-code">${election.codenum}</div>
                        <div class="election-name">${election.name}</div>
                        <div class="election-location">
                            ${election.state}
                            <c:if test="${not empty election.district}">
                                - District ${election.district}
                            </c:if>
                            <c:if test="${empty election.district}">
                                - State-wide
                            </c:if>
                        </div>
                    </div>
                    
                    <div class="election-dates">
                        <div>
                            <div class="date-label">START DATE</div>
                            <div>${election.startDate}</div>
                        </div>
                        <div>
                            <div class="date-label">END DATE</div>
                            <div>${election.endDate}</div>
                        </div>
                    </div>
                    
                    <div>
                        <span class="status-badge ${election.active ? 'active' : 'inactive'}">
                            ${election.active ? 'Active' : 'Inactive'}
                        </span>
                    </div>
                    
                    <div class="election-actions">
                        <a href="<c:url value='/editElection' />?id=${election.id}" class="btn btn-warning btn-sm"
                           onclick="return confirm('Are you sure you want to Edit this election?');">
                            <i class="fas fa-edit"></i> Edit
                        </a>
                        <a href="<c:url value='/deleteElection' />?id=${election.codenum}" class="btn btn-danger btn-sm"
                           onclick="return confirm('Are you sure you want to delete this election?');">
                            <i class="fas fa-trash"></i> Delete
                        </a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    $(document).ready(function() {
        // Show grid view by default
        $("#gridView").show();
        $("#tableView").hide();
        $("#gridViewBtn").addClass("btn-primary").removeClass("btn-outline-primary");
        $("#tableViewBtn").addClass("btn-outline-primary").removeClass("btn-primary");
        
        // Toggle between views
        $("#gridViewBtn").click(function() {
            $("#gridView").show();
            $("#tableView").hide();
            $("#gridViewBtn").addClass("btn-primary").removeClass("btn-outline-primary");
            $("#tableViewBtn").addClass("btn-outline-primary").removeClass("btn-primary");
        });
        
        $("#tableViewBtn").click(function() {
            $("#tableView").show();
            $("#gridView").hide();
            $("#tableViewBtn").addClass("btn-primary").removeClass("btn-outline-primary");
            $("#gridViewBtn").addClass("btn-outline-primary").removeClass("btn-primary");
        });
    });
</script>
</body>
</html>