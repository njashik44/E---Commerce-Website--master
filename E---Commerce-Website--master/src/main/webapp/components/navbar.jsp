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
                
                
                <!-- Cart -->
                <li class="nav-item">
                    <a class="nav-link" href="cart.jsp">
                        <i class="fa fa-shopping-cart"></i> Cart
                    </a>
                </li>

                <!-- Login/Register -->
                <%-- Dynamic Login/Register Links --%>
                <%
                    if (session != null && session.getAttribute("currentUser") != null) {
                %>
                    <li class="nav-item">
                        <a class="nav-link" href="logout.jsp">Logout</a>
                    </li>
                <%
                    } else {
                %>
                    <li class="nav-item">
                        <a class="nav-link" href="login.jsp">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="register.jsp">Register</a>
                    </li>
                <%
                    }
                %>
            </ul>
        </div>
    </div>
</nav>
