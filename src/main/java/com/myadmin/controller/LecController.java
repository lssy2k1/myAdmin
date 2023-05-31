package com.myadmin.controller;


import com.myadmin.dto.Lec;
import com.myadmin.dto.LecSearch;
import com.myadmin.dto.SbjDetail;
import com.myadmin.service.LecService;
import com.myadmin.service.SbjDetailService;
import com.myadmin.util.FileUploadUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Controller
@RequestMapping("/lec")
public class LecController {

    String dir = "lec/";

    @Value("${uploadimgdir}")
    String imgdir;

    @Autowired
    LecService lecService;
    @Autowired
    SbjDetailService sbjDetailService;

    @RequestMapping("/all")
    public String all(Model model) throws Exception {
        try {
            List<Lec> list = lecService.get();
            model.addAttribute("lec", list);
            model.addAttribute("center", dir+"all");
        } catch (Exception e) {
            throw new Exception("lecture controller all error");
        }
        return "index";
    }
    @RequestMapping("/add")
    public String add(Model model){
        try {
            List<SbjDetail> sbjlistbig = sbjDetailService.searchBig();
            List<SbjDetail> sbjlist = sbjDetailService.get();
            model.addAttribute("sbjlist", sbjlist);
            model.addAttribute("sbjlistbig", sbjlistbig);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        model.addAttribute("center", dir+"add");
        return "index";
    }
    @RequestMapping("/addimpl")
    public String addimpl(Model model, @Validated Lec lec, Errors errors) throws Exception {
        if(errors.hasErrors()){
            List<ObjectError> es = errors.getAllErrors();
            String msg = "";
            for(ObjectError e: es){
                msg += "<h4>";
                msg += e.getDefaultMessage();
                msg += "</h4>";
            }
            throw new Exception(msg);
        }
        MultipartFile mf = lec.getImgfile();
        String img = mf.getOriginalFilename();
        lec.setImg(img);
        try {
            lecService.register(lec);
            FileUploadUtil.saveFile(mf, imgdir);
        } catch (Exception e) {
            throw new Exception("lecture addimpl error");
        }
        return "redirect:/lec/all";
    }
    @RequestMapping("/detail")
    public String detail(Model model, Integer id) throws Exception {
        try {
            Lec lec = lecService.get(id);
            model.addAttribute("lec", lec);
            model.addAttribute("center", dir+"detail");
        } catch (Exception e) {
            throw new Exception("lecture detail error");
        }
        return "index";
    }
    @RequestMapping("/edit")
    public String edit(Model model, Integer id) throws Exception {
        try {
            Lec lec = lecService.get(id);
            model.addAttribute("lec", lec);
            model.addAttribute("center", dir+"edit");
        } catch (Exception e) {
            throw new Exception("lecture detail error");
        }
        return "index";
    }
    @RequestMapping("/updateimpl")
    public String updateimpl(Model model, @Validated Lec lec, Errors errors) throws Exception {
        if(errors.hasErrors()){
            List<ObjectError> es = errors.getAllErrors();
            String msg = "";
            for(ObjectError e: es){
                msg += "<h4>";
                msg += e.getDefaultMessage();
                msg += "</h4>";
            }
            throw new Exception(msg);
        }
        MultipartFile mf = lec.getImgfile();
        String new_img = mf.getOriginalFilename();
        if(new_img==null || new_img.equals("")){
            try {
                lecService.modify(lec);
            } catch (Exception e) {
                throw new Exception("lecture modify error");
            }
        } else{
            try {
                lec.setImg(new_img);
                lecService.modify(lec);
                FileUploadUtil.saveFile(mf, imgdir);
            } catch (Exception e) {
                throw new Exception("lecture modify error");
            }
        }
        return "redirect:/lec/detail?id="+lec.getId();
    }
    @RequestMapping("/deleteimpl")
    public String deleteimpl(Model model, Integer id) throws Exception {
        try {
            lecService.remove(id);
        } catch (Exception e) {
            throw new Exception("lecture deleteimpl error");
        }
        return "redirect:/lec/all";
    }

    @RequestMapping("/search")
    public String search(Model model, LecSearch ls) throws Exception {
        List<Lec> lec = lecService.search(ls);
        model.addAttribute("ls", ls);
        model.addAttribute("lec", lec);
        model.addAttribute("center", dir+"all");
        return "index";
    }
    @RequestMapping("/sbj/add")
    public String sbjadd(Model model){
        try {
            List<SbjDetail> sbjlistbig = sbjDetailService.searchBig();
            List<SbjDetail> sbjlist = sbjDetailService.get();
            model.addAttribute("sbjlist", sbjlist);
            model.addAttribute("sbjlistbig", sbjlistbig);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
        model.addAttribute("center", dir+"sbjadd");
        return "index";
    }
}
