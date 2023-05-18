package com.myadmin.controller;

import com.myadmin.dto.Lecture;
import com.myadmin.dto.LectureSearch;
import com.myadmin.dto.Marker;
import com.myadmin.dto.MarkerSearch;
import com.myadmin.service.LectureService;
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

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/lecture")
public class LectureController {

    String dir = "lecture/";

    @Value("${uploadimgdir}")
    String imgdir;

    @Autowired
    LectureService lectureService;

    @RequestMapping("/all")
    public String all(Model model) throws Exception {
        try {
            List<Lecture> list = lectureService.get();
            model.addAttribute("lecture", list);
            model.addAttribute("center", dir+"all");
        } catch (Exception e) {
            throw new Exception("lecture controller all error");
        }
        return "index";
    }
    @RequestMapping("/add")
    public String add(Model model){
        model.addAttribute("center", dir+"add");
        return "index";
    }
    @RequestMapping("/addimpl")
    public String addimpl(Model model, @Validated Lecture lecture, Errors errors) throws Exception {
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
        MultipartFile mf = lecture.getImgfile();
        String img = mf.getOriginalFilename();
        lecture.setImg(img);
        try {
            lectureService.register(lecture);
            FileUploadUtil.saveFile(mf, imgdir);
        } catch (Exception e) {
            throw new Exception("lecture addimpl error");
        }
        return "redirect:/lecture/all";
    }
    @RequestMapping("/detail")
    public String detail(Model model, Integer id) throws Exception {
        try {
            Lecture lecture = lectureService.get(id);
            model.addAttribute("lecture", lecture);
            model.addAttribute("center", dir+"detail");
        } catch (Exception e) {
            throw new Exception("lecture detail error");
        }
        return "index";
    }
    @RequestMapping("/updateimpl")
    public String updateimpl(Model model, @Validated Lecture lecture, Errors errors) throws Exception {
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
        MultipartFile mf = lecture.getImgfile();
        String new_img = mf.getOriginalFilename();
        if(new_img==null || new_img.equals("")){
            try {
                lectureService.modify(lecture);
            } catch (Exception e) {
                throw new Exception("lecture modify error");
            }
        } else{
            try {
                lecture.setImg(new_img);
                lectureService.modify(lecture);
                FileUploadUtil.saveFile(mf, imgdir);
            } catch (Exception e) {
                throw new Exception("lecture modify error");
            }
        }
        return "redirect:/lecture/detail?id="+lecture.getId();
    }
    @RequestMapping("/deleteimpl")
    public String deleteimpl(Model model, Integer id) throws Exception {
        try {
            lectureService.remove(id);
        } catch (Exception e) {
            throw new Exception("lecture deleteimpl error");
        }
        return "redirect:/lecture/all";
    }

    @RequestMapping("/search")
    public String search(Model model, LectureSearch ls) throws Exception {
        List<Lecture> lecture = lectureService.search(ls);
        model.addAttribute("ls", ls);
        model.addAttribute("lecture", lecture);
        model.addAttribute("center", dir+"all");
        return "index";
    }
}
