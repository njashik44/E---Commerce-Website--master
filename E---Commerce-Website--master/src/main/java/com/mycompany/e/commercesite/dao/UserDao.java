package com.mycompany.e.commercesite.dao;

import com.mycompany.e.commercesite.entites.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class UserDao {
    
    private SessionFactory factory;

    public UserDao(SessionFactory factory) {
        this.factory = factory;
    }

    // Get user by email and password
    public User getUserAndPassword(String email, String password) {
        User user = null;

        try (Session session = this.factory.openSession()) {
            String query = "FROM User WHERE userEmail = :e AND userPassword = :p";
            Query<User> q = session.createQuery(query, User.class);
            q.setParameter("e", email);
            q.setParameter("p", password);

            // Fetch result
            user = q.uniqueResult(); // Get the single result or null
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }
}
