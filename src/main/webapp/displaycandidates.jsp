<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Candidate List</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(135deg, #f5f7fa 0%, #e4e8f0 100%);
    margin: 0;
    padding: 0;
    min-height: 100vh;
}

.container {
    max-width: 1200px;
    margin: 60px auto;
    padding: 30px;
}

h2 {
    text-align: center;
    color: #333;
    margin-bottom: 30px;
    font-weight: 600;
    position: relative;
}

h2:after {
    content: '';
    display: block;
    width: 100px;
    height: 3px;
    background: #007bff;
    margin: 15px auto 0;
    border-radius: 2px;
}

.view-toggle {
    display: flex;
    justify-content: flex-end;
    margin-bottom: 20px;
}

.view-toggle .btn {
    margin-left: 10px;
    border-radius: 20px;
    padding: 6px 15px;
    font-size: 14px;
    transition: all 0.3s ease;
}

/* Grid View Styles */
.grid-container {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
    gap: 25px;
}

.candidate-card {
    background: white;
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    display: flex;
    flex-direction: column;
}

.candidate-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
}

.candidate-header {
    padding: 20px;
    text-align: center;
    background: #f8f9fa;
    border-bottom: 1px solid #eaeaea;
}

.party-image-container {
    width: 80px;
    height: 80px;
    margin: 0 auto 15px;
    border-radius: 50%;
    overflow: hidden;
    display: flex;
    align-items: center;
    justify-content: center;
    background: white;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    border: 3px solid #fff;
}

.party-image {
    width: 100%;
    height: 100%;
    object-fit: contain;
}

.no-image {
    width: 100%;
    height: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    background: #e9ecef;
    color: #6c757d;
    font-size: 12px;
    text-align: center;
    border-radius: 50%;
}

.candidate-name {
    font-size: 1.2rem;
    font-weight: 600;
    color: #343a40;
    margin-bottom: 5px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}

.candidate-details {
    padding: 20px;
    flex-grow: 1;
}

.detail-item {
    margin-bottom: 12px;
    display: flex;
    align-items: center;
}

.detail-icon {
    color: #007bff;
    margin-right: 10px;
    width: 16px;
    text-align: center;
}

.detail-label {
    font-size: 0.9rem;
    color: #6c757d;
    margin-right: 8px;
}

.detail-value {
    font-weight: 500;
    color: #343a40;
    flex-grow: 1;
    text-align: right;
}

.candidate-actions {
    padding: 15px 20px;
    border-top: 1px solid #eaeaea;
    text-align: center;
}

.btn-delete {
    border-radius: 50px;
    padding: 8px 20px;
    font-size: 0.9rem;
    font-weight: 500;
    transition: all 0.3s ease;
}

.btn-delete:hover {
    transform: translateY(-2px);
}

/* Table View Styles */
.table-container {
    background: white;
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
    margin-bottom: 20px;
}

table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0;
}

th, td {
    padding: 15px;
    text-align: center;
    vertical-align: middle;
}

th {
    background-color: #007bff;
    color: white;
    font-weight: 500;
    position: sticky;
    top: 0;
}

tr:last-child td {
    border-bottom: none;
}

td {
    border-bottom: 1px solid #eaeaea;
}

.table-party-image {
    width: 40px;
    height: 40px;
    object-fit: contain;
}

.no-data {
    text-align: center;
    padding: 40px;
    color: #6c757d;
    background: white;
    border-radius: 12px;
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
}

.no-data i {
    font-size: 48px;
    color: #dee2e6;
    margin-bottom: 15px;
    display: block;
}

/* View toggle control */
.table-view {
    display: none; /* Hidden by default */
}

.grid-view {
    display: block; /* Shown by default */
}

/* Responsive adjustments */
@media (max-width: 768px) {
    .container {
        padding: 15px;
        margin: 30px auto;
    }
    
    .grid-container {
        grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
        gap: 15px;
    }
    
    .table-responsive {
        overflow-x: auto;
    }
}
</style>
</head>
<body>

<%@ include file="adminsidenavbar.jsp" %>

<div class="container">
    <h2>Candidate List</h2>
    
    <div class="view-toggle">
        <button id="tableViewBtn" class="btn btn-outline-primary">
            <i class="fas fa-list"></i> Table View
        </button>
        <button id="gridViewBtn" class="btn btn-primary">
            <i class="fas fa-th"></i> Grid View
        </button>
    </div>
    
    <c:choose>
        <c:when test="${not empty candidates}">
            <!-- Table View -->
            <div id="tableView" class="table-view">
                <div class="table-container">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>State</th>
                                    <th>District</th>
                                    <th>Party</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="c" items="${candidates}">
                                    <tr>
                                        <td>${c.candidateName}</td>
                                        <td>${c.state}</td>
                                        <td>${c.district}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${not empty c.image}">
                                                    <img src="${pageContext.request.contextPath}/candidate/displaypartyimage/${c.candidateId}"
                                                        alt="Party Image" class="table-party-image" />
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge bg-light text-dark">No Image</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <a href="<c:url value='/deleteCandidate' />?id=${c.candidateId}"
                                                class="btn btn-danger btn-sm"
                                                onclick="return confirm('Are you sure you want to delete this Candidate?');">
                                                <i class="fas fa-trash-alt"></i> Delete
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            
            <!-- Grid View -->
            <div id="gridView" class="grid-view">
                <div class="grid-container">
                    <c:forEach var="c" items="${candidates}">
                        <div class="candidate-card">
                            <div class="candidate-header">
                                <div class="party-image-container">
                                    <c:choose>
                                        <c:when test="${not empty c.image}">
                                            <img src="${pageContext.request.contextPath}/candidate/displaypartyimage/${c.candidateId}"
                                                alt="Party Image" class="party-image" />
                                        </c:when>
                                        <c:otherwise>
                                            <div class="no-image">No Image</div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="candidate-name">${c.candidateName}</div>
                            </div>
                            <div class="candidate-details">
                                <div class="detail-item">
                                    <div class="detail-icon">
                                        <i class="fas fa-map-marker-alt"></i>
                                    </div>
                                    <div class="detail-label">State:</div>
                                    <div class="detail-value">${c.state}</div>
                                </div>
                                <div class="detail-item">
                                    <div class="detail-icon">
                                        <i class="fas fa-building"></i>
                                    </div>
                                    <div class="detail-label">District:</div>
                                    <div class="detail-value">${c.district}</div>
                                </div>
                            </div>
                            <div class="candidate-actions">
                                <a href="<c:url value='/deleteCandidate' />?id=${c.candidateId}"
                                    class="btn btn-danger btn-delete"
                                    onclick="return confirm('Are you sure you want to delete this Candidate?');">
                                    <i class="fas fa-trash-alt"></i> Delete Candidate
                                </a>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <div class="no-data">
                <i class="fas fa-user-slash"></i>
                <p>No candidates found for the selected filters.</p>
            </div>
        </c:otherwise>
    </c:choose>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
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