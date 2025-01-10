package com.example.repository;

import com.example.model.CrewMember;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public class CrewMemberDao {

    @Autowired
    private SessionFactory sessionFactory;

    // Get all crew members
    public List<CrewMember> getAllCrewMembers() {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("from CrewMember", CrewMember.class).list();
        }
    }

    // Get crew member by ID
    public CrewMember getCrewMemberById(int id) {
        try (Session session = sessionFactory.openSession()) {
            return session.get(CrewMember.class, id);
        }
    }

    // Save a crew member
    public void saveCrewMember(CrewMember crewMember) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.save(crewMember);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            throw e;
        }
    }

    // Update a crew member
    public void updateCrewMember(CrewMember crewMember) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.update(crewMember);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            throw e;
        }
    }

    // Delete a crew member by ID
    public void deleteCrewMember(int id) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            CrewMember crewMember = session.get(CrewMember.class, id);
            if (crewMember != null) {
                session.delete(crewMember);
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            throw e;
        }
    }
}
