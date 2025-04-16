package com.mycompany.e.commercesite.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Fetch the current session
        HttpSession session = request.getSession(false); // Use false to avoid creating a new session if one doesn't exist

        if (session != null) {
            // Invalidate the session to log out the user
            session.invalidate();
        }

        // Redirect the user to the login page
        response.sendRedirect("login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Call the doGet method for handling POST requests as well
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "LogoutServlet handles user logout by invalidating the session and redirecting to login page.";
    }
}
