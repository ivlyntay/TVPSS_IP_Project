package bdutil;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.example.model.CrewMember;

public class HibernateCF {
    static SessionFactory sessionFactory = null;

    public static SessionFactory getSessionFactory() {
        if (sessionFactory == null) {
            // Create a Configuration instance
            Configuration config = new Configuration();
            
            // Load hibernate.cfg.xml configuration file
            config.configure("hibernate.cfg.xml");
            
            // Add annotated entity classes
            config.addAnnotatedClass(CrewMember.class);

            // Build the SessionFactory
            sessionFactory = config.buildSessionFactory();
        }
        return sessionFactory;
    }
}
