package com.myadmin.controller;

import com.myadmin.dto.*;
import com.myadmin.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
@RequestMapping("/stdn")
public class StdnController {

    @Autowired
    StdnService stdnService;
    @Autowired
    MyPageService myPageService;
    @Autowired
    AttdService attdService;
    @Autowired
    AttdTrckrService attdTrckrService;
    @Autowired
    TestTrckrService testTrckrService;
    @Autowired
    BCryptPasswordEncoder encoder;
    String dir = "stdn/";

    @RequestMapping("/all")
    public String all(Model model) throws Exception {
        List<Stdn> list = stdnService.get();
        model.addAttribute("std", list);
        model.addAttribute("center", dir+"all");
        return "index";
    }

    @RequestMapping("/add")
    public String add(Model model, String id, HttpSession session){
//        Adm adm = null;
//        adm = (Adm) session.getAttribute("loginadm");
//        System.out.println("--------------------------------");
//        System.out.println(adm.getId());
//        System.out.println("--------------------------------");
        model.addAttribute("center", dir+"add");
        return "index";
    }

    @RequestMapping("/addimpl")
    public String addimpl(Model model, @Validated Stdn std, Errors errors) throws Exception {
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
        std.setPwd(encoder.encode(std.getPwd()));
        stdnService.register(std);
        return "redirect:/stdn/all";
    }

    @RequestMapping("/detail")
    public String detail(Model model, String id) throws Exception {
        try {
            Stdn stdn = stdnService.get(id);
            MyPage myPage = myPageService.get(id);
            Attd attd = attdService.get(id);

            ArrayList<AttdTrckr> data2 = new ArrayList<>();
            ArrayList<AttdTrckr> data3 = new ArrayList<>();
            ArrayList<AttdTrckr> data4 = new ArrayList<>();
            ArrayList<AttdTrckr> data5 = new ArrayList<>();
            ArrayList<AttdTrckr> data6 = new ArrayList<>();
            ArrayList<AttdTrckr> data7 = new ArrayList<>();

            List<AttdTrckr> attdList = attdTrckrService.trckattd(id);
            for (AttdTrckr a:attdList) {
                if (a.getMonth().equals("02")) {
                    data2.add(a);
                } if (a.getMonth().equals("03")) {
                    data3.add(a);
                } if (a.getMonth().equals("04")) {
                    data4.add(a);
                } if (a.getMonth().equals("05")) {
                    data5.add(a);
                } if (a.getMonth().equals("06")) {
                    data6.add(a);
                } if (a.getMonth().equals("07")) {
                    data7.add(a);
                }
            }

            ArrayList<TestTrckr> test2 = new ArrayList<>();
            ArrayList<TestTrckr> test3 = new ArrayList<>();
            ArrayList<TestTrckr> test4 = new ArrayList<>();
            ArrayList<TestTrckr> test5 = new ArrayList<>();
            ArrayList<TestTrckr> test6 = new ArrayList<>();
            ArrayList<TestTrckr> test7 = new ArrayList<>();

            List<TestTrckr> testList = testTrckrService.trcktest(id);
            for (TestTrckr t:testList) {
                if (t.getMonth().equals("02")) {
                    test2.add(t);
                } if (t.getMonth().equals("03")) {
                    test3.add(t);
                } if (t.getMonth().equals("04")) {
                    test4.add(t);
                } if (t.getMonth().equals("05")) {
                    test5.add(t);
                } if (t.getMonth().equals("06")) {
                    test6.add(t);
                } if (t.getMonth().equals("07")) {
                    test7.add(t);
                }
            }

            model.addAttribute("stdn", stdn);
            model.addAttribute("mypage", myPage);
            model.addAttribute("attd", attd);
            model.addAttribute("data1",data2);
            model.addAttribute("data2",data3);
            model.addAttribute("data3",data4);
            model.addAttribute("data4",data5);
            model.addAttribute("data5",data6);
            model.addAttribute("data6",data7);
            model.addAttribute("test1", test2);
            model.addAttribute("test2", test3);
            model.addAttribute("test3", test4);
            model.addAttribute("test4", test5);
            model.addAttribute("test5", test6);
            model.addAttribute("test6", test7);
            model.addAttribute("center", dir+"detail");
        } catch (Exception e) {
            throw new Exception("Student detail error");
        }
        return "index";
    }
    @RequestMapping("/updateimpl")
    public String updateimpl(Model model, @Validated Stdn std, Errors errors) throws Exception {
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
            std.setPwd(encoder.encode(std.getPwd()));
            stdnService.modify(std);
        } catch (Exception e) {
            throw new Exception("Student update error");
        }
        return "redirect:/stdn/detail?id="+std.getId();
    }
    @RequestMapping("/deleteimpl")
    public String deleteimpl(Model model, String id) throws Exception {
        try {
            stdnService.remove(id);
        } catch (Exception e) {
            throw new Exception("Student delete error");
        }
        return "redirect:/stdn/all";
    }
}
