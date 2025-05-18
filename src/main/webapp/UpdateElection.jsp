<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="adminsidenavbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Election</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f2f4f7;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 1200px;
            margin: 50px auto;
            background-color: #fff;
            border-radius: 12px;
            padding: 50px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 25px;
        }
        label {
            display: block;
            margin-top: 15px;
            font-weight: 500;
        }
        input[type="text"],
        input[type="date"],
        .form-check-input {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border-radius: 8px;
            border: 1px solid #ccc;
        }
        .form-check {
            margin-top: 15px;
        }
        .btn {
            background-color: #007bff;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 8px;
            margin-top: 20px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }
        .btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Update Election</h2>
    <form action="updateElection" method="POST">
        <input type="hidden" name="id" value="${election.id}" />
         <label>Election CodeNumber</label>
        <input type="text" name="codenum" value="${election.codenum}" required>
        
         

        <label>Election Name</label>
        <input type="text" name="name" value="${election.name}" required>

        <label>State</label>
        <input type="text" name="state" value="${election.state}" required>

        <label>District (optional)</label>
        <input type="text" name="district" value="${election.district}">

        <label>Start Date</label>
        <input type="date" name="startDate" value="${election.startDate}" required>

        <label>End Date</label>
        <input type="date" name="endDate" value="${election.endDate}" required>

        <div class="form-check">
            <label>
                <input type="checkbox" name="active" class="form-check-input"
                    <c:if test="${election.active}">checked</c:if>> Active Election
            </label>
        </div>

        <button type="submit" class="btn">Update Election</button>
    </form>
</div>

</body>
</html>
