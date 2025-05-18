<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="adminsidenavbar.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Candidate</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        :root {
            --primary-color: #4361ee;
            --primary-hover: #3a56d4;
            --secondary-color: #3f37c9;
            --accent-color: #4895ef;
            --text-color: #333;
            --text-light: #6c757d;
            --bg-color: #f8f9fa;
            --card-bg: #ffffff;
            --border-radius: 12px;
            --box-shadow: 0 10px 30px rgba(67, 97, 238, 0.1);
            --transition: all 0.3s ease;
        }

        body {
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            color: var(--text-color);
        }

        .page-container {
            flex: 1;
            padding: 30px 15px;
            display: flex;
            justify-content: center;
            align-items: flex-start;
        }

        .form-container {
            width: 100%;
            max-width: 800px;
            background: var(--card-bg);
            padding: 40px;
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
            background: linear-gradient(90deg, var(--primary-color), var(--accent-color));
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            font-weight: 700;
            color: var(--primary-color);
            position: relative;
            padding-bottom: 15px;
        }

        h2::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 60px;
            height: 3px;
            background: var(--primary-color);
            border-radius: 10px;
        }

        .form-section {
            margin-bottom: 15px;
        }

        .form-label {
            font-weight: 600;
            font-size: 0.95rem;
            color: var(--text-color);
            margin-bottom: 6px;
            display: block;
        }

        .form-control, .form-select {
            border-radius: 10px;
            padding: 12px 15px;
            border: 1px solid #e1e5eb;
            font-size: 1rem;
            transition: var(--transition);
            box-shadow: none;
        }

        .form-control:focus, .form-select:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.2rem rgba(67, 97, 238, 0.25);
        }

        .form-control::placeholder {
            color: #adb5bd;
        }

        .form-text {
            color: var(--text-light);
            font-size: 0.85rem;
            margin-top: 5px;
        }

        .form-icon {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--text-light);
        }

        .input-with-icon {
            position: relative;
        }

        .input-with-icon .form-control {
            padding-left: 40px;
        }

        .file-upload {
            position: relative;
            display: flex;
            flex-direction: column;
            border: 2px dashed #e1e5eb;
            border-radius: var(--border-radius);
            padding: 20px;
            text-align: center;
            transition: var(--transition);
            cursor: pointer;
            margin-top: 8px;
        }

        .file-upload:hover {
            border-color: var(--primary-color);
        }

        .file-upload i {
            font-size: 2rem;
            color: var(--primary-color);
            margin-bottom: 10px;
        }

        .file-upload p {
            margin-bottom: 0;
            font-size: 0.9rem;
            color: var(--text-light);
        }

        .file-upload input[type="file"] {
            position: absolute;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            opacity: 0;
            cursor: pointer;
        }

        .file-upload-preview {
            display: none;
            margin-top: 15px;
        }

        .file-upload-preview img {
            max-width: 100%;
            max-height: 150px;
            border-radius: 5px;
        }

        .btn-primary {
            background-color: var(--primary-color);
            border: none;
            border-radius: var(--border-radius);
            padding: 12px 20px;
            font-size: 1rem;
            font-weight: 600;
            transition: var(--transition);
            display: flex;
            align-items: center;
            justify-content: center;
            width: 100%;
        }

        .btn-primary i {
            margin-right: 8px;
        }

        .btn-primary:hover {
            background-color: var(--primary-hover);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(67, 97, 238, 0.3);
        }

        .btn-primary:active {
            transform: translateY(0);
        }

        .row {
            margin-left: -15px;
            margin-right: -15px;
        }
        
        .col-md-6 {
            padding-left: 15px;
            padding-right: 15px;
        }

        #image-preview {
            width: 100%;
            height: 150px;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #f8f9fa;
            margin-top: 10px;
            border-radius: 10px;
            overflow: hidden;
        }
        
        #image-preview img {
            max-width: 100%;
            max-height: 100%;
            object-fit: contain;
        }
        
        @media (max-width: 768px) {
            .form-container {
                padding: 25px;
            }
        }
    </style>
</head>
<body>

<div class="page-container">
    <div class="form-container">
        <h2>Add New Candidate</h2>
        
        <form action="addcandidate" method="post" enctype="multipart/form-data" id="candidateForm">
            <div class="row">
                <div class="col-md-6">
                    <div class="form-section">
                        <label for="candidateName" class="form-label">Candidate Name</label>
                        <div class="input-with-icon">
                            <i class="fas fa-user form-icon"></i>
                            <input type="text" id="candidateName" name="candidateName" class="form-control" 
                                placeholder="Enter candidate name" required>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-6">
                    <div class="form-section">
                        <label for="party" class="form-label">Political Party</label>
                        <div class="input-with-icon">
                            <i class="fas fa-flag form-icon"></i>
                            <input type="text" id="party" name="party" class="form-control" 
                                placeholder="Enter party name" required>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-6">
                    <div class="form-section">
                        <label for="state" class="form-label">State</label>
                        <div class="input-with-icon">
                            <i class="fas fa-map-marker-alt form-icon"></i>
                            <input type="text" id="state" name="state" class="form-control" 
                                placeholder="Enter state" required>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-6">
                    <div class="form-section">
                        <label for="district" class="form-label">District</label>
                        <div class="input-with-icon">
                            <i class="fas fa-building form-icon"></i>
                            <input type="text" id="district" name="district" class="form-control" 
                                placeholder="Enter district" required>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="form-section">
                <label for="electionCodenum" class="form-label">Election</label>
                <div class="input-with-icon">
                    <i class="fas fa-vote-yea form-icon"></i>
                    <select id="electionCodenum" name="electionCodenum" class="form-select" required>
                        <option value="" disabled selected>Select an election</option>
                        <c:forEach var="e" items="${elections}">
                            <option value="${e.codenum}">${e.name} - ${e.codenum}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            
            <div class="form-section">
                <label class="form-label">Party Image (Symbol)</label>
                <div class="file-upload" id="file-upload">
                    <i class="fas fa-cloud-upload-alt"></i>
                    <p>Drag & drop your image here or click to browse</p>
                    <p class="form-text">Accepted formats: JPG, PNG, GIF (Max size: 5MB)</p>
                    <input type="file" name="image" id="image" accept="image/*" required>
                </div>
                <div id="image-preview"></div>
            </div>
            
            <div class="form-section mt-4">
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-plus-circle"></i> Add Candidate
                </button>
            </div>
        </form>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Image preview functionality
    document.getElementById('image').addEventListener('change', function(e) {
        const fileInput = e.target;
        const imagePreview = document.getElementById('image-preview');
        
        if (fileInput.files && fileInput.files[0]) {
            const reader = new FileReader();
            
            reader.onload = function(e) {
                imagePreview.innerHTML = `<img src="${e.target.result}" alt="Preview">`;
                imagePreview.style.display = 'flex';
            }
            
            reader.readAsDataURL(fileInput.files[0]);
        }
    });
    
    // Form validation
    document.getElementById('candidateForm').addEventListener('submit', function(e) {
        const form = e.target;
        
        if (!form.checkValidity()) {
            e.preventDefault();
            e.stopPropagation();
        }
        
        form.classList.add('was-validated');
    });
</script>
</body>
</html>