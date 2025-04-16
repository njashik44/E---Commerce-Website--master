<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Register</title>
        <%@include file="components/common_css_js.jsp" %>
        <style>
            body {
                background-color: #fff; /* White background */
                font-family: 'Arial', sans-serif;
                margin: 0;
                padding: 0;
            }
            .card {
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                border-radius: 10px;
                overflow: hidden;
                margin-top: 30px;
                width: 100%;
                max-width: 500px;
                margin-left: auto;
                margin-right: auto;
            }
            .card-body {
                padding: 30px 50px;
                background-color: #ffffff;
                min-height: 350px;
            }
            .btn-custom {
                border: none;
                padding: 14px 30px;
                font-size: 16px;
                border-radius: 25px;
                transition: background-color 0.3s ease-in-out;
                width: 48%;
                margin: 0;
            }
            .btn-custom.btn-register {
                background-color: #5890FF;
                color: #fff;
            }
            .btn-custom.btn-register:hover {
                background-color: #467AD6;
            }
            .btn-custom.btn-reset {
                background-color: #5d6d7e;
                color: #fff;
            }
            .btn-custom.btn-reset:hover {
                background-color: #4a5868;
            }
            .form-control {
                border-radius: 5px;
                border: 1px solid #ccc;
                padding: 10px;
                font-size: 16px;
                margin-bottom: 20px;
            }
            .form-group label {
                font-weight: bold;
                color: #333;
            }
            h3 {
                font-weight: bold;
                color: #555;
                text-align: center;
                margin-bottom: 20px;
            }
            .button-group {
                display: flex;
                justify-content: space-between;
                align-items: center;
                gap: 10px;
            }
        </style>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <h3>Register</h3>
                            <form action="RegisterServlet" method="post">
                                <div class="form-group">
                                    <label for="username">Username</label>
                                    <input name="user_name" type="text" class="form-control" id="username" placeholder="Enter your username" required>
                                </div>
                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input name="user_email" type="email" class="form-control" id="email" placeholder="Enter your email" required>
                                </div>
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input name="user_password" type="password" class="form-control" id="password" placeholder="Enter your password" required>
                                </div>
                                <div class="form-group">
                                    <label for="phone">Phone Number</label>
                                    <input name="user_phone" type="number" class="form-control" id="phone" placeholder="Enter your phone number" required>
                                </div>
                                <div class="form-group">
                                    <label for="address">Address</label>
                                    <textarea name="user_address" id="address" class="form-control" placeholder="Enter your address" style="height: 80px;" required></textarea>
                                </div>
                                <div class="button-group text-center mt-4">
                                    <button type="submit" class="btn btn-register btn-custom">Register</button>
                                    <button type="reset" class="btn btn-reset btn-custom">Reset</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
