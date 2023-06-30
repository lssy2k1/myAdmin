package com.myadmin.controller;


import com.github.pagehelper.PageInfo;
import com.myadmin.dto.Lec;
import com.myadmin.dto.LecSearch;
import com.myadmin.dto.SbjDetail;
import com.myadmin.dto.Stdn;
import com.myadmin.firebase.FCMService;
import com.myadmin.firebase.NotificationService;
import com.myadmin.service.LecService;
import com.myadmin.service.SbjDetailService;
import com.myadmin.service.StdnService;
import com.myadmin.util.FileUploadUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.Arrays;
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
    @Autowired
    NotificationService notificationService;
    @Autowired
    FCMService fcmService;
    @Autowired
    StdnService stdnService;

    @RequestMapping("/all")
    public String all(Model model, @RequestParam(required = false, defaultValue = "1") int pageNo) throws Exception {
        PageInfo<Lec> list;
        try {
            list = new PageInfo<>(lecService.getPage(pageNo), 10);
        } catch (Exception e) {
            throw new Exception("lecture controller all error");
        }
        model.addAttribute("target","lec");
        model.addAttribute("function", "all");
        model.addAttribute("cpage", list);
        model.addAttribute("center",dir+"all");
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
        List<String> tokens = new ArrayList<>(Arrays.asList());
        List<Stdn> stdns = stdnService.get();
        for(Stdn stdn : stdns){
            String token = notificationService.getToken("stdn_"+stdn.getId());
            if(token == null){
                continue;
            }
            tokens.add(token);
        }
        fcmService.sendAll(tokens, "강의가 추가되었습니다.", "새로운 강의를 확인해보세요.");
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
    public String search(Model model, LecSearch ls, @RequestParam(required = false, defaultValue = "1") int pageNo) throws Exception {
        PageInfo<Lec> lec = new PageInfo<>(lecService.search(pageNo, ls),10);
        model.addAttribute("target", "lec");
        model.addAttribute("function", "search");
        model.addAttribute("ls", ls);
        model.addAttribute("cpage", lec);
        model.addAttribute("center", dir+"all");
        model.addAttribute("pagination", "searchpage");
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
