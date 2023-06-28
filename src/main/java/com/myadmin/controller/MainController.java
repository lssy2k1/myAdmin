package com.myadmin.controller;

import com.myadmin.dto.*;
import com.myadmin.service.*;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
@Slf4j
@Controller
public class MainController {

    @Autowired
    LecService lecService;
    @Autowired
    MrkService mrkService;
    @Autowired
    AdmService admService;
    @Autowired
    StdnService stdnService;
    @Autowired
    AttdService attdService;
    @Autowired
    StdyService stdyService;
    @Autowired
    BCryptPasswordEncoder encoder;

    @Value("${adminserver}")
    String adminserver;

    @RequestMapping("/")
    public String main(Model model) throws Exception {
        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
        String currentDate = dateFormat.format(date);
        List<Stdn> approveList = new ArrayList<>();
        List<Stdn> totalList = stdnService.get();
        List<Stdn> lateList =stdnService.latestdn();
        List<Stdy> stdyingList = stdyService.stdying();
        List<Lec> hotlec = lecService.hotlec();
        Stdn topstdn = stdnService.topstdn();
        Stdn topfront = stdnService.topfront();
        Stdn topback = stdnService.topback();
//        List<Lec> recentlec = lecService.recentlec();
//        log.info("recentlec111111={}", recentlec);
        for (Stdn s:totalList) {
            if (s.getIsJoin().equals("0")) {
                approveList.add(s);
            }
        }
        int approveCnt = approveList.size();
        int attdCnt = lateList.size();
        int total = totalList.size();
        int stdyingCnt = stdyingList.size();
        double approvePer = (double)approveCnt/total*100;
        DecimalFormat decimalFormat = new DecimalFormat("#0.00");
        String formattedApprovePer = decimalFormat.format(approvePer);
        double attdPer = (double)(total - attdCnt)/total*100;
        String formattedAttdPer = decimalFormat.format(attdPer);
        double stdyingPer = (double)stdyingCnt/total*100;
        String formattedStdyingPer = decimalFormat.format(stdyingPer);
        model.addAttribute("total", total);
        model.addAttribute("approveCnt", approveCnt);
        model.addAttribute("attdCnt", attdCnt);
        model.addAttribute("stdyingCnt", stdyingCnt);
        model.addAttribute("approvepercent", formattedApprovePer);
        model.addAttribute("attdpercent", formattedAttdPer);
        model.addAttribute("stdyingpercent", formattedStdyingPer);
        model.addAttribute("hotlec", hotlec);
        model.addAttribute("topstdn",topstdn);
        model.addAttribute("topfront",topfront);
        model.addAttribute("topback",topback);
//        model.addAttribute("recentlec",recentlec);

        return "index";
    }
    @RequestMapping("/logins")
    public String logins(Model model){
        model.addAttribute("center", "login");

        return "index";
    }

    @RequestMapping("/loginimpl")
    public String loginimpl(Model model, String id, String pwd, HttpSession session) throws Exception {
        Adm adm = null;
        String nextPage = "loginFail";
        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
        String currentDate = dateFormat.format(date);
        List<Stdn> approveList = new ArrayList<>();
        List<Stdn> totalList = stdnService.get();
        List<Stdn> lateList =stdnService.latestdn();
        List<Lec> hotlec = lecService.hotlec();
        Stdn topstdn = stdnService.topstdn();
        Stdn topfront = stdnService.topfront();
        Stdn topback = stdnService.topback();
        List<Stdy> stdyingList = stdyService.stdying();

        for (Stdn s:totalList) {
            if (s.getIsJoin().equals("0")) {
                approveList.add(s);
            }
        }

        int approveCnt = approveList.size();
        int attdCnt = lateList.size();
        int total = totalList.size();
        int stdyingCnt = stdyingList.size();
        double approvePer = (double)approveCnt/total*100;
        DecimalFormat decimalFormat = new DecimalFormat("#0.00");
        String formattedApprovePer = decimalFormat.format(approvePer);
        double attdPer = (double)(total - attdCnt)/total*100;
        String formattedAttdPer = decimalFormat.format(attdPer);
        double stdyingPer = (double)stdyingCnt/total*100;
        String formattedStdyingPer = decimalFormat.format(stdyingPer);
        try {
            adm = admService.get(id);
            if(adm != null && encoder.matches(pwd, adm.getPwd())){
                nextPage = "center";
            }
            session.setMaxInactiveInterval(60000);
            session.setAttribute("loginadm", adm);
            session.setAttribute("isLoggedIn", true);

            model.addAttribute("total", total);
            model.addAttribute("approveCnt", approveCnt);
            model.addAttribute("attdCnt", attdCnt);
            model.addAttribute("stdyingCnt", stdyingCnt);
            model.addAttribute("approvepercent", formattedApprovePer);
            model.addAttribute("attdpercent", formattedAttdPer);
            model.addAttribute("stdyingpercent", formattedStdyingPer);
            model.addAttribute("hotlec", hotlec);
            model.addAttribute("topstdn",topstdn);
            model.addAttribute("topfront",topfront);
            model.addAttribute("topback",topback);
        } catch (Exception e) {
            throw new Exception("adm login error");
        }
        model.addAttribute("center", nextPage);

        return "index";
    }

    @RequestMapping("logouts")
    public String logouts(Model model, HttpSession session){
        if (session != null){
            session.invalidate();
        }
        return "redirect:/";
    }
    @RequestMapping("/register")
    public String register(Model model){
        model.addAttribute("center", "register");
        return "index";
    }

    @RequestMapping("/toall")
    public String websocket(Model model){
        model.addAttribute("adminserver", adminserver);
        model.addAttribute("center", "toall");
        return "index";
    }
    @RequestMapping("/oneonone")
    public String oneonone(Model model){
        model.addAttribute("adminserver", adminserver);
        model.addAttribute("center", "oneonone");
        return "index";
    }
    @RequestMapping("/chatbot")
            public String chatbot(Model model){
        model.addAttribute("adminserver", adminserver);
        model.addAttribute("center", "chatbot");
        return "index";
    }
    @RequestMapping("/trypage")
    public String trypage(Model model) throws ParseException {
        model.addAttribute("center", "trypage");
        return "index";
    }

}
