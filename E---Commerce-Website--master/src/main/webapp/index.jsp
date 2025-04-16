<%@page import="com.mycompany.e.commercesite.helper.Helper"%>
<%@page import="com.mycompany.e.commercesite.entites.Category"%>
<%@page import="com.mycompany.e.commercesite.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.e.commercesite.entites.Product"%>
<%@page import="com.mycompany.e.commercesite.dao.ProductDao"%>
<%@page import="com.mycompany.e.commercesite.helper.FactoryProvider"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quick Shopping - Home</title>
    
    <%@ include file="components/common_css_js.jsp" %> <!-- Common CSS & JS -->

    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
        }

        .navbar {
            margin-bottom: 20px;
            position: sticky;
            top: 0;
            z-index: 100;
            background-color: #fff;
            border-bottom: 1px solid #ddd;
        }

        .navbar-brand {
            font-weight: bold;
            font-size: 1.5rem;
        }

        .list-group-item {
            font-size: 1.1rem;
        }

        .card {
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 15px;
            transition: transform 0.2s;
            height: 100%;  /* Ensures uniform height for each card */
        }

        .card:hover {
            transform: scale(1.05);
        }

        .card-img-top {
            height: 180px;  /* Uniform image size */
            object-fit: cover;
        }

        .card-body {
            text-align: center;
            padding: 15px;
        }

        .card-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 15px;
        }

        .search-bar {
            margin-top: 10px;
            margin-bottom: 20px;
            width: 80%;
            max-width: 400px;
            margin-left: auto;
            margin-right: auto;
        }

        .search-bar input {
            width: 100%;
            padding: 8px;
            font-size: 0.9rem;
            border-radius: 5px;
            border: 1px solid #ddd;
        }

        .btn-custom {
            background-color: #007bff;
            color: white;
            font-weight: bold;
            border-radius: 5px;
            transition: background-color 0.3s;
            padding: 8px 10px;  /* Smaller padding for buttons */
            font-size: 0.85rem;  /* Smaller font for buttons */
            width: 48%;  /* Adjusted width */
        }

        .btn-custom:hover {
            background-color: #0056b3;
        }

        .discount-label {
            font-size: 0.9rem;
            text-decoration: line-through;
            color: #6c757d;
        }

        /* Grid adjustments */
        .card-columns {
            column-count: 4;
            column-gap: 15px;
            margin-bottom: 20px;  /* Spacing between product rows */
        }

        @media (max-width: 768px) {
            .card-columns {
                column-count: 2;
            }
        }

        @media (max-width: 480px) {
            .card-columns {
                column-count: 1;
            }

            .search-bar {
                width: 100%;
            }
            
            .btn-custom {
                width: 100%;
            }
        }

        .card-footer .btn {
            margin: 5px 0; /* Spacing between the buttons */
        }
    </style>
</head>
<body>
    <%@ include file="components/navbar.jsp" %> <!-- Include Navbar -->
    
    <div class="container-fluid"> 
        <!-- Search Bar -->
        <div class="search-bar">
            <form action="index.jsp" method="get">
                <input type="text" name="search" placeholder="Search for products..." class="form-control" />
            </form>
        </div>

        <div class="row mt-3">
            <%
                String cat = request.getParameter("category");
                String search = request.getParameter("search");
                ProductDao dao = new ProductDao(FactoryProvider.getFactory());
                List<Product> list = null;

                if (cat == null || cat.trim().isEmpty()) {
                    cat = "all"; 
                }

                if (cat.trim().equals("all")) {
                    list = dao.getAllProducts();
                } else {
                    try {
                        int cid = Integer.parseInt(cat.trim());
                        list = dao.getAllProductsById(cid);
                    } catch (NumberFormatException e) {
                        out.println("<div class='alert alert-danger'>Invalid category ID</div>");
                    }
                }
                
                CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                List<Category> clist = cdao.getCategories();
            %>

            <div class="col-md-2">
                <div class="list-group mt-4">
                    <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
                        All Products
                    </a>

                    <% for (Category c : clist) { %>
                        <a href="index.jsp?category=<%= c.getCategoryId() %>" class="list-group-item list-group-item-action">
                            <%= c.getCategoryTitle() %>
                        </a>
                    <% } %>
                </div>
            </div>
        
            <div class="col-md-10">
                <div class="row mt-4">
                    <div class="col-md-12">
                        <div class="card-columns">
                            <% 
                                for (Product p : list) {
                            %>
                                <!-- Product Card -->
                                <div class="card">
                                    <div class="container text-center">
                                        <img class="card-img-top mt-2" src="img/products/<%= p.getpPhoto() %>" alt="Product Image">
                                    </div>
                                    <div class="card-body">
                                        <h5 class="card-title"><%= p.getpName() %></h5>
                                        <p class="card-text">
                                            <%= Helper.get10Words(p.getpDescp()) %>
                                        </p>
                                    </div>
                                    <div class="card-footer">
                                        <button class="btn btn-custom">Add to Cart</button>
                                        <button class="btn btn-outline-primary">
                                            &#2547;<%= p.getPriceAfterApplyingDiscount() %>/- 
                                            <span class="text-secondary discount-label">
                                                &#2547; <%= p.getpPrice() %>, <%= p.getpDiscount() %>% off
                                            </span>
                                        </button>
                                    </div>
                                </div>
                            <% 
                                }

                                if (list.size() == 0) {
                                    out.println("<h3>No item in this category</h3>");
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
