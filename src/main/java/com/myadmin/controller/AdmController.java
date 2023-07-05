package com.myadmin.controller;

import com.myadmin.dto.Adm;
import com.myadmin.dto.Lec;
import com.myadmin.firebase.FCMService;
import com.myadmin.firebase.NotificationService;
import com.myadmin.service.AdmService;
import com.myadmin.util.FileUploadUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/adm")
public class AdmController {

    String dir = "adm/";
    @Autowired
    AdmService admService;
    @Autowired
    BCryptPasswordEncoder encoder;


    @RequestMapping("/all")
    public String all(Model model) throws Exception {
        try {
            List<Adm> list = admService.get();
            model.addAttribute("adm",list);
            model.addAttribute("center",dir+"all");
        } catch (Exception e) {
            throw new Exception("adm all error");
        }
        return "index";
    }
    @RequestMapping("/add")
    public String add(Model model){
        model.addAttribute("center", dir + "add");
        return "index";
    }
    @RequestMapping("/addimpl")
    public String addimpl(Model model, @Validated Adm adm, Errors errors, HttpSession session) throws Exception {
//        validate랑 에러가 같이 움직이는 것 같다고 하심! 그래서 세션을 validate랑 에러 사이에 넣으면 에러메시지가 요~상하게 나옴
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
        try {
            adm.setPwd(encoder.encode(adm.getPwd()));
            admService.register(adm);
            session.setMaxInactiveInterval(600000);
            session.setAttribute("loginadm", adm);
        } catch (Exception e) {
            throw new Exception("adm add error");
        }
        model.addAttribute("adm", adm);
        return "redirect:/";
    }
    @RequestMapping("/addpageimpl")
    public String addpageimpl(Model model, @Validated Adm adm, Errors errors) throws Exception {
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
        try {
            adm.setPwd(encoder.encode(adm.getPwd()));
            admService.register(adm);
            List<Adm> list = admService.get();
            model.addAttribute("adm",list);
            model.addAttribute("center",dir+"all");
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("adm add and all error");
        }
        return "index";
    }
    @RequestMapping("/detail")
    public String detail(Model model, String id) throws Exception {
        try {
            Adm adm = admService.get(id);
            model.addAttribute("adm", adm);
            model.addAttribute("center", dir+"detail");
        } catch (Exception e) {
            throw new Exception("adm detail error");
        }
        return "index";
    }
    @RequestMapping("/edit")
    public String edit(Model model, String id) throws Exception {
        try {
            Adm adm = admService.get(id);
            model.addAttribute("adm", adm);
            model.addAttribute("center", dir+"edit");
        } catch (Exception e) {
            throw new Exception("adm edit error");
        }
        return "index";
    }
    @RequestMapping("/updateimpl")
    public String updateimpl(Model model, @Validated Adm adm, Errors errors) throws Exception {
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
        try {
            adm.setPwd(encoder.encode(adm.getPwd()));
            admService.modify(adm);
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("adm update error");
        }
        return "redirect:/adm/detail?id="+adm.getId();
    }

    @RequestMapping("/deleteimpl")
    public String deleteimpl(Model model, String id) throws Exception {
        try {
            admService.remove(id);
        } catch (Exception e) {
            throw new Exception("adm delete error");
        }
        return "redirect:/adm/all";
    }
}
