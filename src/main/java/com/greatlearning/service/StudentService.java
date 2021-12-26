package com.greatlearning.service;

import com.greatlearning.entity.Student;

import java.util.List;

public interface StudentService {

    public List<Student> getStudents();

    public void saveStudent(Student student);

    public Student updateStudent(int studentId);

    public void deleteStudent(int studentId);
}
