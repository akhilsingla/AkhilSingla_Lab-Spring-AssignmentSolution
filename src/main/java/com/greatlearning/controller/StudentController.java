package com.greatlearning.controller;

import com.greatlearning.entity.Student;
import com.greatlearning.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/student")
public class StudentController {
    @Autowired
    StudentService studentService;

    @RequestMapping("/list")
    public String listStudents(Model model) {
        List<Student> studentList = studentService.getStudents();
        model.addAttribute("students", studentService.getStudents());
        return "student-list";
    }

    @RequestMapping("/addStudent")
    public String addStudent(Model model) {
        Student student = new Student();
        model.addAttribute("student", student);
        return "add-student";
    }

    @PostMapping("/saveStudent")
    public String saveStudent(@ModelAttribute(name = "student") Student student) {
        studentService.saveStudent(student);
        return "redirect:/student/list?isSuccess=true";
    }

    @RequestMapping("/updateForm")
    public String updateStudent(@RequestParam("studentId") int studentId, Model model) {
        Student student = studentService.updateStudent(studentId);
        model.addAttribute("student", student);
        return "add-student";
    }

    @RequestMapping("/deleteStudent")
    public String deleteStudent(@RequestParam("studentId") int studentId) {
        studentService.deleteStudent(studentId);
        return "redirect:/student/list?isDeleteSuccess=true";
    }
}
