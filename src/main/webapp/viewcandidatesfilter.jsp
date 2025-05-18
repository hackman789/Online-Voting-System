<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="adminsidenavbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Filter Candidates</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #4e73df;
            --primary-light: #6f8df7;
            --primary-dark: #2e59d9;
            --secondary: #858796;
            --success: #1cc88a;
            --info: #36b9cc;
            --warning: #f6c23e;
            --danger: #e74a3b;
            --light: #f8f9fc;
            --dark: #5a5c69;
            --white: #fff;
            --gray: #6c757d;
            --border-radius: 0.5rem;
        }
        
        body {
            font-family: 'Poppins', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 
                'Helvetica Neue', Arial, sans-serif;
            background: linear-gradient(135deg, var(--light) 0%, #e6e9f0 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 1rem;
            margin: 0;
        }
        
        .main-wrapper {
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
        }
        
        .sidebar-column {
            flex: 0 0 250px;
            /* Sidebar will be included by your JSP include */
        }
        
        .content-column {
            flex: 1;
            padding: 1rem;
            display: flex;
            justify-content: center;
            align-items: flex-start;
        }
        
        .filter-container {
            width: 100%;
            max-width: 550px;
            background: var(--white);
            border-radius: var(--border-radius);
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
            padding: 2.5rem;
            position: relative;
            overflow: hidden;
            margin: 2rem auto;
        }
        
        .filter-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 5px;
            background: linear-gradient(to right, var(--primary), var(--info));
        }
        
        .page-title {
            text-align: center;
            margin-bottom: 2rem;
            color: var(--dark);
            font-weight: 600;
            font-size: 1.8rem;
            position: relative;
            padding-bottom: 0.75rem;
        }
        
        .page-title::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 50px;
            height: 3px;
            background: var(--primary);
            border-radius: 2px;
        }
        
        .form-subtitle {
            text-align: center;
            color: var(--gray);
            margin-bottom: 2rem;
            font-size: 0.95rem;
            font-weight: 400;
        }
        
        .form-group {
            margin-bottom: 1.5rem;
        }
        
        label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: var(--dark);
            font-size: 0.9rem;
        }
        
        .input-icon-group {
            position: relative;
        }
        
        .input-icon {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: var(--gray);
        }
        
        .input-with-icon {
            padding-left: 2.8rem !important;
        }
        
        select, input[type="text"] {
            width: 100%;
            padding: 0.75rem 1rem;
            border-radius: var(--border-radius);
            border: 1px solid #d1d3e2;
            background-color: var(--light);
            color: var(--dark);
            font-size: 0.95rem;
            transition: all 0.2s ease-in-out;
            box-sizing: border-box;
        }
        
        select:focus, input[type="text"]:focus {
            border-color: var(--primary-light);
            box-shadow: 0 0 0 0.2rem rgba(78, 115, 223, 0.25);
            outline: none;
        }
        
        select {
            appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 24 24' fill='none' stroke='%236c757d' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpath d='M6 9l6 6 6-6'/%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 1rem center;
            background-size: 16px;
            padding-right: 2.5rem;
        }
        
        .form-text {
            display: block;
            margin-top: 0.25rem;
            font-size: 0.75rem;
            color: var(--gray);
        }
        
        .btn-submit {
            display: block;
            width: 100%;
            padding: 0.9rem 1rem;
            border-radius: var(--border-radius);
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            color: var(--white);
            font-weight: 600;
            border: none;
            cursor: pointer;
            transition: all 0.3s ease;
            font-size: 1rem;
            margin-top: 2rem;
            position: relative;
            overflow: hidden;
            text-align: center;
            box-shadow: 0 4px 6px rgba(50, 50, 93, 0.11), 0 1px 3px rgba(0, 0, 0, 0.08);
        }
        
        .btn-submit::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: all 0.6s;
        }
        
        .btn-submit:hover {
            transform: translateY(-2px);
            box-shadow: 0 7px 14px rgba(50, 50, 93, 0.1), 0 3px 6px rgba(0, 0, 0, 0.08);
            background: linear-gradient(135deg, var(--primary-dark) 0%, var(--primary) 100%);
        }
        
        .btn-submit:hover::before {
            left: 100%;
        }
        
        .btn-submit:active {
            transform: translateY(0);
        }
        
        .btn-icon {
            margin-right: 0.5rem;
        }
        
        .back-link {
            display: block;
            text-align: center;
            margin-top: 1.5rem;
            color: var(--gray);
            text-decoration: none;
            font-size: 0.9rem;
            transition: color 0.2s;
        }
        
        .back-link:hover {
            color: var(--primary);
        }
        
        .back-link i {
            margin-right: 0.25rem;
        }
        
        /* Responsive Styles */
        @media (max-width: 992px) {
            .main-wrapper {
                flex-direction: column;
            }
            
            .sidebar-column {
                flex: 0 0 auto;
                margin-bottom: 1rem;
            }
        }
        
        @media (max-width: 768px) {
            .filter-container {
                padding: 2rem 1.5rem;
                margin: 1rem auto;
            }
            
            .page-title {
                font-size: 1.5rem;
            }
            
            .form-subtitle {
                font-size: 0.85rem;
            }
        }
        
        @media (max-width: 576px) {
            .filter-container {
                padding: 1.5rem 1rem;
            }
        }
        
        /* Animation */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        .filter-container {
            animation: fadeIn 0.5s ease-out forwards;
        }
    </style>
