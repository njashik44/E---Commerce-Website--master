package com.mycompany.e.commercesite.servlet;

import com.mycompany.e.commercesite.entites.Cart;
import com.mycompany.e.commercesite.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class AddToCartServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            // Fetch form data
            int productId = Integer.parseInt(request.getParameter("product_id"));
            int userId = Integer.parseInt(request.getParameter("user_id"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            // Validate
            if (productId <= 0 || userId <= 0 || quantity <= 0) {
                out.println("<h3 style='color:red;'>Invalid input! Please provide valid data.</h3>");
                return;
            }

            // Create Cart object
            Cart cart = new Cart(productId, userId, quantity);

            // Save cart to database
            try {
                Session session = FactoryProvider.getFactory().openSession();
                Transaction tx = session.beginTransaction();

                session.save(cart);

                tx.commit();
                session.close();

                out.println("<h3 style='color:green;'>Product added to cart successfully!</h3>");
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<h3 style='color:red;'>An error occurred while adding the product to the cart.</h3>");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Handles adding products to the cart.";
    }
}
