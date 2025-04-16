<%@page import="com.mycompany.e.commercesite.entites.User"%>
<%
    User user1 = (User)session.getAttribute("current-user");
%>

<nav class="navbar navbar-expand-lg navbar-dark custom-bg">
    <div class="container">
        <!-- Brand Name -->
        <a class="navbar-brand" href="index.jsp">Quick Shopping</a>

        <!-- Navbar Toggler -->
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarContent" aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Navbar Links -->
        <div class="collapse navbar-collapse" id="navbarContent">
            <ul class="navbar-nav mr-auto">
                <!-- Home Link -->
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Home</a>
                </li>

                <!-- Categories Dropdown -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="categoriesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Categories
                    </a>
                    <div class="dropdown-menu" aria-labelledby="categoriesDropdown">
                        <a class="dropdown-item" href="category.jsp?cat=electronics">Electronics</a>
                        <a class="dropdown-item" href="category.jsp?cat=fashion">Fashion</a>
                        <a class="dropdown-item" href="category.jsp?cat=home-appliances">Home Appliances</a>
                        <a class="dropdown-item" href="category.jsp?cat=sports">Sports</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="category.jsp?cat=other">Other</a>
                    </div>
                </li>
            </ul>

            <!-- Right Side Links -->
            <ul class="navbar-nav ml-auto">
                <% 
                    if (user1 == null) {
                %>
                    <!-- Login and Register Links for non-logged-in users -->
                    <li class="nav-item">
                        <a class="nav-link" href="login.jsp">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="register.jsp">Register</a>
                    </li>
                <% 
                    } else {
                %>
                    <!-- Display username and Logout link for logged-in users -->
                    <li class="nav-item">
                        <a class="nav-link" href="#"><%= user1.getUserName() %></a> <!-- Show only username -->
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet">Logout</a>
                    </li>
                <% 
                    }
                %>
            </ul>
        </div>
    </div>
</nav>

<style>
    .navbar {
        font-family: 'Arial', sans-serif;
    }

    .navbar-nav .nav-link {
        color: #fff !important;
        font-size: 14px; /* Smaller font size */
        text-transform: uppercase;
        padding: 8px 12px; /* Adjusted padding */
    }

    .navbar-nav .nav-link:hover {
        color: #f39c12 !important; /* Hover color for links */
    }

    .navbar-nav .nav-item {
        margin-right: 10px;
    }

    .dropdown-menu {
        background-color: #333;
        border: none;
    }

    .dropdown-item {
        color: #fff;
    }

    .dropdown-item:hover {
        background-color: #f39c12;
    }

    .navbar-toggler {
        border-color: #fff;
    }

    .navbar-toggler-icon {
        background-color: #fff;
    }
</style>
