package com.myadmin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/student")
public class StudentController {

    String dir = "student/";
    @RequestMapping("/all")
    public String main(Model model) {
        model.addAttribute("center", dir+"all");
        return "index";
    }
}
