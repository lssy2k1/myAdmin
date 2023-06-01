package com.myadmin.controller;


import com.github.pagehelper.PageInfo;
import com.myadmin.dto.Anc;
import com.myadmin.dto.Ord;
import com.myadmin.dto.OrdDetail;
import com.myadmin.service.OrdDetailService;
import com.myadmin.service.OrdService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/ord")
public class OrdController {

    @Autowired
    OrdService ordService;
    @Autowired
    OrdDetailService ordDetailService;

    @Value("${uploadimgdir}")
    String imgdir;

    String dir = "ord/";

    @RequestMapping("/all")
    public String all(@RequestParam(required = false, defaultValue= "1") int pageNo, Model model) throws Exception {
        PageInfo<Ord> p;
        try {
            p=new PageInfo<>(ordService.getPage(pageNo), 5);
            model.addAttribute("cpage",p);
            model.addAttribute("center",dir+"all");
            model.addAttribute("target","ord");
        } catch (Exception e) {
            throw new Exception("ord all error");
        }
        return "index";
    }
    @RequestMapping("/detail")
    public String detail(Model model, Integer id) throws Exception {
        try {
            List<OrdDetail> ordDetail = ordDetailService.searchOrd(id);
            model.addAttribute("ordDetail", ordDetail);
            model.addAttribute("center", dir+"detail");
        } catch (Exception e) {
            throw new Exception("ord detail error");
        }
        return "index";
    }
}
