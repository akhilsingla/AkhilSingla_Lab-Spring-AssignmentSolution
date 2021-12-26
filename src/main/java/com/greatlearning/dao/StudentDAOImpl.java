package com.greatlearning.dao;

import com.greatlearning.entity.Student;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class StudentDAOImpl implements StudentDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Student> getStudents() {

        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("from Student", Student.class).list();
    }

    @Override
    public void saveStudent(Student student) {
        Session session = sessionFactory.getCurrentSession();
        System.out.println(student);
        session.saveOrUpdate(student);
    }

    @Override
    public Student updateStudent(int studentId) {
        Session session = sessionFactory.getCurrentSession();
        return session.get(Student.class, studentId);
    }

    @Override
    public void deleteStudent(int studentId) {
        Session session = sessionFactory.getCurrentSession();
        session.delete(session.get(Student.class, studentId));
    }
}
