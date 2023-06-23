package com.myadmin.controller;

import com.github.pagehelper.PageInfo;
import com.myadmin.dto.Adm;
import com.myadmin.dto.Anc;
import com.myadmin.dto.Lec;
import com.myadmin.service.AdmService;
import com.myadmin.service.AncService;
import com.myadmin.util.FileDownloadUtil;
import com.myadmin.util.FileUploadUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.List;

@Controller
@RequestMapping("/anc")
public class AncController {

    String dir = "anc/";
    @Value("${uploadimgdir}")
    String imgdir;

    @Value("${google.cal-key}")
    String googleCalKey;

    @Autowired
    AncService ancService;
    @Autowired
    BCryptPasswordEncoder encoder;


    @RequestMapping(value = "/document/fileDownload.do")
    public void fileDownload(
            @RequestParam("document_nm") String document_nm,
            HttpSession session,
            HttpServletRequest req,
            HttpServletResponse res,
            ModelAndView mav) throws Throwable {
        try {
            String fileName = document_nm;
            String filePath = imgdir + fileName;
            FileDownloadUtil.downloadFile(filePath, fileName, req, res);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/add")
    public String add(Model model){
        model.addAttribute("center", dir+"add");
        return "index";
    }
    @RequestMapping("/all")
    public String all(@RequestParam(required = false, defaultValue= "1") int pageNo, Model model) throws Exception {
        PageInfo<Anc> p;
        try {
            p=new PageInfo<>(ancService.getPage(pageNo), 5);
            model.addAttribute("cpage",p);
            model.addAttribute("center",dir+"all");
            model.addAttribute("target","anc");
            model.addAttribute("function","all");
        } catch (Exception e) {
            throw new Exception("anc all error");
        }
        return "index";
    }
    @RequestMapping("/addimpl")
    public String addimpl(Model model, @Validated Anc anc, Errors errors) throws Exception {
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
        MultipartFile mf = anc.getImgfile();
        String img = mf.getOriginalFilename();
        anc.setImg(img);
        try {
            ancService.register(anc);
            FileUploadUtil.saveFile(mf,imgdir);
        } catch (Exception e) {
            throw new Exception("anc add error");
        }

        model.addAttribute("imgname", img);
//        model.addAttribute("center", dir + "all");
//        model all로 던지면 foreach 오류가 발생. list를 model로 또 던져줘야함
        return "redirect:/anc/all";
    }

    @RequestMapping("/detail")
    public String detail(Model model, Integer id) throws Exception {
        try {
            Anc anc = ancService.get(id);
            model.addAttribute("anc", anc);
            model.addAttribute("center", dir+"detail");
        } catch (Exception e) {
            throw new Exception("anc detail error");
        }
        return "index";
    }
    @RequestMapping("/edit")
    public String edit(Model model, Integer id) throws Exception {
        try {
            Anc anc = ancService.get(id);
            model.addAttribute("anc", anc);
        model.addAttribute("center", dir+"edit");
    } catch (Exception e) {
            throw new Exception("anc edit error");
        }
        return "index";
    }
    @RequestMapping("/updateimpl")
    public String updateimpl(Model model, @Validated Anc anc, Errors errors) throws Exception {
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
        MultipartFile mf = anc.getImgfile();
        String new_img = mf.getOriginalFilename();
        if(new_img==null || new_img.equals("")){
            try {
                ancService.modify(anc);
            } catch (Exception e) {
                throw new Exception("anc modify error");
            }
        } else{
            try {
                anc.setImg(new_img);
                ancService.modify(anc);
                FileUploadUtil.saveFile(mf, imgdir);
            } catch (Exception e) {
                throw new Exception("anc modify error");
            }
        }
        return "redirect:/anc/detail?id="+anc.getId();
    }

    @RequestMapping("/deleteimpl")
    public String deleteimpl(Model model, Integer id) throws Exception {
        try {
            ancService.remove(id);
        } catch (Exception e) {
            throw new Exception("anc delete error");
        }
        return "redirect:/anc/all";
    }
    @RequestMapping("/cal")
    public String cal(Model model){
        model.addAttribute("center",dir+"cal");
        model.addAttribute("googleCalKey", googleCalKey);
        return "index";
    }
}
