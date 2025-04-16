<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Success</title>
    <link rel="stylesheet" href="path/to/bootstrap.css"> <!-- Bootstrap CSS link -->
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .message-container {
            background-color: #ffffff;
            border-radius: 10px;
            padding: 40px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 500px;
            width: 100%;
        }
        .message-container h2 {
            color: #28a745;
        }
        .message-container p {
            color: #333;
            font-size: 18px;
        }
        .message-container .btn {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 25px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease-in-out;
        }
        .message-container .btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="message-container">
        <h2>Registration Successful!</h2>
        <p>${message}</p>
        <p>You will be redirected to the home page shortly.</p>
        <a href="index.jsp" class="btn">Go to Home</a>
    </div>

    <script>
        setTimeout(function(){
            window.location.href = "index.jsp"; // Redirect to index page after 5 seconds
        }, 5000); // 5 seconds delay
    </script>
</body>
</html>
