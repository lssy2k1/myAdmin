package com.myadmin.controller;

import com.myadmin.dto.Lecture;
import com.myadmin.service.LectureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/lecture")
public class LectureController {

    String dir = "lecture/";

    @Value("${uploadimgdir}")
    String imgdir;

    @Autowired
    LectureService lectureService;

    @RequestMapping("/all")
    public String all(Model model) throws Exception {
        try {
            List<Lecture> list = lectureService.get();
            model.addAttribute("lecture", list);
            model.addAttribute("center", dir+"all");
        } catch (Exception e) {
            throw new Exception("lecture controller all error");
        }
        return "index";
    }
    @RequestMapping("/add")
    public String add(Model model){
        model.addAttribute("center", dir+"add");
        return "index";
    }
}
