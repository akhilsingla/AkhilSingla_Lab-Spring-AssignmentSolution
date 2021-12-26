package com.greatlearning.service;

import com.greatlearning.dao.StudentDAO;
import com.greatlearning.entity.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class StudentServiceImpl implements StudentService {

    @Autowired
    StudentDAO studentDAO;

    @Override
    @Transactional
    public List<Student> getStudents() {
        return studentDAO.getStudents();
    }

    @Override
    @Transactional
    public void saveStudent(Student student) {
        studentDAO.saveStudent(student);
    }

    @Override
    @Transactional
    public Student updateStudent(int studentId) {
        return studentDAO.updateStudent(studentId);
    }

    @Override
    @Transactional
    public void deleteStudent(int studentId) {
        studentDAO.deleteStudent(studentId);
    }
}
