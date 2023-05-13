package com.myadmin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/adm")
public class AdmController {

    String dir = "adm/";
    @RequestMapping("/all")
    public String main(Model model){
        model.addAttribute("center",dir+"all");
        return "index";
    }

}
