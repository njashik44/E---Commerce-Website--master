<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Success</title>
    <link rel="stylesheet" href="path/to/bootstrap.css"> <!-- Bootstrap CSS link -->
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f0f4f8;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .message-container {
            background-color: #ffffff;
            border-radius: 15px;
            padding: 50px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
            text-align: center;
            max-width: 600px;
            width: 100%;
            animation: fadeIn 1s ease-out;
        }

        /* Animation for fading in the message container */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        h2 {
            color: #28a745; /* Green color */
            font-size: 2.5rem;
            margin-bottom: 20px;
            font-weight: 700;
        }

        p {
            color: #333;
            font-size: 1.2rem;
            margin-bottom: 30px;
        }

        .btn {
            background-color: #007bff;
            color: white;
            padding: 12px 25px;
            border: none;
            border-radius: 30px;
            font-size: 1.1rem;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s;
        }

        .btn:hover {
            background-color: #0056b3;
            transform: translateY(-5px);
        }

        .btn:focus {
            outline: none;
        }
    </style>
</head>
<body>

    <div class="message-container">
        <h2>Category added successfully!</h2>
        <p>${message}</p>
        <p>You will be redirected to the admin page shortly.</p>
        <a href="admin.jsp" class="btn">Go to Admin</a>
    </div>

    <script>
        setTimeout(function(){
            window.location.href = "admin.jsp"; // Redirect to admin page after 3 seconds
        }, 3000); // 3 seconds delay
    </script>

</body>
</html>
