package com.myadmin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/lecture")
public class LectureController {
    String dir = "lecture/";

    @RequestMapping("/all")
    public String all(Model model){
        model.addAttribute("center", dir+"all");
        return "index";
    }
    @RequestMapping("/add")
    public String add(Model model){
        model.addAttribute("center", dir+"add");
        return "index";
    }
}
