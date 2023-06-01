package com.myadmin.controller;


import com.github.pagehelper.PageInfo;
import com.myadmin.dto.Ord;
import com.myadmin.dto.OrdDetail;
import com.myadmin.service.OrdDetailService;
import com.myadmin.service.OrdService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/orddetail")
public class OrdDetailController {

    @Autowired
    OrdDetailService ordDetailService;

    @Value("${uploadimgdir}")
    String imgdir;

    String dir = "orddetail/";

    @RequestMapping("/all")
    public String all(@RequestParam(required = false, defaultValue= "1") int pageNo, Model model) throws Exception {
        PageInfo<OrdDetail> p;
        try {
            p=new PageInfo<>(ordDetailService.getPage(pageNo), 5);
            model.addAttribute("cpage",p);
            model.addAttribute("center",dir+"all");
            model.addAttribute("target","orddetail");
        } catch (Exception e) {
            throw new Exception("orddetail all error");
        }
        return "index";
    }
//    @RequestMapping("/detail")
//    public String detail(Model model, Integer id) throws Exception {
//        try {
//            Ord ord = ordService.get(id);
//            model.addAttribute("ord", ord);
//            model.addAttribute("center", dir+"detail");
//        } catch (Exception e) {
//            throw new Exception("ord detail error");
//        }
//        return "index";
//    }
}
