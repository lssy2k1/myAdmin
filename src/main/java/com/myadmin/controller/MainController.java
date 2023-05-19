package com.myadmin.controller;

import com.myadmin.dto.Marker;
import com.myadmin.service.MarkerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class MainController {

    @Autowired
    MarkerService markerService;

    @Value("${adminserver}")
    String adminserver;

    @RequestMapping("/")
    public String main(Model model) throws Exception {
        return "index";
    }
    @RequestMapping("/logins")
    public String logins(Model model){
        model.addAttribute("center", "login");
        return "index";
    }

    @RequestMapping("logouts")
    public String logouts(Model model, HttpSession session){
        if (session != null){
            session.invalidate();
        }
        return "redirect:/";
    }
    @RequestMapping("/register")
    public String register(Model model){
        model.addAttribute("center", "register");
        return "index";
    }
    @RequestMapping("/mapTest")
    public String mapTest(Model model){
        model.addAttribute("center", "mapTest");
        return "index";
    }
    @RequestMapping("/websocket")
    public String websocket(Model model){
        model.addAttribute("adminserver", adminserver);
        model.addAttribute("center", "websocket");
        return "index";
    }
    @RequestMapping("/oneonone")
    public String oneonone(Model model){
        model.addAttribute("adminserver", adminserver);
        model.addAttribute("center", "oneonone");
        return "index";
    }
    @RequestMapping("/chatbot")
    public String chatbot(Model model){
        model.addAttribute("adminserver", adminserver);
        model.addAttribute("center", "chatbot");
        return "index";
    }
}
