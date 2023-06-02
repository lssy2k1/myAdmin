package com.myadmin.controller;

import com.myadmin.dto.Stdn;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/test")
public class TestController {
    String dir = "test/";

    @RequestMapping("/maketest")
    public String all(Model model) throws Exception {
        model.addAttribute("center", dir+"maketest");
        return "index";
    }

}
