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
@Slf4j
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

    @RequestMapping("/allstdn")
    public String allstdn(@RequestParam(required = false, defaultValue= "1") int pageNo, Model model) throws Exception {
        PageInfo<Ord> p;
        try {
            p=new PageInfo<>(ordService.getPage(pageNo), 5);
            model.addAttribute("cpage",p);
            model.addAttribute("center",dir+"allstdn");
            model.addAttribute("target","ord");
            model.addAttribute("function","allstdn");
        } catch (Exception e) {
            throw new Exception("ord all error");
        }
        return "index";
    }
    @RequestMapping("/detailstdn")
    public String detailstdn(Model model, Integer id) throws Exception {
        try {
            List<OrdDetail> ordDetail = ordDetailService.searchOrd(id);
            model.addAttribute("ordDetail", ordDetail);
            model.addAttribute("center", dir+"detailstdn");
        } catch (Exception e) {
            throw new Exception("ord detail error");
        }
        return "index";
    }

    @RequestMapping("/alllec")
    public String alllec(@RequestParam(required = false, defaultValue= "1") int pageNo, Model model) throws Exception {
        PageInfo<OrdDetail> p;
        try {
            p=new PageInfo<>(ordDetailService.getPage(pageNo), 5);
            model.addAttribute("cpage",p);
            model.addAttribute("center",dir+"alllec");
            model.addAttribute("target","ord");
            model.addAttribute("function", "alllec");
        } catch (Exception e) {
            throw new Exception("orddetail all error");
        }
        return "index";
    }
    @RequestMapping("/detaillec")
    public String detaillec(Model model, Integer ordDetailId) throws Exception {
        try {
            List<Ord> ord = ordService.searchOrdDetail(ordDetailId);
            log.info("=============================="+ ord);
            model.addAttribute("ord", ord);
            model.addAttribute("center", dir+"detaillec");
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("orddetail detail error");
        }
        return "index";
    }
}
