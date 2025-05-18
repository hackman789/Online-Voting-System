<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="adminsidenavbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create Election</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #4e73df;
            --secondary: #858796;
            --success: #1cc88a;
            --info: #36b9cc;
            --warning: #f6c23e;
            --danger: #e74a3b;
            --light: #f8f9fc;
            --dark: #5a5c69;
            --white: #fff;
            --gray: #6c757d;
            --gray-light: #f8f9fa;
            --gray-dark: #343a40;
            --border-radius: 0.35rem;
            --box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.15);
        }
        
        body {
            background-color: var(--light);
            font-family: 'Poppins', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 
                'Helvetica Neue', Arial, sans-serif;
            color: var(--gray-dark);
            padding: 0;
            margin: 0;
        }
        
        .main-content {
            padding: 2rem;
            transition: margin-left 0.3s;
        }
        
        .page-header {
            margin-bottom: 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .page-header h1 {
            font-weight: 700;
            font-size: 1.75rem;
            color: var(--dark);
            margin-bottom: 0;
        }
        
        .back-button {
            padding: 0.5rem 1rem;
            font-size: 0.85rem;
            font-weight: 600;
            border-radius: var(--border-radius);
        }
        
        .form-container {
            max-width: 800px;
            margin: 0 auto;
            background-color: var(--white);
            padding: 2rem;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            position: relative;
            overflow: hidden;
        }
        
        .form-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 5px;
            background: linear-gradient(to right, var(--primary), var(--info));
        }
        
        .form-header {
            text-align: center;
            margin-bottom: 2rem;
            padding-bottom: 1rem;
            border-bottom: 1px solid rgba(0, 0, 0, 0.1);
            position: relative;
        }
        
        .form-header h2 {
            font-weight: 600;
            color: var(--dark);
            margin-bottom: 0.5rem;
        }
        
        .form-header p {
            color: var(--gray);
            margin-bottom: 0;
            font-size: 0.9rem;
        }
        
        .form-section {
            margin-bottom: 1.5rem;
            padding-bottom: 1.5rem;
            border-bottom: 1px solid rgba(0, 0, 0, 0.05);
        }
        
        .form-section-title {
            font-size: 1.1rem;
            font-weight: 600;
            color: var(--primary);
            margin-bottom: 1rem;
        }
        
        .form-row {
            display: flex;
            flex-wrap: wrap;
            margin-right: -10px;
            margin-left: -10px;
        }
        
        .form-group {
            margin-bottom: 1.25rem;
            padding-right: 10px;
            padding-left: 10px;
        }
        
        .form-col-6 {
            flex: 0 0 50%;
            max-width: 50%;
        }
        
        .form-col-12 {
            flex: 0 0 100%;
            max-width: 100%;
        }
        
        label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            font-size: 0.85rem;
            color: var(--gray-dark);
        }
        
        .form-control {
            display: block;
            width: 100%;
            height: calc(1.5em + 0.75rem + 2px);
            padding: 0.375rem 0.75rem;
            font-size: 0.9rem;
            font-weight: 400;
            line-height: 1.5;
            color: var(--gray-dark);
            background-color: var(--white);
            background-clip: padding-box;
            border: 1px solid #d1d3e2;
            border-radius: var(--border-radius);
            transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
        }
        
        .form-control:focus {
            color: var(--gray-dark);
            background-color: var(--white);
            border-color: #bac8f3;
            outline: 0;
            box-shadow: 0 0 0 0.2rem rgba(78, 115, 223, 0.25);
        }
        
        .form-check {
            position: relative;
            display: block;
            padding-left: 1.25rem;
        }
        
        .form-check-input {
            position: absolute;
            margin-top: 0.3rem;
            margin-left: -1.25rem;
        }
        
        .form-check-label {
            margin-bottom: 0;
            cursor: pointer;
        }
        
        .custom-checkbox .form-check-input:checked ~ .form-check-label::before {
            background-color: var(--primary);
            border-color: var(--primary);
        }
        
        .btn-primary {
            color: var(--white);
            background-color: var(--primary);
            border-color: var(--primary);
            font-weight: 600;
            padding: 0.5rem 1rem;
            font-size: 0.9rem;
            border-radius: var(--border-radius);
            transition: all 0.2s;
        }
        
        .btn-primary:hover {
            background-color: #2e59d9;
            border-color: #2653d4;
            transform: translateY(-1px);
            box-shadow: 0 4px 6px rgba(50, 50, 93, 0.11), 0 1px 3px rgba(0, 0, 0, 0.08);
        }
        
        .btn-primary:active, .btn-primary:focus {
            box-shadow: 0 0 0 0.2rem rgba(78, 115, 223, 0.5);
            transform: translateY(0);
        }
        
        .submit-btn {
            padding: 0.7rem 1.5rem;
            font-size: 1rem;
            font-weight: 600;
            border-radius: var(--border-radius);
            width: 100%;
            margin-top: 1rem;
        }
        
        .submit-btn i {
            margin-right: 0.5rem;
        }
        
        /* Input group styling */
        .input-group {
            position: relative;
            display: flex;
            flex-wrap: wrap;
            align-items: stretch;
            width: 100%;
        }
        
        .input-group-prepend {
            display: flex;
            margin-right: -1px;
        }
        
        .input-group-text {
            display: flex;
            align-items: center;
            padding: 0.375rem 0.75rem;
            margin-bottom: 0;
            font-size: 0.9rem;
            font-weight: 400;
            line-height: 1.5;
            color: var(--gray);
            text-align: center;
            white-space: nowrap;
            background-color: #e9ecef;
            border: 1px solid #d1d3e2;
            border-radius: var(--border-radius) 0 0 var(--border-radius);
        }
        
        .input-group > .form-control:not(:first-child) {
            border-top-left-radius: 0;
            border-bottom-left-radius: 0;
        }
        
        /* Switch styling for active election */
        .switch {
            position: relative;
            display: inline-block;
            width: 50px;
            height: 24px;
        }
        
        .switch input {
            opacity: 0;
            width: 0;
            height: 0;
        }
        
        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            transition: .4s;
            border-radius: 24px;
        }
        
        .slider:before {
            position: absolute;
            content: "";
            height: 16px;
            width: 16px;
            left: 4px;
            bottom: 4px;
            background-color: white;
            transition: .4s;
            border-radius: 50%;
        }
        
        input:checked + .slider {
            background-color: var(--success);
        }
        
        input:focus + .slider {
            box-shadow: 0 0 1px var(--success);
        }
        
        input:checked + .slider:before {
            transform: translateX(26px);
        }
        
        .switch-container {
            display: flex;
            align-items: center;
        }
        
        .switch-label {
            margin-left: 10px;
            margin-bottom: 0;
            font-size: 0.9rem;
        }
        
        /* Helper text */
        .helper-text {
            font-size: 0.75rem;
            color: var(--gray);
            margin-top: 0.25rem;
        }
        
        /* Responsive */
        @media (max-width: 767px) {
            .form-container {
                padding: 1.5rem;
                margin: 0 1rem;
            }
            
            .form-col-6 {
                flex: 0 0 100%;
                max-width: 100%;
            }
            
            .page-header {
                flex-direction: column;
                align-items: flex-start;
            }
            
            .back-button {
                margin-top: 1rem;
            }
        }
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-3">
                <!-- Your admin sidebar will be included here -->
            </div>
            
            <div class="col-md-9 main-content">
                <div class="page-header">
                    <h1>Election Management</h1>
                    <a href="elections" class="btn btn-outline-primary back-button">
                        <i class="fas fa-arrow-left mr-1"></i> Back to Elections
                    </a>
                </div>
                
                <div class="form-container">
                    <div class="form-header">
                        <h2>Create New Election</h2>
                        <p>Fill in the details below to create a new election</p>
                    </div>
                    
                    <form action="createElection" method="POST">
                        <div class="form-section">
                            <div class="form-section-title">Basic Information</div>
                            
                            <div class="form-row">
                                <div class="form-group form-col-6">
                                    <label for="codenum">
                                        <i class="fas fa-hashtag mr-1"></i>Election Code Number
                                    </label>
                                    <input type="text" class="form-control" id="codenum" name="codenum" 
                                        placeholder="Enter unique code number" required>
                                    <small class="helper-text">Unique identifier for this election</small>
                                </div>
                                
                                <div class="form-group form-col-6">
                                    <label for="name">
                                        <i class="fas fa-vote-yea mr-1"></i>Election Name
                                    </label>
                                    <input type="text" class="form-control" id="name" name="name" 
                                        placeholder="Enter election name" required>
                                    <small class="helper-text">Official name of the election</small>
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-section">
                            <div class="form-section-title">Location Information</div>
                            
                            <div class="form-row">
                                <div class="form-group form-col-6">
                                    <label for="state">
                                        <i class="fas fa-map-marker-alt mr-1"></i>State
                                    </label>
                                    <input type="text" class="form-control" id="state" name="state" 
                                        placeholder="Enter state name" required>
                                </div>
                                
                                <div class="form-group form-col-6">
                                    <label for="district">
                                        <i class="fas fa-map mr-1"></i>District
                                    </label>
                                    <input type="text" class="form-control" id="district" name="district" 
                                        placeholder="Optional for state-wide elections">
                                    <small class="helper-text">Leave blank for state-wide elections</small>
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-section">
                            <div class="form-section-title">Schedule Information</div>
                            
                            <div class="form-row">
                                <div class="form-group form-col-6">
                                    <label for="startDate">
                                        <i class="far fa-calendar-alt mr-1"></i>Start Date
                                    </label>
                                    <input type="date" class="form-control" id="startDate" name="startDate" required>
                                </div>
                                
                                <div class="form-group form-col-6">
                                    <label for="endDate">
                                        <i class="far fa-calendar-check mr-1"></i>End Date
                                    </label>
                                    <input type="date" class="form-control" id="endDate" name="endDate" required>
                                </div>
                            </div>
                            
                            <div class="form-group form-col-12">
                                <div class="switch-container">
                                    <label class="switch">
                                        <input type="checkbox" id="active" name="active" checked>
                                        <span class="slider"></span>
                                    </label>
                                    <span class="switch-label">Active Election</span>
                                </div>
                                <small class="helper-text ml-5">Set to active for immediate publication</small>
                            </div>
                        </div>
                        
                        <button type="submit" class="btn btn-primary submit-btn">
                            <i class="fas fa-plus-circle"></i> Create Election
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        // Form validation script
        (function() {
            'use strict';
            window.addEventListener('load', function() {
                // Fetch all forms we want to apply validation styles to
                var forms = document.getElementsByTagName('form');
                
                // Loop over them and prevent submission
                var validation = Array.prototype.filter.call(forms, function(form) {
                    form.addEventListener('submit', function(event) {
                        if (form.checkValidity() === false) {
                            event.preventDefault();
                            event.stopPropagation();
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
                
                // Date validation
                document.getElementById('startDate').addEventListener('change', function() {
                    document.getElementById('endDate').min = this.value;
                });
                
                const today = new Date().toISOString().split('T')[0];
                document.getElementById('startDate').min = today;
            }, false);
        })();
    </script>
</body>
</html>