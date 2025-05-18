<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Login And Register Page || Eduhas - Education Bootstrap 5 Template</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.ico">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" href="assets/css/plugins.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <script src="assets/js/vendor/modernizr-3.6.0.min.js"></script>

    <script>
        function validateLoginForm() {
            var email = document.forms["loginForm"]["email"].value;
            var password = document.forms["loginForm"]["password"].value;

            if (email === "" || password === "") {
                alert("All fields must be filled out.");
                return false;
            }

            var regExPassword = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[\W_]).{8,}$/;
            if (!regExPassword.test(password)) {
                alert("Password must be more than 7 characters, contain at least one lowercase letter, one uppercase letter, and one special character.");
                return false;
            }

            return true;
        }

        function validateRegisterForm() {
            var form = document.forms["registerForm"];

            var registerId = form["registerId"].value;
            var fullname = form["fullname"].value;
            var gender = form["gender"].value;
            var email = form["email"].value;
            var mobilenumber = form["mobilenumber"].value;
            var dateofbirth = form["dateofbirth"].value;
            var city = form["city"].value;
            var state = form["state"].value;
            var district = form["district"].value;
            var pincode = form["pincode"].value;
            var country = form["country"].value;
            var password = form["password"].value;
            var adharnumber = form["adharnumber"].value;

            if (
                registerId === "" || fullname === "" || gender === "" || email === "" || mobilenumber === "" ||
                dateofbirth === "" || city === "" || state === "" || district === "" || pincode === "" ||
                country === "" || password === "" || adharnumber === ""
            ) {
                alert("All fields must be filled out.");
                return false;
            }

            var regExId = /^[0-9]{10}$/;
            if (!regExId.test(registerId)) {
                alert("Register ID must be exactly 10 digits.");
                return false;
            }

            var regExMobile = /^[0-9]{10}$/;
            if (!regExMobile.test(mobilenumber)) {
                alert("Mobile number must be exactly 10 digits.");
                return false;
            }

            var regExAadhar = /^[0-9]{12}$/;
            if (!regExAadhar.test(adharnumber)) {
                alert("Aadhaar number must be exactly 12 digits.");
                return false;
            }

            var regExEmail = /^[a-zA-Z0-9._%+-]+@gmail\.com$/;
            if (!regExEmail.test(email)) {
                alert("Email must be in valid '@gmail.com' format.");
                return false;
            }

            var regExPassword = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[\W_]).{8,}$/;
            if (!regExPassword.test(password)) {
                alert("Password must be more than 7 characters, contain at least one lowercase letter, one uppercase letter, and one special character.");
                return false;
            }

            return true;
        }
    </script>
</head>

<body>
<div class="main-wrapper">

    <div class="breadcrumb-area" data-bgimage="assets/images/bg/breadcrumb-bg-01.jpg" data-black-overlay="4">
        <div class="container">
            <div class="in-breadcrumb">
                <div class="row">
                    <div class="col">
                        <h3>Login And Register</h3>
                        <ul class="breadcrumb-list">
                            <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                            <li class="breadcrumb-item active">Login And Register</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <main class="page-content">
        <div class="register-page section-ptb">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7 col-md-12 m-auto">
                        <div class="login-register-wrapper">
                            <div class="login-register-tab-list nav">
                                <a class="active" data-bs-toggle="tab" href="#lg1"><h4> login </h4></a>
                                <a data-bs-toggle="tab" href="#lg2"><h4> register </h4></a>
                            </div>
                            <div class="tab-content">
                                <!-- Login Tab -->
                                <div id="lg1" class="tab-pane active">
                                    <div class="login-form-container">
                                        <div class="login-register-form">
                                            <form name="loginForm" action="checkuserlogin" method="post" onsubmit="return validateLoginForm()">
                                                <div class="login-input-box">
                                                    <input type="text" name="email" placeholder="Email" required>
                                                    <input type="password" name="password" placeholder="Password" required>
                                                </div>
                                                <div class="button-box">
                                                    <div class="login-toggle-btn">
                                                        <input type="checkbox">
                                                        <label>Remember me</label>
                                                        <a href="#">Forgot Password?</a>
                                                    </div>
                                                    <button class="login-btn btn" type="submit"><span>Login</span></button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>

                                <!-- Register Tab -->
                                <div id="lg2" class="tab-pane">
                                    <div class="login-form-container">
                                        <div class="login-register-form">
                                            <form name="registerForm" action="insertuser" method="post" enctype="multipart/form-data" onsubmit="return validateRegisterForm()">
                                                <div class="login-input-box">

                                                    <input type="text" name="fullname" placeholder="Full Name *" required>
                                                    <input type="text" name="gender" placeholder="Gender *" required>
                                                    <input type="email" name="email" placeholder="Email *" required>
                                                    <input type="text" name="mobilenumber" placeholder="Mobile Number *" required>
                                                    <input type="date" name="dateofbirth" placeholder="Date of Birth *" required>
                                                    <input type="text" name="city" placeholder="City *" required>
                                                    <input type="text" name="state" placeholder="State *" required>
                                                    <input type="text" name="district" placeholder="District *" required>
                                                    <input type="text" name="pincode" placeholder="Pincode *" required>
                                                    <input type="text" name="country" placeholder="Country *" required>
                                                    <input type="text" name="adharnumber" placeholder="Aadhaar Number *" required>
                                                    <input type="password" name="password" placeholder="Password *" required>
                                                </div>
                                                <div class="button-box">
                                                    <button class="register-btn btn" type="submit"><span>Register</span></button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Register Tab -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>

<script src="assets/js/popper.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/plugins.js"></script>
<script src="assets/js/main.js"></script>
</body>
</html>
