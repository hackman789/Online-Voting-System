<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registered Users</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        :root {
            --primary: #4e73df;
            --secondary: #858796;
            --success: #1cc88a;
            --danger: #e74a3b;
            --warning: #f6c23e;
            --light: #f8f9fc;
            --dark: #5a5c69;
        }

        body {
            background-color: #f8f9fc;
            font-family: 'Nunito', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 
                'Helvetica Neue', Arial, sans-serif;
            font-size: 14px;
        }

        .main-content {
            padding: 1.5rem;
            transition: margin-left 0.3s;
        }

        .card {
            border: none;
            border-radius: 0.35rem;
            box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.15);
            margin-bottom: 1.5rem;
        }

        .card-header {
            background-color: #f8f9fc;
            border-bottom: 1px solid #e3e6f0;
            padding: 1rem 1.25rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .card-header h5 {
            margin-bottom: 0;
            font-weight: 700;
            color: #4e73df;
        }

        .stats-card {
            border-left: 4px solid #4e73df;
            margin-bottom: 1.5rem;
        }

        .stats-card .card-body {
            padding: 1rem;
        }

        .stats-card-title {
            text-transform: uppercase;
            margin-bottom: 0.25rem;
            font-size: 0.7rem;
            font-weight: 700;
            color: #b7b9cc;
        }

        .stats-card-value {
            color: #5a5c69;
            font-weight: 700;
            font-size: 1.5rem;
            margin-bottom: 0;
        }

        .table-container {
            margin: 0;
            overflow-x: auto;
            background-color: #fff;
            border-radius: 0.35rem;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 13px;
            margin-bottom: 0;
        }

        th, td {
            padding: 0.75rem;
            text-align: left;
            border-bottom: 1px solid #e3e6f0;
            vertical-align: middle;
        }

        th {
            background-color: #f8f9fc;
            color: #6e707e;
            font-weight: 700;
            text-transform: uppercase;
            font-size: 0.8rem;
            letter-spacing: 0.05em;
            border-top: none !important;
        }

        tr:last-child td {
            border-bottom: none;
        }

        tr:hover {
            background-color: rgba(78, 115, 223, 0.05);
        }

        .table-striped tbody tr:nth-of-type(odd) {
            background-color: rgba(0, 0, 0, 0.02);
        }

        .badge {
            padding: 0.35em 0.65em;
            font-size: 0.75em;
            font-weight: 700;
            border-radius: 0.35rem;
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }

        .badge-success {
            background-color: #1cc88a;
            color: #fff;
        }

        .badge-danger {
            background-color: #e74a3b;
            color: #fff;
        }

        .btn {
            border-radius: 0.35rem;
            font-size: 0.85rem;
            font-weight: 600;
            padding: 0.375rem 0.75rem;
            transition: all 0.2s;
        }

        .btn-success {
            background-color: #1cc88a;
            border-color: #1cc88a;
        }

        .btn-success:hover {
            background-color: #17a673;
            border-color: #169b6b;
        }

        .btn-danger {
            background-color: #e74a3b;
            border-color: #e74a3b;
        }

        .btn-danger:hover {
            background-color: #e02d1b;
            border-color: #d52a1a;
        }

        .btn-primary {
            background-color: #4e73df;
            border-color: #4e73df;
        }

        .btn-primary:hover {
            background-color: #2e59d9;
            border-color: #2653d4;
        }

        .btn-sm {
            padding: 0.25rem 0.5rem;
            font-size: 0.75rem;
        }

        .action-column {
            white-space: nowrap;
            width: 1%;
        }

        /* Search and filter section */
        .search-filter-container {
            background-color: white;
            border-radius: 0.35rem;
            padding: 1rem;
            margin-bottom: 1rem;
            box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.15);
        }

        .search-input {
            border: 1px solid #d1d3e2;
            border-radius: 0.35rem;
            padding: 0.375rem 0.75rem;
            font-size: 0.85rem;
        }

        .search-input:focus {
            border-color: #bac8f3;
            box-shadow: 0 0 0 0.2rem rgba(78, 115, 223, 0.25);
            outline: 0;
        }

        .form-group label {
            color: #5a5c69;
            font-weight: 600;
            font-size: 0.85rem;
        }

        /* Pagination styling */
        .pagination {
            justify-content: center;
            margin-top: 1.5rem;
        }

        .page-item:first-child .page-link {
            border-top-left-radius: 0.35rem;
            border-bottom-left-radius: 0.35rem;
        }

        .page-item:last-child .page-link {
            border-top-right-radius: 0.35rem;
            border-bottom-right-radius: 0.35rem;
        }

        .page-item.active .page-link {
            background-color: #4e73df;
            border-color: #4e73df;
        }

        .page-link {
            color: #4e73df;
            padding: 0.5rem 0.75rem;
            font-size: 0.85rem;
        }

        .page-link:hover {
            color: #224abe;
            background-color: #eaecf4;
            border-color: #dddfeb;
        }

        /* Responsive design */
        @media (max-width: 1200px) {
            .table {
                min-width: 1000px;
            }
        }

        @media (max-width: 767px) {
            .main-content {
                padding: 1rem;
            }
            
            .card-header {
                flex-direction: column;
                align-items: flex-start;
            }
            
            .card-header .btn {
                margin-top: 0.5rem;
                align-self: flex-start;
            }
            
            .stats-card .card-body {
                padding: 0.75rem;
            }
            
            .stats-card-value {
                font-size: 1.25rem;
            }
            
            .table th, .table td {
                padding: 0.5rem;
            }
        }

        /* Custom scrollbar for better UX */
        ::-webkit-scrollbar {
            width: 10px;
            height: 10px;
        }

        ::-webkit-scrollbar-track {
            background: #f1f1f1;
            border-radius: 10px;
        }

        ::-webkit-scrollbar-thumb {
            background: #c1c3d1;
            border-radius: 10px;
        }

        ::-webkit-scrollbar-thumb:hover {
            background: #a8aab9;
        }
    </style>
