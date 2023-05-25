package com.myadmin.controller;


import com.myadmin.dto.Mrk;
import com.myadmin.dto.MrkSearch;
import com.myadmin.service.MrkService;
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
@RequestMapping("/mrk")
public class MrkController {

    String dir = "mrk/";
    @Value("${uploadimgdir}")
    String imgdir;

    @Autowired
    MrkService mrkService;

    @RequestMapping("/all")
    public String all(Model model) throws Exception {
        try {
            List<Mrk> list = mrkService.get();
            model.addAttribute("mrk",list);
            model.addAttribute("center",dir+"all");
        } catch (Exception e) {
            throw new Exception("marker all error");
        }
        return "index";
    }
    @RequestMapping("/add")
    public String add(Model model){
        model.addAttribute("center", dir+"add");
        return "index";
    }
    @RequestMapping("/addimpl")
    public String addimpl(Model model, @Validated Mrk mrk, Errors errors) throws Exception {
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
        MultipartFile mf = mrk.getImgfile();
        String img = mf.getOriginalFilename();
        mrk.setImg(img);
        try {
            mrkService.register(mrk);
            FileUploadUtil.saveFile(mf, imgdir);
        } catch (Exception e) {
            throw new Exception("marker addimpl error");
        }
        return "redirect:/mrk/all";
    }
    @RequestMapping("/detail")
    public String detail(Model model, Integer id) throws Exception {
        try {
            Mrk mrk = mrkService.get(id);
            model.addAttribute("mrk", mrk);
            model.addAttribute("center", dir+"detail");
        } catch (Exception e) {
            throw new Exception("marker detail error");
        }
        return "index";
    }
    @RequestMapping("/updateimpl")
    public String updateimpl(Model model, @Validated Mrk mrk, Errors errors) throws Exception {
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
        MultipartFile mf = mrk.getImgfile();
        String new_img = mf.getOriginalFilename();
        if(new_img==null || new_img.equals("")){
            try {
                mrkService.modify(mrk);
            } catch (Exception e) {
                throw new Exception("marker modify error");
            }
        } else{
            try {
                mrk.setImg(new_img);
                mrkService.modify(mrk);
                FileUploadUtil.saveFile(mf, imgdir);
            } catch (Exception e) {
                throw new Exception("marker modify error");
            }
        }
        return "redirect:/mrk/detail?id="+mrk.getId();
    }
    @RequestMapping("/deleteimpl")
    public String deleteimpl(Model model, Integer id) throws Exception {
        try {
            mrkService.remove(id);
        } catch (Exception e) {
            throw new Exception("marker deleteimpl error");
        }
        return "redirect:/mrk/all";
    }

    @RequestMapping("/search")
    public String search(Model model, MrkSearch ms) throws Exception {
        List<Mrk> list = mrkService.search(ms);
        model.addAttribute("ms", ms);
        model.addAttribute("mrk", list);
        model.addAttribute("center", dir+"all");
        return "index";
    }
}
