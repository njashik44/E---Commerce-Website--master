<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <%@include file="components/common_css_js.jsp" %>
        <style>
            body {
                background-color: #fff;
                font-family: 'Arial', sans-serif;
                margin: 0;
                padding: 0;
            }
            .card {
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                border-radius: 10px;
                overflow: hidden;
                margin-top: 50px;
            }
            .card-body {
                padding: 50px;
                background-color: #ffffff;
                min-height: 450px;
            }
            .btn-custom {
                border: none;
                padding: 12px 25px;
                font-size: 18px;
                border-radius: 25px;
                transition: background-color 0.3s ease-in-out;
            }
            .btn-custom.btn-login {
                background-color: #4facfe;
                color: #fff;
            }
            .btn-custom.btn-login:hover {
                background-color: #00f2fe;
            }
            .form-control {
                border-radius: 5px;
                border: 1px solid #ccc;
                padding: 10px;
                font-size: 16px;
            }
            .form-group label {
                font-weight: bold;
                color: #333;
            }
            h3 {
                font-weight: bold;
                color: #555;
            }
            .forgot-password {
                text-align: right;
                margin-top: 10px;
            }
            .forgot-password a {
                color: #4facfe;
                text-decoration: none;
            }
            .forgot-password a:hover {
                text-decoration: underline;
            }
            .error-message {
                color: red;
                font-weight: bold;
                text-align: center;
                margin-bottom: 20px;
            }
        </style>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center mb-4">Login</h3>

                            <!-- Error Message Display -->
                            <c:if test="${not empty errorMessage}">
                                <div class="error-message">
                                    ${errorMessage}
                                </div>
                            </c:if>

                            <form action="LoginServlet" method="post">
                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input name="email" type="email" class="form-control" id="email" placeholder="Enter your email" required>
                                </div>
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input name="password" type="password" class="form-control" id="password" placeholder="Enter your password" required>
                                </div>
                                
                                <div class="forgot-password">
                                    <a href="forgot-password.jsp">Forgot Password?</a>
                                </div>

                                <div class="text-center mt-4">
                                    <button type="submit" class="btn btn-login btn-custom">Login</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