</head>

<body>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-3">
                <%@ include file="adminsidenavbar.jsp" %>
            </div>

            <div class="col-md-9 main-content">
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h3 class="h3 mb-0 text-gray-800">Registered Users</h3>
                    <a href="admindashboard" class="btn btn-primary">
                        <i class="fas fa-arrow-left mr-2"></i>Back to Dashboard
                    </a>
                </div>

                <!-- Stats Card -->
                <div class="row">
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card stats-card h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="stats-card-title">Total Users</div>
                                        <div class="stats-card-value">${Userscount}</div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-users fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Search and Filter Section -->
                <div class="search-filter-container mb-4">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group mb-0">
                                <label for="searchInput">Search User:</label>
                                <div class="input-group">
                                    <input type="text" class="form-control search-input" id="searchInput" placeholder="Name, Email, Mobile...">
                                    <div class="input-group-append">
                                        <button class="btn btn-outline-primary" type="button">
                                            <i class="fas fa-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group mb-0">
                                <label for="filterStatus">Status Filter:</label>
                                <select class="form-control search-input" id="filterStatus">
                                    <option value="">All Users</option>
                                    <option value="verified">Verified Users</option>
                                    <option value="not-verified">Not Verified Users</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Users Table Card -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h5 class="m-0 font-weight-bold">User List</h5>
                    </div>
                    <div class="card-body p-0">
                        <div class="table-container">
                            <table class="table table-hover table-striped">
                                <thead>
                                    <tr>
                                        <th>Full Name</th>
                                        <th>Email</th>
                                        <th>Gender</th>
                                        <th>Mobile</th>
                                        <th>Date of Birth</th>
                                        <th>City</th>
                                        <th>State</th>
                                        <th>District</th>
                                        <th>Pincode</th>
                                        <th>Country</th>
                                        <th>Aadhaar</th>
                                        <th>Status</th>
                                        <th class="action-column">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="user" items="${userlist}">
                                        <tr>
                                            <td>${user.fullName}</td>
                                            <td>${user.email}</td>
                                            <td>${user.gender}</td>
                                            <td>${user.mobileNumber}</td>
                                            <td>${user.dateOfBirth}</td>
                                            <td>${user.city}</td>
                                            <td>${user.state}</td>
                                            <td>${user.district}</td>
                                            <td>${user.pincode}</td>
                                            <td>${user.country}</td>
                                            <td>${user.adharnumber}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${user.verified}">
                                                        <span class="badge badge-success">Verified</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge badge-danger">Not Verified</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td class="action-column">
                                                <c:if test="${!user.verified}">
                                                    <a href="verifyuser?id=${user.id}" class="btn btn-success btn-sm" data-toggle="tooltip" title="Verify User">
                                                        <i class="fas fa-check"></i>
                                                    </a>
                                                </c:if>
                                                <a href="delete?registerId=${user.id}" class="btn btn-danger btn-sm ml-1" 
                                                   onclick="return confirm('Are you sure you want to delete this user?');"
                                                   data-toggle="tooltip" title="Delete User">
                                                    <i class="fas fa-trash"></i>
                                                </a>
                                                <button class="btn btn-info btn-sm ml-1" data-toggle="tooltip" title="View Details">
                                                    <i class="fas fa-eye"></i>
                                                </button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <!-- Pagination -->
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li class="page-item disabled">
                            <a class="page-link" href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        $(function () {
            $('[data-toggle="tooltip"]').tooltip();
            
            // Simple client-side search functionality
            $("#searchInput").on("keyup", function() {
                var value = $(this).val().toLowerCase();
                $("table tbody tr").filter(function() {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
            
            // Simple status filter
            $("#filterStatus").on("change", function() {
                var value = $(this).val();
                if (value === "") {
                    $("table tbody tr").show();
                } else if (value === "verified") {
                    $("table tbody tr").hide().filter(function() {
                        return $(this).find("span.badge").hasClass("badge-success");
                    }).show();
                } else if (value === "not-verified") {
                    $("table tbody tr").hide().filter(function() {
                        return $(this).find("span.badge").hasClass("badge-danger");
                    }).show();
                }
            });
        });
    </script>
</body>

</html>