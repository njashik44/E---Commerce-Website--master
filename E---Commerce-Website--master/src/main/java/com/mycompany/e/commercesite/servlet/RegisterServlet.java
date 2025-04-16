package com.mycompany.e.commercesite.servlet;

import com.mycompany.e.commercesite.entites.User;
import com.mycompany.e.commercesite.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class RegisterServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            // Fetching form data
            String userName = request.getParameter("user_name");
            String userEmail = request.getParameter("user_email");
            String userPassword = request.getParameter("user_password");
            String userPhone = request.getParameter("user_phone");
            String userAddress = request.getParameter("user_address");

            // Debugging: Print form data to check
            System.out.println("Debug: Received form data");
            System.out.println("User Name: " + userName);
            System.out.println("User Email: " + userEmail);
            System.out.println("User Password: " + userPassword);
            System.out.println("User Phone: " + userPhone);
            System.out.println("User Address: " + userAddress);

            // Validate form data
            if (userName == null || userName.isEmpty() ||
                userEmail == null || userEmail.isEmpty() ||
                userPassword == null || userPassword.isEmpty() ||
                userPhone == null || userPhone.isEmpty() ||
                userAddress == null || userAddress.isEmpty()) {
                out.println("<h3 style='color:red;'>All fields are required!</h3>");
                return;
            }

            // Set default userType as "normal"
            String userType = "normal";

            // Create User object
            User user = new User(userName, userEmail, userPassword, userPhone, "default.jpg", userAddress, userType);

            // Hibernate: Save user to the database
            try {
                Session session = FactoryProvider.getFactory().openSession();
                Transaction tx = session.beginTransaction();

                int userId = (int) session.save(user); // Save user and get the generated ID
                tx.commit();
                session.close();

                // Success response
                request.setAttribute("message", "Registration Successful! Your User ID is: " + userId);
                request.getRequestDispatcher("message.jsp").forward(request, response);

            } catch (Exception e) {
                // Handle exception and print error details
                e.printStackTrace();
                out.println("<h3 style='color:red;'>An error occurred: " + e.getMessage() + "</h3>");
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
        return "Handles user registration";
    }
}
