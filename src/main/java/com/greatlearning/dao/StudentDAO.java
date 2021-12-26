package com.greatlearning.dao;

import com.greatlearning.entity.Student;

import java.util.List;

public interface StudentDAO {
    public List<Student> getStudents();

    public void saveStudent(Student student);

    public Student updateStudent(int studentId);

    public void deleteStudent(int studentId);
}