</head>
<body>
    <div class="main-wrapper">
        <div class="sidebar-column">
            <!-- Your sidebar will be included automatically via the JSP include -->
        </div>
        
        <div class="content-column">
            <div class="filter-container">
                <h2 class="page-title">Filter Candidates</h2>
                <p class="form-subtitle">Select location criteria to find candidates</p>
                
                <form action="displaycandidates" method="post">
                    <div class="form-group">
                        <label for="state">
                            <i class="fas fa-map-marker-alt me-1"></i> State
                        </label>
                        <div class="input-icon-group">
                            <i class="fas fa-globe-asia input-icon"></i>
                            <select name="state" id="state" class="input-with-icon" required>
                                <option value="" disabled selected>Select a state</option>
                                <c:forEach var="s" items="${states}">
                                    <option value="${s}">${s}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <small class="form-text">Select the state to filter candidates</small>
                    </div>
                    
                    <div class="form-group">
                        <label for="district">
                            <i class="fas fa-map me-1"></i> District
                        </label>
                        <div class="input-icon-group">
                            <i class="fas fa-map-pin input-icon"></i>
                            <input type="text" name="district" id="district" class="input-with-icon" 
                                placeholder="Enter district name" required />
                        </div>
                        <small class="form-text">Enter the specific district within the selected state</small>
                    </div>
                    
                    <button type="submit" class="btn-submit">
                        <i class="fas fa-filter btn-icon"></i>
                        Filter Candidates
                    </button>
                    
                    <a href="admindashboard" class="back-link">
                        <i class="fas fa-arrow-left"></i> Back to Dashboard
                    </a>
                </form>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Simple form validation
        document.addEventListener('DOMContentLoaded', function() {
            const form = document.querySelector('form');
            const stateSelect = document.getElementById('state');
            const districtInput = document.getElementById('district');
            
            form.addEventListener('submit', function(e) {
                let valid = true;
                
                // Validate state selection
                if (stateSelect.value === '' || stateSelect.value === null) {
                    stateSelect.style.borderColor = '#e74a3b';
                    valid = false;
                } else {
                    stateSelect.style.borderColor = '#1cc88a';
                }
                
                // Validate district input
                if (districtInput.value.trim() === '') {
                    districtInput.style.borderColor = '#e74a3b';
                    valid = false;
                } else {
                    districtInput.style.borderColor = '#1cc88a';
                }
                
                if (!valid) {
                    e.preventDefault();
                }
            });
            
            // Reset validation styling on input change
            stateSelect.addEventListener('change', function() {
                if (this.value !== '') {
                    this.style.borderColor = '#d1d3e2';
                }
            });
            
            districtInput.addEventListener('input', function() {
                if (this.value.trim() !== '') {
                    this.style.borderColor = '#d1d3e2';
                }
            });
        });
    </script>
</body>
</html>