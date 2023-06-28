package com.myadmin.controller;

import com.github.pagehelper.PageInfo;
import com.myadmin.dto.*;
import com.myadmin.service.*;
import com.myadmin.util.GetTimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/stdy")
public class StdyController {

    @Autowired
    StdyService stdyService;

    String dir = "stdy/";

    @RequestMapping("/ing")
    public String stdying(@RequestParam(required = false, defaultValue = "1") int pageNo, Model model) throws Exception{
        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
        String currentDate = dateFormat.format(date);
        PageInfo<Stdy> p;
        try {
            p = new PageInfo<>(stdyService.stdypage(pageNo), 10);
        } catch (Exception e) {
            throw new Exception("시스템 장애: ER0001");
        }
        model.addAttribute("target","stdy");
        model.addAttribute("function", "ing");
        model.addAttribute("currentDate", currentDate);
        model.addAttribute("cpage", p);
        model.addAttribute("center",dir+"stdying");
        return "index";
    }
}
