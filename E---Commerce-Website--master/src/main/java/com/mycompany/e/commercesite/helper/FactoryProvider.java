package com.mycompany.e.commercesite.helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {
    private static SessionFactory factory;
    public static SessionFactory getFactory;

    public static SessionFactory getFactory() {
        if (factory == null) {
            try {
                factory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
            } catch (Exception e) {
                System.err.println("Error creating SessionFactory");
                e.printStackTrace();
                throw new RuntimeException("Failed to initialize Hibernate SessionFactory", e);
            }
        }
        return factory;
    }

    public static void closeFactory() {
        if (factory != null) {
            factory.close();
        }
    }
}