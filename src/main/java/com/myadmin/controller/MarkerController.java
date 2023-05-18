package com.myadmin.controller;

import com.myadmin.dto.Lecture;
import com.myadmin.dto.Marker;
import com.myadmin.dto.MarkerSearch;
import com.myadmin.service.MarkerService;
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
@RequestMapping("/marker")
public class MarkerController {

    String dir = "marker/";
    @Value("${uploadimgdir}")
    String imgdir;

    @Autowired
    MarkerService markerService;

    @RequestMapping("/all")
    public String all(Model model) throws Exception {
        try {
            List<Marker> list = markerService.get();
            model.addAttribute("marker",list);
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
    public String addimpl(Model model, @Validated Marker marker, Errors errors) throws Exception {
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
        MultipartFile mf = marker.getImgfile();
        String img = mf.getOriginalFilename();
        marker.setImg(img);
        try {
            markerService.register(marker);
            FileUploadUtil.saveFile(mf, imgdir);
        } catch (Exception e) {
            throw new Exception("marker addimpl error");
        }
        return "redirect:/marker/all";
    }
    @RequestMapping("/detail")
    public String detail(Model model, Integer id) throws Exception {
        try {
            Marker marker = markerService.get(id);
            model.addAttribute("marker", marker);
            model.addAttribute("center", dir+"detail");
        } catch (Exception e) {
            throw new Exception("marker detail error");
        }
        return "index";
    }
    @RequestMapping("/updateimpl")
    public String updateimpl(Model model, @Validated Marker marker, Errors errors) throws Exception {
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
        MultipartFile mf = marker.getImgfile();
        String new_img = mf.getOriginalFilename();
        if(new_img==null || new_img.equals("")){
            try {
                markerService.modify(marker);
            } catch (Exception e) {
                throw new Exception("marker modify error");
            }
        } else{
            try {
                marker.setImg(new_img);
                markerService.modify(marker);
                FileUploadUtil.saveFile(mf, imgdir);
            } catch (Exception e) {
                throw new Exception("marker modify error");
            }
        }
        return "redirect:/marker/detail?id="+marker.getId();
    }
    @RequestMapping("/deleteimpl")
    public String deleteimpl(Model model, Integer id) throws Exception {
        try {
            markerService.remove(id);
        } catch (Exception e) {
            throw new Exception("marker deleteimpl error");
        }
        return "redirect:/marker/all";
    }

    @RequestMapping("/search")
    public String search(Model model, MarkerSearch ms) throws Exception {
        List<Marker> list = markerService.search(ms);
        model.addAttribute("ms", ms);
        model.addAttribute("marker", list);
        model.addAttribute("center", dir+"all");
        return "index";
    }
}
