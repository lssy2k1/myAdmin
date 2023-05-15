package com.myadmin.controller;

import com.myadmin.dto.Student;
import com.myadmin.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/student")
public class StudentController {

    @Autowired
    StudentService studentService;
    String dir = "student/";
    @RequestMapping("/all")
    public String all(Model model) throws Exception {
        List<Student> list = studentService.get();
        model.addAttribute("std", list);
        model.addAttribute("center", dir+"all");
        return "index";
    }
}
